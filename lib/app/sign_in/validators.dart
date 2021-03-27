abstract class StringValidator{
  bool isValid(String value);
}

class NonEmtyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmtyStringValidator();
  final StringValidator passwordValidator = NonEmtyStringValidator();
  final String invalidEmailErrorText = "Email can\'t be emty";
  final String invalidPasswordErrorText = "Password can\'t be emty";
}
