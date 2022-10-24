class ApiResponse {
  bool? isSuccessful;
  num? statusCode;
  String? statusMessage;

  ApiResponse({this.isSuccessful, this.statusCode, this.statusMessage});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    isSuccessful = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = isSuccessful;
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    return data;
  }
}

// {
//   "success": false,
//   "status_code": 7,
//   "status_message": "Invalid API key: You must be granted a valid key."
// }