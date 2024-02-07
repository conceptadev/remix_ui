import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/remix_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixAlert,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 300,
      child: RemixAlert(
        title: StyledText(
          context.knobs.string(
            label: 'Title',
            initialValue: 'Error',
          ),
        ),
        subtitle: StyledText(
          context.knobs.string(
            label: 'Subtitle',
            initialValue: 'Your session has expired. Please log in again.',
          ),
        ),
        leading: context.knobs.boolean(
          label: 'Leading',
          initialValue: false,
        )
            ? const StyledIcon(Icons.warning_amber_rounded)
            : null,
      ),
    ),
  );
}
