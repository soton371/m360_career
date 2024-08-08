import 'package:logger/logger.dart';

Logger logger = Logger();

class AppUrls{
  static const String baseUrl = "http://192.168.0.104:8080/api";

  //for auth
  static const String sendOtp = "$baseUrl/auth/send_otp";
}