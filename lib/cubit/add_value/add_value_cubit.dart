import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:twenv/model/spending_model.dart';

import '../../components/dialogs/warning_dialog.dart';
import '../../constants/messages.dart';

part 'add_value_states.dart';

class AddValueCubit extends Cubit<AddValueStates> {
  AddValueCubit() : super(AddValuesInitial());

  DateTime? picked;

  Future<void> selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
      helpText: 'Selecione a data',
      cancelText: 'Cancelar',
      currentDate: DateTime.now(),
    );

    if (picked != null) {
      emit(AddValuesDateSelected(picked!));
    }
  }

  void addButtonClicked(
    String value,
    String date,
    String description,
    BuildContext context,
  ) {
    if (date.isEmpty || value == 'R\$ 0,00' || description.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const WarningDialog(
            contentText: Messages.dataError,
            buttonText: Messages.dialogPositiveButtonText,
            isSuccess: false,
          );
        },
      );
      return;
    }

    List<SpendingModel> spendings = [];

    String formattedValue = value.replaceAll('R\$', '').replaceAll(',', '.');
    double convertedValue = double.parse(formattedValue);

    DateTime originalDate = DateTime.parse(date);

    // Convert to 'yyyy-MM-dd'
    String formattedDate =
        "${originalDate.year}-${originalDate.month.toString().padLeft(2, '0')}-${originalDate.day.toString().padLeft(2, '0')}";

    SpendingModel spendingModel = SpendingModel(
      description: description,
      date: formattedDate,
      value: convertedValue,
    );

    spendings.add(spendingModel);

    final FirebaseAuth auth = FirebaseAuth.instance;
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    DatabaseReference spendingsRef = databaseReference
        .child('users')
        .child(auth.currentUser!.uid)
        .child('earnings')
        .push();

    spendingsRef.set(spendingModel.toMap());

    Navigator.pop(context);
  }
}
