// ignore_for_file: unnecessary_null_comparison

class Validators {
  static String? validateNumeric(String? value) {
    if (value!.trim().isEmpty) {
      return "Please provide a password";
    }
    if (!_isNumeric(value)) {
      return "Yovalueur price contains character";
    }

    return null;
  }

  static String? validateSimpleString(String? value) {
    if (value!.trim().isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }
}

bool _isNumeric(String str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}
