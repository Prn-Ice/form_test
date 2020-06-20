import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:form_test/common/helper_widgets/ui_helpers.dart';
import 'package:form_test/common/styling/app_colors.dart';
import 'package:form_test/common/styling/text_styles.dart';
import 'package:get/get.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'form_field_model.dart';

/// A [TextField] with an optional header text,
/// styled specially for this project.
class Field extends StatelessWidget {
  /// A [TextField] with an optional header text,
  /// styled specially for this project.
  const Field({
    Key key,
    this.isPasswordField = false,
    this.hintText,
    this.icon,
    this.headerText,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController]
  /// and initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController controller;

  /// The text displayed as the header,
  /// if this is null no header will be created.
  final String headerText;

  /// Placeholder text giving the user info as to what
  /// should be input for the field.
  final String hintText;

  /// Prefix [Icon] for this field.
  final IconData icon;

  /// Input formatters help to format the text that goes into the text field.
  /// A simple use-case would be forcing only numbers.
  final List<TextInputFormatter> inputFormatters;

  /// Whether this is a password input field.
  ///
  /// If this is true, a button to show or hide the text is displayed
  /// as the suffix icon.
  final bool isPasswordField;

  /// Validator function for this [TextFormField].
  ///
  /// ![If the user enters valid text, the TextField appears normally without any warnings to the user](https://flutter.github.io/assets-for-api-docs/assets/material/text_form_field.png)
  ///
  /// ![If the user enters invalid text, the error message returned from the validator function is displayed in dark red underneath the input](https://flutter.github.io/assets-for-api-docs/assets/material/text_form_field_error.png)
  final String Function(String) validator;

  /// Called whenever the [Field] is updated with a new value.
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormFieldViewModel>(
      init: FormFieldViewModel(),
      /* initState: (state) {
        if (isPasswordField) {
          FormFieldViewModel.to.toggleObscureText();
        }
      }, */
      global: false,
      builder: (model) {
        final formOutlineInputBorder = outlineInputBorder.copyWith(
          borderSide: BorderSide(
            color: model.isFocused ? azureRadiance : mercuryDarker,
          ),
        );

        final _buildHideButton = FlatButton.icon(
          padding: EdgeInsetsResponsive.only(left: 10.0),
          icon: Icon(
            Icons.remove_red_eye,
            color: model.obscureText ? midnight : smoky,
          ),
          onPressed: model.toggleObscureText,
          label: const SizedBox(),
        );

        final Widget _buildPrefixIcon = Padding(
          padding: EdgeInsetsResponsive.only(right: 5.0),
          child: Icon(
            icon,
            color: model.isFocused ? azureRadiance : smoky,
          ),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (headerText != null)
              Text(
                headerText,
                style: headline3,
              )
            else
              const SizedBox(),
            SizedBox(
              height: headerText != null ? responsiveHeight(10.5) : 0,
            ),
            TextFormField(
              enabled: true,
              inputFormatters: inputFormatters,
              controller: controller,
              obscureText: model.obscureText,
              style: subtitle1.copyWith(
                color: haiti,
              ),
              onTap: model.fieldFocused,
              onFieldSubmitted: model.lostFocus,
              decoration: inputDecoration.copyWith(
                hintText: hintText,
                prefixIcon: icon != null ? _buildPrefixIcon : null,
                suffixIcon: isPasswordField ? _buildHideButton : null,
                focusedBorder: formOutlineInputBorder,
                errorBorder: formOutlineInputBorder,
              ),
              validator: validator,
              onChanged: onChanged,
            ),
          ],
        );
      },
    );
  }
}
