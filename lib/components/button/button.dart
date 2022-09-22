import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.mix.dart';

class ButtonSize extends Variant {
  ButtonSize._(String name) : super(name);
  // Sizes
  static final xsmall = ButtonSize._('xsmallButtonVariant');
  static final small = ButtonSize._('smallButtonVariant');
  static final medium = ButtonSize._('mediumButtonVariant');
  static final large = ButtonSize._('largeButtonVariant');
}

class ButtonVariant extends Variant {
  ButtonVariant._(String name) : super(name);
  // Types
  static final solid = ButtonVariant._('solidButtonVariant');
  static final outline = ButtonVariant._('outlineButtonVariant');
  static final ghost = ButtonVariant._('ghostButtonVariant');
  static final link = ButtonVariant._('linkButtonVariant');
}

class Button extends RemixableWidget {
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
  }) : super(mix, key: key);

  final String? label;
  final bool isDisabled;
  final bool isLoading;
  final String? loadingLabel;
  final IconData? iconLeft;
  final IconData? iconRight;
  final ButtonVariant? variant;
  final ButtonSize? size;

  @override
  Mix get baseMix => buttonMix;

  Variant get _sizeVariant {
    return size ?? ButtonSize.xsmall;
  }

  Variant get _buttonVariant {
    return variant ?? ButtonVariant.solid;
  }

  @override
  Widget build(BuildContext context) {
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
          mix: mix,
          variants: [_sizeVariant, _buttonVariant],
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
