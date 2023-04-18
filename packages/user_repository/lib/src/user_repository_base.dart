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

  dynamic _getFromDisk(String key) {
    final value = get(key);

    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      setString(key, content);
    }
    if (content is bool) {
      setBool(key, content);
    }
    if (content is int) {
      setInt(key, content);
    }
    if (content is double) {
      setDouble(key, content);
    }
    if (content is List<String>) {
      setStringList(key, content);
    }
  }
}

class UserRepository {
  UserRepository({required this.sharedPreferences, required this.remoteApi});
  final SharedPreferences sharedPreferences;
  final PetFinderApi remoteApi;

  // sign in the user using the petfinder api and save the access token in shared preferences

  Future<void> signIn() async {
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

  // sign out the user by removing the access token from shared preferences
  Future<void> signOut() async {
    await sharedPreferences.remove(LocalStorageService.accessTokenKey);
    await sharedPreferences.remove(LocalStorageService.expiresInKey);
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
