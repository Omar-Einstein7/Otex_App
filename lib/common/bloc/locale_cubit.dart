import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optex_app/common/bloc/locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState(Locale('ar', '')));

  void toEnglish() => emit(const LocaleState(Locale('en', '')));
  void toArabic() => emit(const LocaleState(Locale('ar', '')));
}