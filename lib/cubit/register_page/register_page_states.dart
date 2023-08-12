part of 'register_page_cubit.dart';

abstract class RegisterPageStates {}

class RegisterPageInitial extends RegisterPageStates {}

class RegisterPageLoading extends RegisterPageStates {}

class RegisterPageSuccess extends RegisterPageStates {
  final String message;

  RegisterPageSuccess({
    required this.message,
  });
}

class RegisterPageError extends RegisterPageStates {
  final String errorMessage;

  RegisterPageError({
    required this.errorMessage,
  });
}
