abstract class AppContants {
  static const String _appName = 'goSale_Buyer';

  // Key Storage
  static const String _keySharedPreferencesName = '$_appName@student';
  static const String keyAuth = '$_keySharedPreferencesName@bearer_tokens';

  // Url's
  static const String _urlHowgarts = 'https://naiwfnrkbtsmzllsvmxj.supabase.co';
  static const String urlAuthSignUp = '$_urlHowgarts/auth/v1/signup';
  static const String urlUser = '$_urlHowgarts/auth/v1/user';

  // Key Supabase
  static const String apikeyAnon =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5haXdmbnJrYnRzbXpsbHN2bXhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDk1MjEwNDIsImV4cCI6MTk2NTA5NzA0Mn0.pishVfRI0k6IE5BGFfMmkKdX1taqlJbLdttRG2gk0j8';
}
