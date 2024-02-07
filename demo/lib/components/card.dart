import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/remix_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'interactive playground',
  type: RemixCard,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return const Center(
    child: SizedBox(
      width: 300,
      child: RemixCard(
        child: RemixListTile(
          leading: RemixAvatar(
            child: StyledText('LF'),
          ),
          title: StyledText('Title'),
          subtitle: StyledText('Subtitle'),
        ),
      ),
    ),
  );
}
