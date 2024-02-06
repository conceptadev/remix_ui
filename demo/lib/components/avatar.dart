import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/remix_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'with title and icon',
  type: RemixAvatar,
)
Widget buildCheckboxUseCase(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RemixAvatar(
          style: AvatarStyles(
            container: Style(
              box.height(60),
              box.width(60),
              box.borderRadius(20),
              box.color(
                Colors.cyanAccent.shade200.withAlpha(60),
              ),
            ),
            icon: Style(
              icon.color(Colors.cyanAccent),
            ),
          ),
          child: const StyledIcon(Icons.person),
        ),
        const SizedBox(width: 10),
        RemixAvatar(
          style: AvatarStyles.base().copyWith(
            container: Style(
              box.height(50),
              box.width(50),
            ),
            icon: Style(
              icon.size(30),
            ),
          ),
          child: const StyledIcon(Icons.access_alarms_rounded),
        ),
        const SizedBox(width: 10),
        RemixAvatar(
          backgroundImage: const NetworkImage(
            'https://avatars.githubusercontent.com/u/14010287?v=4',
          ),
          style: AvatarStyles.base().copyWith(
            container: Style(
              box.height(40),
              box.width(40),
            ),
            icon: Style(
              icon.size(30),
            ),
          ),
          // child: const StyledIcon(Icons.access_alarms_rounded),
        ),
      ],
    ),
  );
}
