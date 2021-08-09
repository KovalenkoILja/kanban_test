import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  static final int length = 8;

  @override
  PasswordValidationError validator(String value) {
    if (value.length < length) {
      return PasswordValidationError.invalid;
    }
    return value?.isNotEmpty == true ? null : PasswordValidationError.empty;
  }
}
