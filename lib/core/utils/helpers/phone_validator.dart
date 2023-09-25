bool isValidPhoneNumber(String phone) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(phone)) {
    return false;
  } else {
    return true;
  }
}
