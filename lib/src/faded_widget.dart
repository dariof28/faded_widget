import 'package:flutter/material.dart';

/// Gradient direction.
/// Top to bottom [GradientDirection.ttb]
/// Bottom to top [GradientDirection.btt]
/// Left to right [GradientDirection.ltr]
/// Right to left [GradientDirection.rtl]
enum GradientDirection { ttb, btt, ltr, rtl }

/// Render a Box with a [child] widget faded by [fade] colors gradient.
///
/// You can add an optional [margin] to the child widget.
class FadedWidget extends StatelessWidget {
  /// The widget to fade with gradient.
  final Widget child;

  /// An optional margin to apply to widget.
  final EdgeInsetsGeometry? margin;

  /// The height of the fade.
  /// You can for example set half in order to fade just half of the child.
  final double height;

  /// The width of the fade.
  /// You can for example set half in order to fade just half of the child.
  final double width;

  /// A list of colors to be applied as gradient for fade.
  final List<Color> fade;

  /// Define the direction (start to end) of the gradient fade.
  final GradientDirection direction;

  FadedWidget({
    required this.child,
    this.margin,
    required this.height,
    required this.width,
    required this.fade,
    GradientDirection? direction,
  })  : assert(height > 0),
        assert(width > 0),
        direction = direction ?? GradientDirection.ttb;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Container(margin: margin, child: child),
        Opacity(
          opacity: 0.25,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(gradient: gradient),
          ),
        ),
      ],
    );
  }

  LinearGradient get gradient {
    AlignmentGeometry begin = Alignment.topCenter;
    AlignmentGeometry end = Alignment.bottomCenter;

    switch (direction) {
      case GradientDirection.ttb:
        begin = Alignment.topCenter;
        end = Alignment.bottomCenter;
        break;
      case GradientDirection.btt:
        begin = Alignment.bottomCenter;
        end = Alignment.topCenter;
        break;
      case GradientDirection.ltr:
        begin = Alignment.centerLeft;
        end = Alignment.centerRight;
        break;
      case GradientDirection.rtl:
        begin = Alignment.centerRight;
        end = Alignment.centerLeft;
        break;
    }

    return LinearGradient(colors: fade, begin: begin, end: end);
  }
}
