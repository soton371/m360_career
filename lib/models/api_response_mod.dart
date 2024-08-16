class ApiResponseModel<T> {
  bool? success;
  String? title;
  String? message;
  T? data;

  ApiResponseModel({this.success, this.title = "Failed", this.message, this.data});

  factory ApiResponseModel.fromJson(Map<String, dynamic> json, Function fromJsonT) {
    return ApiResponseModel(
      success: json['success'],
      title: json['title'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}