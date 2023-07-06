import 'package:encrypt/encrypt.dart' as crypt;

class SecurityProvider {
  final _key = crypt.Key.fromUtf8('ekaYfUuqWtE9NVzZ1GNTqUvBgWaG2ZI4');
  final _iv = crypt.IV.fromLength(16);

  String encrypt(String plain) {
    final aes = crypt.Encrypter(crypt.AES(_key));
    final encrypted = aes.encrypt(plain, iv: _iv);
    return encrypted.base64;
  }

  String decrypt(String digest) {
    final aes = crypt.Encrypter(crypt.AES(_key));
    final decrypted = aes.decrypt(crypt.Encrypted.fromBase64(digest), iv: _iv);
    return decrypted;
  }
}