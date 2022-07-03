class LoginDto {
  String? data;
  String? status;

  LoginDto({
    this.data,
    this.status,
  });

  LoginDto.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> response = <String, dynamic>{};
    response['data'] = data;
    response['status'] = status;
    return response;
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'data': data,
  //     'status': status,
  //   };
  // }
}
