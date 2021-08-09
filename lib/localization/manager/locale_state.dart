part of 'locale_cubit.dart';

abstract class LocaleState extends Equatable {
  const LocaleState({@required this.locale});

  final Locale locale;
}

class SelectedLocale extends LocaleState {
  SelectedLocale(Locale locale) : super(locale: locale);

  @override
  List<Object> get props => [locale];
}
