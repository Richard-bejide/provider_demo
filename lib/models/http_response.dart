class HTTPResponse<T> {
  bool? isSuccessful;
  T? data;
  String? message;
  int? responseCode;

  HTTPResponse({this.data, this.isSuccessful, this.message, this.responseCode});
}
