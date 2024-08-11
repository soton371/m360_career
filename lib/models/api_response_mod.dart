class ApiResponse<T> {
  bool? success;
  String? title;
  String? message;
  T? data;

  ApiResponse({this.success, this.title = "Failed", this.message, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json, Function fromJsonT) {
    return ApiResponse(
      success: json['success'],
      title: json['title'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}