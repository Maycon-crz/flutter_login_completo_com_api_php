class GenericResponseDTO {
  String? data;
  String? status;

  GenericResponseDTO({
    this.data,
    this.status,
  });

  GenericResponseDTO.fromJson(Map<String, dynamic> json) {
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
