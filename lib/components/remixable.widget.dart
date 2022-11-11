import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

abstract class RemixableWidget extends StatelessWidget {
  const RemixableWidget({
    required Mix defaultMix,
    Mix? customMix,
    Key? key,
  })  : _defaultMix = defaultMix,
        _customMix = customMix,
        super(key: key);

  final Mix _defaultMix;
  final Mix? _customMix;

  Mix get mix => _defaultMix.maybeApply(_customMix);
}
