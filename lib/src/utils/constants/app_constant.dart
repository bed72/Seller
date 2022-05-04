abstract class AppContants {
  static const String _appName = 'goSale_Buyer';

  // Key Storage
  static const String _keySharedPreferencesName = '$_appName@student';
  static const String keyExpiresIn = '$_keySharedPreferencesName@expires_in';
  static const String keyAccessToken =
      '$_keySharedPreferencesName@access_token';
  static const String keyRefreshToken =
      '$_keySharedPreferencesName@refresh_token';

  // Url's
  static const String urlHowgarts = 'url_howgarts';
  static const String urlMe = '/auth/v1/user';
  static const String urlAuthSignUp = '/auth/v1/signup';

  // Key Supabase
  static const String apikeyAnon = 'api_key_anon';
}
