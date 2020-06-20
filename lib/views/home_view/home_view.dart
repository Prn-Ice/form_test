import 'package:flutter/material.dart';
import 'package:form_test/common/helper_widgets/ui_helpers.dart';
import 'package:form_test/common/stateless/button.dart';
import 'package:form_test/common/validators/base_validator.dart';
import 'package:form_test/common/validators/form_validators.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'widgets/form_field.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 812.0,
      width: 375.0,
      allowFontScaling: false,
    );

    return ResponsiveWidgets.builder(
      height: 812.0,
      width: 375.0,
      allowFontScaling: false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsetsResponsive.symmetric(horizontal: 20),
            child: Form(
              key: signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  verticalSpace(16.5),
                  Field(
                    controller: passwordController,
                    headerText: 'New Password',
                    hintText: 'Enter Password',
                    isPasswordField: true,
                    icon: Icons.lock,
                    validator: (value) => BaseValidator.validateFields(
                      value,
                      [
                        FieldValidators.required(),
                        FieldValidators.confirmPasswordValidator(
                          otherPasswordField: confirmPasswordController.text,
                        )
                      ],
                    ),
                  ),
                  verticalSpace(26.5),
                  Field(
                    controller: confirmPasswordController,
                    headerText: 'Confirm Password',
                    hintText: 'Enter Password',
                    isPasswordField: true,
                    icon: Icons.lock,
                    validator: (value) => BaseValidator.validateFields(
                      value,
                      [
                        FieldValidators.required(),
                        FieldValidators.confirmPasswordValidator(
                          otherPasswordField: passwordController.text,
                        )
                      ],
                    ),
                  ),
                  verticalSpace(26.5),
                  Button(
                    title: 'Validate',
                    onPressed: () {
                      // signUpFormKey.currentState.save();
                      signUpFormKey.currentState.validate();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
