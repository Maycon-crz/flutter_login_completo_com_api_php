class LoginDTO {
  String? data;
  String? status;

  LoginDTO({
    this.data,
    this.status,
  });

  LoginDTO.fromJson(Map<String, dynamic> json) {
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
