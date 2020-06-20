import 'package:flutter/material.dart';

class FieldValidators {
  static bool _emailPatternValidation(emailField) {
    const pattern =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    return !RegExp(pattern).hasMatch(emailField);
  }

  static bool _passwordPatternValidation(passwordField) {
    const pattern = r"";
    return !RegExp(pattern).hasMatch(passwordField);
  }

  static FormFieldValidator required({
    String errorText = 'Field is required.',
  }) {
    return (fieldValue) {
      if (fieldValue == null ||
          ((fieldValue is Iterable ||
                  fieldValue is Map ||
                  fieldValue is String) &&
              fieldValue.length == 0)) {
        return errorText;
      }
      return null;
    };
  }

  static FormFieldValidator emailValidator({
    String errorText = 'Email format is invalid.',
  }) {
    return (fieldValue) {
      if (_emailPatternValidation(fieldValue)) {
        return errorText;
      }
      return null;
    };
  }

  static FormFieldValidator passwordValidator({
    String errorText = 'Password is too weak.',
  }) {
    return (fieldValue) {
      if (_passwordPatternValidation(fieldValue)) {
        return errorText;
      }
      return null;
    };
  }

  static FormFieldValidator confirmPasswordValidator({
    // String passwordField,
    String otherPasswordField,
    String errorText = 'Password do not match.',
  }) {
    return (fieldValue) {
      print('Validating passwords equality: $fieldValue - $otherPasswordField');
      final arePasswordsEqual = fieldValue == otherPasswordField;
      print('areEqual $arePasswordsEqual');

      if (!arePasswordsEqual) {
        return errorText;
      }
      return null;
    };
  }

  static FormFieldValidator fullNameValidator({
    String errorText = 'First and last name required.',
  }) {
    return (fieldValue) {
      if ((fieldValue as String).trim().split(' ').length < 2) {
        return errorText;
      }
      return null;
    };
  }
}
