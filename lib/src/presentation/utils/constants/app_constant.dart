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
  static const String urlUser = '/auth/v1/user';
  static const String urlAuthSignUp = '/auth/v1/signup';
  static const String urlHowgarts = 'https://naiwfnrkbtsmzllsvmxj.supabase.co';

  // Key Supabase
  static const String apikeyAnon =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5haXdmbnJrYnRzbXpsbHN2bXhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTA2NDQ4MjMsImV4cCI6MTk2NjIyMDgyM30.nvmqdU2FSdTzKHJ5_AJX7MIQmgyeEs5xpzXvO0BVXcw';
}
