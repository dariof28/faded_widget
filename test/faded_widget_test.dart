import 'package:faded_widget/faded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Height must be gt 0', (WidgetTester tester) async {
    List<Color> fade = [Colors.black, Colors.white];

    expect(
      () => FadedWidget(
        child: Text('Faded'),
        fade: fade,
        height: 0,
        width: 100,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('Width must be gt 0', (WidgetTester tester) async {
    List<Color> fade = [Colors.black, Colors.white];

    expect(
      () => FadedWidget(
        child: Text('Faded'),
        fade: fade,
        width: 0,
        height: 100,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('Direction is TopToBottom if not provided',
      (WidgetTester tester) async {
    List<Color> fade = [Colors.black, Colors.white];

    final widget = FadedWidget(
      child: Text('Faded'),
      fade: fade,
      height: 100,
      width: 100,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: widget),
      ),
    );

    WidgetPredicate predicate = (Widget widget) =>
        widget is FadedWidget && widget.direction == GradientDirection.ttb;

    expect(find.byWidgetPredicate(predicate), findsOneWidget);
  });

  group("Box decoration gradient matches provided direction", () {
    var inputs = {
      GradientDirection.ttb: {
        "begin": Alignment.topCenter,
        "end": Alignment.bottomCenter
      },
      GradientDirection.btt: {
        "begin": Alignment.bottomCenter,
        "end": Alignment.topCenter
      },
      GradientDirection.ltr: {
        "begin": Alignment.centerLeft,
        "end": Alignment.centerRight
      },
      GradientDirection.rtl: {
        "begin": Alignment.centerRight,
        "end": Alignment.centerLeft
      },
    };

    inputs.forEach((input, expected) {
      testWidgets("Testing $input", (WidgetTester tester) async {
        List<Color> fade = [Colors.black, Colors.white];

        final widget = FadedWidget(
          child: Text('Faded'),
          fade: fade,
          height: 100,
          width: 100,
          direction: input,
        );

        final expectedGradient = LinearGradient(
          colors: fade,
          begin: expected['begin'],
          end: expected['end'],
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: widget),
          ),
        );

        WidgetPredicate predicate = (Widget widget) =>
            widget is FadedWidget && widget.gradient == expectedGradient;

        expect(find.byWidgetPredicate(predicate), findsOneWidget);
      });
    });
  });
}
