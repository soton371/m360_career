class ApiResponse<T> {
  bool? success;
  String? title;
  String? message;
  String? token;
  T? data;

  ApiResponse({this.success, this.title = "Failed", this.message, this.data, this.token});

  factory ApiResponse.fromJson(Map<String, dynamic> json, Function fromJsonT) {
    return ApiResponse(
      success: json['success'],
      title: json['title'],
      message: json['message'],
      token: json['token'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}