import 'dart:convert';
import 'dart:typed_data';

class ImageConstants {
  Uint8List decodeBase64(String encoded) {
    return base64.decode(encoded);
  }
}
