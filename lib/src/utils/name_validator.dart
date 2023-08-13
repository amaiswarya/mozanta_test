class Validation {
  bool isValidName(String string) {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,})*$");
    if (!nameRegExp.hasMatch(string)) {
      return false;
    }
    return true;
  }
}
