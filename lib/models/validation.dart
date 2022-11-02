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
