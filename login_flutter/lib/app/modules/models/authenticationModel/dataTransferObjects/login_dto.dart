class LoginDTO {
  String? frontEnd;
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? statusUser;
  String? pass;
  String? token;
  int? hierarchy;
  String? appKey;
  String? status;
  String? msg;

  LoginDTO({
    this.frontEnd,
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.statusUser,
    this.pass,
    this.token,
    this.hierarchy,
    this.appKey,
    this.status,
    this.msg,
  });

  factory LoginDTO.fromMap(Map<String?, dynamic> map) {
    return LoginDTO(
      id: map["id"],
      fullName: map["full_name"],
      email: map["email"],
      phone: map["phone"],
      statusUser: map["status_user"],
      pass: map["pass"],
      token: map["token"],
      hierarchy: map["hierarchy"],
      appKey: map["app_key"],
      status: map["status"],
      msg: map["msg"],
    );
  }
}
