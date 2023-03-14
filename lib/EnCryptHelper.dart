import 'package:encrypt/encrypt.dart';

class EnCryptHelper{

  static String enCryptWithOutAmount(String userType,String code,String fullName){
    String  plainText = userType+","+code+","+getFullName(fullName);
    final key = Key.fromUtf8('081a49b37c56e2fd');
    final iv = IV.fromUtf8("190db824fe56c37a");
    final encrypter = Encrypter(AES(key,mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    print(decrypted);
    return encrypted.base16;
  }

  static String enCryptWithAmount(String userType,String code,String fullName,String amount){
    String  plainText = userType+","+code+","+getFullName(fullName)+","+amount;
    final key = Key.fromUtf8('081a49b37c56e2fd');
    final iv = IV.fromUtf8("190db824fe56c37a");
    final encrypter = Encrypter(AES(key,mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    print(decrypted);
    return encrypted.base16;
  }

  static String getFullName(String fullName){

    return fullName.replaceAll(" ", "-");
  }

  static String extractPayload(String payload) {

    final key = Key.fromUtf8('081a49b37c56e2fd');
    final iv = IV.fromUtf8("190db824fe56c37a");
    final encrypter = Encrypter(AES(key,mode: AESMode.cbc,padding: null));
    final decrypted = encrypter.decrypt(Encrypted.fromBase16(payload), iv: iv);
    return decrypted;
  }



}