import 'package:flutter/material.dart';
import 'package:form_test/common/helper_widgets/ui_helpers.dart';
import 'package:form_test/common/styling/app_colors.dart';
import 'package:form_test/common/styling/text_styles.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

/// A custom [FlatButton].
///
/// Can be replaced by [MyIconButton].
class Button extends StatelessWidget {
  /// A [FlatButton] with [governorBay] color and [borderRadius5].
  const Button({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.color = governorBay,
  })  : assert(title != null, 'Button must have a title'),
        assert(onPressed != null, 'Button must have an onPressed callback'),
        super(key: key);

  /// Color of the button.
  final Color color;

  /// Title text for the button.
  final String title;

  /// Function executed when this button is pressed.
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius5,
      ),
      padding: EdgeInsetsResponsive.all(15.0),
      onPressed: onPressed,
      color: color,
      child: Text(
        title,
        style: button,
      ),
    );
  }
}
