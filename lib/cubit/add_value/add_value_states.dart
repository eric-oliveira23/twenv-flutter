part of 'add_value_cubit.dart';

abstract class AddValueStates {}

class AddValuesInitial extends AddValueStates {}

class AddValuesLoading extends AddValueStates {}

class AddValuesDateSelected extends AddValueStates {
  AddValuesDateSelected(this.date);

  final DateTime date;
}
