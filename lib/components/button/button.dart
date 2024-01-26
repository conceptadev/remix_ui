import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.style.dart';
import 'package:remix_ui/components/button/button.variants.dart';

class RemixButton extends StatelessWidget {
  const RemixButton({
    super.key,
    this.label,
    this.isDisabled = false,
    this.isLoading = false,
    this.iconLeft,
    this.iconRight,
    this.type = ButtonType.primary,
    this.size = ButtonSize.xsmall,
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
  final ButtonType type;
  final ButtonSize size;
  final VoidCallback? onPressed;
  final ButtonStyles? _customStyle;

  List<Widget> _buildChildren(BuildContext context, ButtonStyles style) {
    if (isLoading) {
      return _buildLoadingChildren(context, style);
    }
    return _buildDefaultChildren(style);
  }

  List<Widget> _buildLoadingChildren(
    BuildContext context,
    ButtonStyles buttonStyle,
  ) =>
      [
        _buildLoadingIndicator(MixData.create(context, buttonStyle.icon)),
        if (loadingLabel != null)
          StyledText(
            loadingLabel!,
            style: buttonStyle.label,
          ),
      ];

  Widget _buildLoadingIndicator(MixData mix) {
    final icon = IconSpec.of(mix);
    const indicatorWidth = 2.5;

    return SizedBox(
      width: icon.size,
      height: icon.size,
      child: CircularProgressIndicator(
        strokeWidth: indicatorWidth,
        color: icon.color,
      ),
    );
  }

  List<Widget> _buildDefaultChildren(ButtonStyles style) => [
        if (iconLeft != null) StyledIcon(iconLeft, style: style.icon),
        if (label != null) StyledText(label!, style: style.label),
        if (iconRight != null) StyledIcon(iconRight, style: style.icon),
      ];

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyles.defaults().merge(_customStyle).selectVariants(
      [size, type],
    );
    return PressableBox(
      onPressed: isDisabled || isLoading ? null : onPressed,
      child: HBox(
        style: style.container,
        children: _buildChildren(context, style),
      ),
    );
  }
}
