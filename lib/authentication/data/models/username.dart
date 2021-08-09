import 'package:formz/formz.dart';

enum UsernameValidationError { empty, invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([String value = '']) : super.dirty(value);

  static final int length = 4;

  @override
  UsernameValidationError validator(String value) {
    if (value.length < length) {
      return UsernameValidationError.invalid;
    }
    return value?.isNotEmpty == true ? null : UsernameValidationError.empty;
  }
}
