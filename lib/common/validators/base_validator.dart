import 'package:flutter/material.dart';

class BaseValidator {
  static String validateFields(
      String fieldValue, List<FormFieldValidator> validators) {
    for (FormFieldValidator validator in validators) {
      String validationResult = validator(fieldValue);
      if (validationResult != null) {
        return validationResult;
      }
    }
    return null;
  }
}
