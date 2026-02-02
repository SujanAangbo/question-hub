class AppValidator {
  AppValidator._();

  // title validator
  static String? validateTitle(String? value, [String? title]) {
    if (value == null || value.isEmpty) {
      return '${title ?? 'Title'} is required';
    }

    if (value.trim().length < 4) {
      return '${title ?? 'Title'} must be at least 4 letters';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.trim().length < 6) {
      return 'Password must be at least 6 letters';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }

    if (value.trim().length < 6) {
      return 'Confirm password must be at least 6 letters';
    }

    if (value.compareTo(password.trim()) != 0) {
      return "Password and confirm password doesn't matched";
    }

    return null;
  }

  static String? requiredValidator(String? value, [String? title]) {
    if (value == null || value.isEmpty) {
      return '${title ?? 'Field'} is required';
    }

    return null;
  }

  static String? validateDescription(String? value, [String? title]) {
    if (value == null || value.isEmpty) {
      return '${title ?? 'Description'} is required';
    }

    if (value.trim().length < 8) {
      return '${title ?? 'Description'} must be of at least 8 letters';
    }

    return null;
  }

  // percentage validator
  static String? validatePercentage(String? value) {
    if (value == null || value.isEmpty) return 'Percentage is required';

    final percentageRegex =
        RegExp(r'^(100(\.0{1,2})?|[1-9][0-9]?(\.[0-9]{1,2})?)$');

    if (!percentageRegex.hasMatch(value)) return 'Percentage range from 1-100';

    return null;
  }

  // Email validator
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  // Phone validator (Nepal/International - 10 digits or more)
  static String? validatePhone(String? value, [bool isRequired = true]) {
    if (value == null || value.isEmpty) {
      if (isRequired) {
        return 'Phone number is required';
      } else {
        return null;
      }
    }
    final phoneRegex = RegExp(r'^\d{7,15}$');
    if (!phoneRegex.hasMatch(value)) return 'Enter a valid phone number';
    return null;
  }
}
