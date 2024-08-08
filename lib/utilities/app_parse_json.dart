import 'dart:convert';

import '../configs/configs.dart';
import '../models/models.dart';


ApiResponse<T> appParseJson<T>(String jsonString, Function fromJsonT) {
  try{
    final jsonData = json.decode(jsonString);
    return ApiResponse.fromJson(jsonData, fromJsonT);
  }on FormatException catch (e) {
    logger.e("appParseJson e: $e");
    return ApiResponse(success: false, message: "Invalid JSON format", title: "JSON Decoding Error");
  }
  catch(e, l){
    logger.e("appParseJson e: $e line: $l");
    return ApiResponse(success: false, message: "Failed to parse JSON data", title: "JSON Decoding Error");
  }
}