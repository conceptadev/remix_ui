import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix_ui/components/radio/radio.dart';

void main() {
  group('RemixRadio', () {
    testWidgets(
        'when pressed must call the onChanged with the oposite value of isChecked',
        (tester) async {
      const isActive = true;

      await tester.pumpWidget(
        MaterialApp(
          home: RemixRadio(
            active: isActive,
            label: 'Radio',
            onChanged: (value) {
              expect(value, !isActive);
            },
          ),
        ),
      );

      await tester.tap(find.byType(RemixRadio));
      await tester.pumpAndSettle(const Duration(milliseconds: 150));
    });

    testWidgets('when disabled must not call onChanged',
        (WidgetTester tester) async {
      bool didCallOnChanged = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RemixRadio(
            active: false,
            disabled: true,
            onChanged: (value) {
              didCallOnChanged = true;
            },
          ),
        ),
      ));

      await tester.tap(find.byType(RemixRadio));
      await tester.pumpAndSettle(const Duration(milliseconds: 150));

      expect(didCallOnChanged, isFalse);
    });

    testWidgets('initially checked or unchecked based on isChecked value',
        (WidgetTester tester) async {
      for (var isChecked in [true, false]) {
        await tester.pumpWidget(MaterialApp(
          home: RemixRadio(
            active: isChecked,
            label: 'Radio',
            onChanged: (value) {},
          ),
        ));

        expect(
          find.byWidgetPredicate(
            (widget) => widget is RemixRadio && widget.active == isChecked,
          ),
          findsOneWidget,
        );
      }
    });

    testWidgets('label is displayed correctly', (WidgetTester tester) async {
      const label = 'Test Radio';

      await tester.pumpWidget(MaterialApp(
        home: RemixRadio(
          active: false,
          label: label,
          onChanged: (value) {},
        ),
      ));

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == label,
        ),
        findsOneWidget,
      );
    });
  });
}
