import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'radio.style.dart';
import 'radio.variants.dart';

class RemixRadio extends StatelessWidget {
  const RemixRadio({
    super.key,
    this.label,
    this.disabled = false,
    this.active = false,
    this.onChanged,
    RadioStyles? style,
  }) : _customStyle = style;

  final String? label;
  final bool disabled;
  final bool active;
  final ValueChanged<bool>? onChanged;

  final RadioStyles? _customStyle;

  @override
  Widget build(BuildContext context) {
    var variant = active ? RadioState.active : RadioState.inactive;

    final style =
        RadioStyles.defaults().merge(_customStyle).selectVariants([variant]);

    return PressableBox(
      onPressed:
          onChanged == null || disabled ? null : () => onChanged!(!active),
      child: HBox(
        style: style.row,
        children: [
          Box(
            style: style.outerContainer,
            child: AnimatedBox(
              style: style.innerContainer,
              duration: const Duration(milliseconds: 150),
              curve: Curves.bounceInOut,
            ),
          ),
          if (label != null)
            StyledText(
              label!,
              style: style.label,
            ),
        ],
      ),
    );
  }
}
