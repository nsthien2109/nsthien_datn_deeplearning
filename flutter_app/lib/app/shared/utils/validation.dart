String? emailValidate(String val) {
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);
  if (val.isEmpty) {
    return 'Please enter email';
  } else if (!regExp.hasMatch(val)) {
    return 'Email Incorrect';
  }
  return null;
}

String? passwordValidate(String val) {
  if (val.isEmpty) {
    return 'Please enter your password';
  } else if (val.length < 6) {
    return 'Password must be minimum six characters';
  }
  return null;
}

String? textBoxValidate(String val) {
  if (val.isEmpty) {
    return 'Please enter this field';
  }
  return null;
}
