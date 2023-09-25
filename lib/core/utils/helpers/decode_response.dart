import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saudi_clean_services_owner/core/errors/exceptions.dart';

class DecodeResponse {
  
  static Map<String,dynamic> decode(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return jsonDecode(response.body);
    } else {
      print('decoding....');
      final errorData = jsonDecode(response.body);
      String errorMessage = errorData['message'];
      throw CustomException(message: errorMessage);
    }
  }
}
