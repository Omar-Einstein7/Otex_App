import 'package:flutter/material.dart';

class LocaleState {
  final Locale locale;

  const LocaleState(this.locale);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocaleState &&
          runtimeType == other.runtimeType &&
          locale == other.locale;

  @override
  int get hashCode => locale.hashCode;
}