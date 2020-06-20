import 'package:get/get.dart';

/// ViewModel for the [FormField].
class FormFieldViewModel extends GetController {
  static FormFieldViewModel get to => Get.find();

  bool _isFocused = false;
  bool _obscureText = false;

  /// Whether to show or hide the text.
  bool get obscureText => _obscureText;

  /// Whether the field is in focus.
  bool get isFocused => _isFocused;

  /// Toggle the value of [obscureText].
  void toggleObscureText() {
    if (_obscureText) {
      _obscureText = false;
    } else {
      _obscureText = true;
    }
    update();
  }

  /// Set the value of [isFocused] to true.
  void fieldFocused() {
    _isFocused = true;
    update();
  }

  /// Set the value of [isFocused] to false.
  void lostFocus(String value) {
    _isFocused = false;
    update();
  }
}
