String? passwordValidator(String? p0) {
  if (p0!.isEmpty) {
    return "This field is required";
  } else if (p0.length < 6) {
    return "Password must be at least 6 characters";
  } else if (p0.length > 20) {
    return "Password must be less than 20 characters";
  }
  return null;
}

String? confirmPasswordValidator(String? p0, String password) {
  if (p0!.isEmpty) {
    return "This field is required";
  } else if (p0 != password) {
    return "Password didn't match";
  }
  return null;
}

String? nameValidator(String? p0) {
  if (p0!.isEmpty) {
    return "This field is required";
  } else if (p0.length > 20) {
    return "Username must be less than 20 characters";
  }
  return null;
}

String? emailValidator(String? p0) {
  if (p0!.isEmpty) {
    return "This field is required";
  } else if (!p0.contains('@') || !p0.contains('.') || p0.startsWith('@')) {
    return "Please enter a valid email address";
  }
  return null;
}

String? wightValidator(String? p0) {
  if (p0!.isEmpty) {
    return "Invalid";
  } else if (double.parse(p0) < 20 || double.parse(p0) > 180) {
    return "Invalid Wight";
  }
  return null;
}

String? heightValidator(String? p0) {
  if (p0!.isEmpty) {
    return "Invalid";
  } else if (double.parse(p0) < 110 || double.parse(p0) > 230) {
    return "Invalid height";
  }
  return null;
}
