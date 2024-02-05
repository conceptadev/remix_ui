import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/remix_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixBadge,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return Center(
    child: RemixBadge(
      label: context.knobs.stringOrNull(
        label: "Label",
        initialValue: "Label",
      ),
      leadingIcon: context.knobs.boolean(
        label: "Leading icon",
        initialValue: false,
      )
          ? const StyledIcon(Icons.star_rounded)
          : null,
      trailingIcon: context.knobs.boolean(
        label: "Trailing icon",
        initialValue: false,
      )
          ? const StyledIcon(Icons.alarm)
          : null,
    ),
  );
}
