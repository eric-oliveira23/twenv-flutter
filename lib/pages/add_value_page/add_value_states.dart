part of 'add_value_cubit.dart';

abstract class AddValueStates {}

class AddValuesInitial extends AddValueStates {}

class AddValuesLoading extends AddValueStates {}

class AddValuesSuccess extends AddValueStates {}

class AddValuesDateSelected extends AddValueStates {
  AddValuesDateSelected(this.date);

  final DateTime date;
}

class AddValuesError extends AddValueStates {
  AddValuesError(this.message);

  final String message;
}
