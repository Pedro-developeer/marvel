import 'dart:convert';
import 'package:crypto/crypto.dart';

//Essa parte serve para gerar o hash md5 para a API da Marvel
String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
