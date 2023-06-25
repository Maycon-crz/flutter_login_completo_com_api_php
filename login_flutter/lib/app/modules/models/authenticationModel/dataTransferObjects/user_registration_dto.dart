class UserRegistrationDTO {
  String? fullName;
  String? email;
  String? emailConf;
  String? password;
  String? passwordConf;
  String? terms;

  UserRegistrationDTO({
    this.fullName,
    this.email,
    this.emailConf,
    this.password,
    this.passwordConf,
    this.terms,
  });
}
