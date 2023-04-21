import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petfinder_api/petfinder_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// shared preferences service
final sharedPreferencesServiceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

/// extension on shared preferences
extension LocalStorageService on SharedPreferences {
  static const String accessTokenKey = 'accessTokenKey';
  static const String expiresInKey = 'expiresIn';

  Future<void> saveAccessToken(String accessToken) async {
    await setString(accessTokenKey, accessToken);
  }

  String? getAccessToken() {
    return getString(accessTokenKey);
  }

  Future<void> saveExpiresIn(int expiresIn) async {
    await setInt(expiresInKey, expiresIn);
  }

  int? getExpiresIn() {
    return getInt(expiresInKey);
  }

  // return true if access token is expired
  bool isAccessTokenExpired() {
    final expiresIn = getExpiresIn();
    if (expiresIn == null) {
      return true;
    }
    final accessToken = getAccessToken();
    if (accessToken == null) {
      return true;
    }
    return DateTime.now().millisecondsSinceEpoch > expiresIn;
  }
}

class UserRepository {
  UserRepository({required this.sharedPreferences, required this.remoteApi});
  final SharedPreferences sharedPreferences;
  final PetFinderApi remoteApi;

  // sign out the user by removing the access token from shared preferences
  Future<void> signOut() async {
    await sharedPreferences.remove(LocalStorageService.accessTokenKey);
    await sharedPreferences.remove(LocalStorageService.expiresInKey);
  }

  // check is the user is signed in
  bool isSignedIn() {
    return !sharedPreferences.isAccessTokenExpired();
  }

  // refresh the access token
  Future<void> refreshToken() async {
    final response = await remoteApi.getAuthToken(
      clientId: ApiConstants.clientId,
      clientSecret: ApiConstants.clientSecret,
      grantType: ApiConstants.grantType,
    );
    print('access token: ${response.accessToken}');
    if (response.accessToken == null || response.expiresIn == null) {
      throw Exception('access token is null');
    }
    await sharedPreferences.saveAccessToken(response.accessToken!);
    await sharedPreferences.saveExpiresIn(response.expiresIn!);
  }
}

// reiverpod provider for the user repository
final userRepositoryPod = Provider<UserRepository>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesServiceProvider);
  final remoteApi = ref.watch(apiPod);
  return UserRepository(
    sharedPreferences: sharedPreferences,
    remoteApi: remoteApi,
  );
});
