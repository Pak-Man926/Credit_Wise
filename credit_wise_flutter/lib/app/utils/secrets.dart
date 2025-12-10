// lib/utils/secret_constants.dart
import 'package:encrypt/encrypt.dart';

// ⚠️ In a real app, these would be derived, split, or obfuscated heavily.
// KEY MUST be 32 bytes (256 bits) for AES-256
final secretKey = Key.fromUtf8('thisisasecretkeyforflutterapp123'); 

// IV MUST be 16 bytes (128 bits)
final secretIV = IV.fromUtf8('randomsalt123456');