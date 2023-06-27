class GenericResponse {
  String? data;
  String? status;

  GenericResponse({
    this.data,
    this.status,
  });

  GenericResponse.fromJson(Map<String, dynamic> json) {
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
