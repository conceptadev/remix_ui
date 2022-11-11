import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.mix.dart';
import 'package:remix_ui/components/button/button.variants.dart';

class Button extends StatelessWidget {
  const Button({
    this.label,
    this.isDisabled = false,
    this.isLoading = false,
    this.iconLeft,
    this.iconRight,
    this.variant,
    this.size,
    this.loadingLabel,
    Key? key,
    Mix? mix,
  })  : _customMix = mix,
        super(key: key);

  final String? label;
  final bool isDisabled;
  final bool isLoading;
  final String? loadingLabel;
  final IconData? iconLeft;
  final IconData? iconRight;
  final ButtonType? variant;
  final ButtonSize? size;
  final Mix? _customMix;

  Mix get _mix {
    return buttonMix.maybeApply(_customMix);
  }

  Variant get _sizeVariant {
    return size ?? ButtonSize.xsmall;
  }

  Variant get _typeVariant {
    return variant ?? ButtonType.solid;
  }

  @override
  Widget build(BuildContext context) {
    // Render loading indicator
    List<Widget> renderLoading(MixContext mixContext) {
      final size = mixContext.iconProps.size;
      final color = mixContext.iconProps.color;
      return [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: size / 6,
            color: color,
          ),
        ),
        if (loadingLabel != null) TextMix(loadingLabel!),
      ];
    }

    return Pressable(
      onPressed: isDisabled || isLoading ? null : () {},
      child: MixContextBuilder(
          mix: _mix,
          variants: [_sizeVariant, _typeVariant],
          builder: (context, mixContext) {
            return HBox(
              inherit: true,
              children: isLoading
                  ? renderLoading(mixContext)
                  : <Widget>[
                      if (iconLeft != null) IconMix(iconLeft),
                      TextMix(label ?? ""),
                      if (iconRight != null) IconMix(iconRight),
                    ],
            );
          }),
    );
  }
}
