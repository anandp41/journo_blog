extension ExtString on String {
  bool get isValidEmail {
    // Regular expression for a valid email address
    RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    // Regular expression for a valid phone number (supports common formats)
    RegExp phoneRegExp = RegExp(
        r'^(\+\d{1,2}\s?)?(\(\d{3}\)|\d{3})([-.\s]?)\d{3}([-.\s]?)\d{4}$');
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    // Password should have at least 8 characters, including at least one uppercase letter, one lowercase letter, or be all digits
    RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])|(?=.*[A-Z])|(?=\d).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidName {
    // Name should only contain letters and spaces, and should not be empty
    RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$');
    return nameRegExp.hasMatch(this);
  }
}
