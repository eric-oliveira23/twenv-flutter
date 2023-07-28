import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'add_value_states.dart';

class AddValueCubit extends Cubit<AddValueStates> {
  AddValueCubit() : super(AddValuesInitial());

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      helpText: 'Selecione a data',
      cancelText: 'Cancelar',
      currentDate: DateTime.now(),
    );

    if (picked != null) {
      emit(AddValuesDateSelected(picked));
    }
  }
}
