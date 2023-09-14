import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_proj/app/utils/my_strings.dart';
class ApiClient{

  Future<dynamic> getAPI(String url) async {
    Map<String, String> requestHeaders = {
     contentType:applicationJson,
      key: keyVal
    };
      try {
        dynamic response = await http.get(Uri.parse(baseUrl+url),headers:requestHeaders);
        if (response != null && response.statusCode == 200) {
          return response.body;
        } else{
          return null;}
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
