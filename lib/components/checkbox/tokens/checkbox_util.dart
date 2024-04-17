import 'package:mix/mix.dart';

import 'checkbox_attr.dart';

final $remix = RemixComponentTokens();

class RemixComponentTokens {
  final checkbox = CheckboxSpecUtility(
    (attr) => CheckboxSpecAttribute(
      flexContainer: attr.flexContainer,
      innerContainer: attr.innerContainer,
      icon: attr.icon,
      label: attr.label,
    ),
  );
}

class CheckboxSpecUtility<T extends SpecAttribute>
    extends SpecUtility<T, CheckboxSpecAttribute> {
  CheckboxSpecUtility(super.builder);

  BoxSpecUtility get innerContainer => BoxSpecUtility(
        (innerContainer) => only(innerContainer: innerContainer),
      );

  FlexSpecUtility get flexContainer => FlexSpecUtility(
        (flexContainer) => only(flexContainer: flexContainer),
      );

  IconSpecUtility get icon => IconSpecUtility(
        (icon) => only(icon: icon),
      );

  TextSpecUtility get label => TextSpecUtility(
        (label) => only(label: label),
      );

  @override
  T only({
    FlexSpecAttribute flexContainer = const FlexSpecAttribute(),
    BoxSpecAttribute innerContainer = const BoxSpecAttribute(),
    IconSpecAttribute icon = const IconSpecAttribute(),
    TextSpecAttribute label = const TextSpecAttribute(),
  }) {
    return builder(
      CheckboxSpecAttribute(
        flexContainer: flexContainer,
        innerContainer: innerContainer,
        icon: icon,
        label: label,
      ),
    );
  }
}
