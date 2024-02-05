import 'package:flutter/material.dart';
import 'package:remix_ui/remix_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixButton,
)
Widget buildButtonUseCase(BuildContext context) {
  return Center(
    child: RemixButton(
      label: context.knobs.stringOrNull(
        label: 'Title',
        initialValue: 'Title',
      ),
      onPressed: () {},
      isLoading: context.knobs.boolean(
        label: 'Is loading',
        initialValue: false,
      ),
      loadingLabel: context.knobs.stringOrNull(
        label: 'Loading label',
        initialValue: 'Loading',
      ),
      isDisabled: context.knobs.boolean(
        label: 'Disabled',
        initialValue: false,
      ),
      size: context.knobs.list(
        label: 'Size',
        options: ButtonSize.values,
        labelBuilder: (value) => value.name.split('.').last,
      ),
      type: context.knobs.list(
        label: 'Type',
        options: ButtonType.values,
        labelBuilder: (value) => value.name.split('.').last,
      ),
    ),
  );
}
