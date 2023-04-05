import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

abstract class TextStyleResolverWidget extends StatelessWidget {
  const TextStyleResolverWidget(
    this.text, {
    this.style,
    super.key,
  });

  final String text;
  final StyleMix? style;

  TextStyleToken get token;

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      textStyle(as: token),
    ).mergeNullable(this.style);

    return TextMix(text, mix: style);
  }
}

class Headline1 extends TextStyleResolverWidget {
  const Headline1(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.headline1;
}

class Headline2 extends TextStyleResolverWidget {
  const Headline2(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.headline2;
}

class Headline3 extends TextStyleResolverWidget {
  const Headline3(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.headline3;
}

class Headline4 extends TextStyleResolverWidget {
  const Headline4(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.headline4;
}

class Headline5 extends TextStyleResolverWidget {
  const Headline5(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.headline5;
}

class Headline6 extends TextStyleResolverWidget {
  const Headline6(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.headline6;
}

class Subtitle1 extends TextStyleResolverWidget {
  const Subtitle1(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.subtitle1;
}

class Subtitle2 extends TextStyleResolverWidget {
  const Subtitle2(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.subtitle2;
}

class BodyText1 extends TextStyleResolverWidget {
  const BodyText1(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.bodyText1;
}

class BodyText2 extends TextStyleResolverWidget {
  const BodyText2(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.bodyText2;
}

class Caption extends TextStyleResolverWidget {
  const Caption(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.caption;
}

class Button extends TextStyleResolverWidget {
  const Button(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.button;
}

class OverLine extends TextStyleResolverWidget {
  const OverLine(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M2Text.overline;
}

// Material 3 Typeset

class DisplaySmall extends TextStyleResolverWidget {
  const DisplaySmall(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.displaySmall;
}

class DisplayMedium extends TextStyleResolverWidget {
  const DisplayMedium(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.displayMedium;
}

class DisplayLarge extends TextStyleResolverWidget {
  const DisplayLarge(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.displayLarge;
}

class HeadlineSmall extends TextStyleResolverWidget {
  const HeadlineSmall(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.headlineSmall;
}

class HeadlineMedium extends TextStyleResolverWidget {
  const HeadlineMedium(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.headlineMedium;
}

class HeadlineLarge extends TextStyleResolverWidget {
  const HeadlineLarge(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.headlineLarge;
}

class TitleSmall extends TextStyleResolverWidget {
  const TitleSmall(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.titleSmall;
}

class TitleMedium extends TextStyleResolverWidget {
  const TitleMedium(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.titleMedium;
}

class TitleLarge extends TextStyleResolverWidget {
  const TitleLarge(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.titleLarge;
}

class BodySmall extends TextStyleResolverWidget {
  const BodySmall(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.bodySmall;
}

class BodyMedium extends TextStyleResolverWidget {
  const BodyMedium(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.bodyMedium;
}

class BodyLarge extends TextStyleResolverWidget {
  const BodyLarge(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.bodyLarge;
}

class LabelSmall extends TextStyleResolverWidget {
  const LabelSmall(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.labelSmall;
}

class LabelMedium extends TextStyleResolverWidget {
  const LabelMedium(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.labelMedium;
}

class LabelLarge extends TextStyleResolverWidget {
  const LabelLarge(
    super.text, {
    super.style,
    super.key,
  });

  @override
  get token => $M3Text.labelLarge;
}
