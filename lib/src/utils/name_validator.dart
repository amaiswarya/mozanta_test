import '../models/person_models.dart';

class Validation {
  bool isValidName(String string) {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,})*$");
    if (!nameRegExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  bool isNameExist(List<TimerModel> listData, String string) {
    return !listData.any((file) => file.name.contains(string));
  }
}
