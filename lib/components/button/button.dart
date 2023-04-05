import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.style.dart';
import 'package:remix_ui/components/button/button.variants.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.label,
    this.isDisabled = false,
    this.isLoading = false,
    this.iconLeft,
    this.iconRight,
    this.variant,
    this.size,
    this.loadingLabel,
    required this.onPressed,
    ButtonStyles? style,
  }) : _customStyle = style;

  final String? label;
  final bool isDisabled;
  final bool isLoading;
  final String? loadingLabel;
  final IconData? iconLeft;
  final IconData? iconRight;
  final ButtonType? variant;
  final ButtonSize? size;
  final VoidCallback? onPressed;
  final ButtonStyles? _customStyle;

  /// Build the child widgets based on [isLoading] state
  List<Widget> _buildChildren(ButtonStyles style) {
    if (isLoading) {
      return _buildLoadingChildren(style);
    }
    return _buildDefaultChildren(style);
  }

  /// Build the loading state child widgets
  List<Widget> _buildLoadingChildren(ButtonStyles style) => [
        MixBuilder(
          mix: style.icon,
          builder: (mix) => _buildLoadingIndicator(mix),
        ),
        if (loadingLabel != null) TextMix(loadingLabel!, mix: style.label),
      ];

  /// Build the loading indicator
  Widget _buildLoadingIndicator(MixData mix) {
    final icon = IconDescriptor.fromContext(mix);

    return SizedBox(
      width: icon.size,
      height: icon.size,
      child: CircularProgressIndicator(
        strokeWidth: icon.size / 6,
        color: icon.color,
      ),
    );
  }

  /// Build the default state child widgets (non-loading)
  List<Widget> _buildDefaultChildren(ButtonStyles style) => [
        if (iconLeft != null) IconMix(iconLeft, mix: style.icon),
        TextMix(label ?? "", mix: style.label),
        if (iconRight != null) IconMix(iconRight, mix: style.icon),
      ];

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyles.defaults().merge(_customStyle).selectVariants(
      [size ?? ButtonSize.xsmall, variant ?? ButtonType.solid],
    );

    return Pressable(
      onPressed: isDisabled || isLoading ? null : onPressed,
      child: HBox(
        mix: style.container,
        children: _buildChildren(style),
      ),
    );
  }
}
