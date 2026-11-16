class Validator {
  // static String? validateName(String? value) {
  //   if (value == null || value.isEmpty) return 'Name is required.';
  //   return null;
  // }

  // static String? validatePhone(String? value) {
  //   if (value == null || value.isEmpty) return 'Phone number is required.';
  //   if (value.length < 10) return 'Phone number is too short.';
  //   return null;
  // }

  // static String? validatePassword(String? value) {
  //   if (value == null || value.isEmpty) return 'Password is required.';
  //   if (value.length < 6) return 'Password must be at least 6 characters.';
  //   return null;
  // }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Full name cannot be empty';
    }
    if (!RegExp(r'^[a-zA-Z ]+\$').hasMatch(name)) {
      return 'Full name must contain only letters and spaces';
    }
    return null;
  }

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$');
    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
