import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'switch.style.dart';
import 'switch.variants.dart';

class RemixSwitch extends StatelessWidget {
  const RemixSwitch({
    super.key,
    this.disabled = false,
    this.active = false,
    this.onChanged,
    SwitchStyles? style,
  }) : _customStyle = style;

  final bool disabled;
  final bool active;
  final ValueChanged<bool>? onChanged;

  final SwitchStyles? _customStyle;

  void Function()? _handleOnChange() {
    return onChanged == null || disabled ? null : () => onChanged!(!active);
  }

  @override
  Widget build(BuildContext context) {
    var variant = active ? SwitchState.active : SwitchState.inactive;

    final style = SwitchStyles.build(_customStyle, [variant]);

    return PressableBox(
      onPressed: _handleOnChange,
      style: style.outerContainer,
      child: Box(
        style: style.innerContainer,
      ),
    );
  }
}
