import 'package:logger/logger.dart';

Logger logger = Logger();

class AppUrls{
  static const String baseUrl = "localhost:8080";

  //for auth
  static const String sendOtp = "$baseUrl/auth/send_otp";
}