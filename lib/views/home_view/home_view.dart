import 'package:flutter/material.dart';
import 'package:form_test/common/helper_widgets/ui_helpers.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'widgets/form_field.dart';

class HomeView extends StatelessWidget {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Field(
                  headerText: 'Old Password',
                  hintText: 'Enter Password',
                  isPasswordField: true,
                  icon: Icons.lock,
                ),
                verticalSpace(16.5),
                Field(
                  headerText: 'New Password',
                  hintText: 'Enter Password',
                  isPasswordField: true,
                  icon: Icons.lock,
                ),
                verticalSpace(26.5),
                Field(
                  headerText: 'Confirm Password',
                  hintText: 'Enter Password',
                  isPasswordField: true,
                  icon: Icons.lock,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
