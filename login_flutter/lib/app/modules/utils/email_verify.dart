class EmailVerify {
  static bool verification(String? email) {
    if (email != null &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
      return true;
    }
    return false;
  }
}
