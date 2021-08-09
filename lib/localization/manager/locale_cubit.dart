import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(SelectedLocale(Locale('en')));

  void toRussian() => emit(SelectedLocale(Locale('ru')));

  void toEnglish() => emit(SelectedLocale(Locale('en')));
}
