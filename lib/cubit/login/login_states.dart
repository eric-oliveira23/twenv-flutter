part of 'login_cubit.dart';

abstract class LoginPageStates {}

class LoginStatesInitial extends LoginPageStates {}

class LoginStatesLoading extends LoginPageStates {}

class LoginStatesSuccess extends LoginPageStates {
  final String? message;

  LoginStatesSuccess({
    this.message,
  });
}

class LoginStatesError extends LoginPageStates {
  final String errorMessage;

  LoginStatesError({
    required this.errorMessage,
  });
}
