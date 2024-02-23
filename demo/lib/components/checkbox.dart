import 'package:flutter/material.dart';
import 'package:remix_ui/remix_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixCheckbox,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return Center(
    child: RemixCheckbox(
      label: context.knobs.stringOrNull(
        label: 'Title',
        initialValue: 'Title',
      ),
      onChanged: (value) {},
      checked: context.knobs.boolean(
        label: 'Checked',
        initialValue: false,
      ),
      disabled: context.knobs.boolean(
        label: 'Disabled',
        initialValue: false,
      ),
    ),
  );
}
