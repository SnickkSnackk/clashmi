// Panel login is unavailable in this build, so there is never auth data to
// keep. Nothing is persisted instead of storing it unprotected.
class Crypto {
  static String encrypt(String key, String data) => "";

  static String decrypt(String key, String data) => "";
}
