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
  static const String lastTokenTimestampKey = 'lastTokenTimestamp';

  Future<void> saveAccessToken(String accessToken) async {
    await setString(accessTokenKey, accessToken);
  }

  String? getAccessToken() {
    return getString(accessTokenKey);
  }

  Future<void> saveExpiresIn(int expiresIn) async {
    await setInt(expiresInKey, expiresIn);
  }

  Future<void> saveLastTokenTimestamp(int expiresIn) async {
    await setInt(lastTokenTimestampKey, expiresIn);
  }

  int? getExpiresIn() {
    return getInt(expiresInKey);
  }

// Return true if the access token is expired
// compare the current time with the last token timestamp + the expires in value
  bool isAccessTokenExpired() {
    final lastTokenTimestamp = getInt(lastTokenTimestampKey);
    final expiresIn = getInt(expiresInKey);
    if (lastTokenTimestamp == null || expiresIn == null) {
      return true;
    }
    final now = DateTime.now().millisecondsSinceEpoch;
    final expiresAt = lastTokenTimestamp + (expiresIn * 1000);
    return now > expiresAt;
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
    if (response.accessToken == null || response.expiresIn == null) {
      throw Exception('access token is null');
    }
    await sharedPreferences.saveAccessToken(response.accessToken!);
    await sharedPreferences.saveExpiresIn(response.expiresIn!);
    await sharedPreferences.saveLastTokenTimestamp(
      DateTime.now().millisecondsSinceEpoch,
    );
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
