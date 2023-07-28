import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:twenv/pages/add_value_page/add_value_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddValuePage extends StatefulWidget {
  const AddValuePage({super.key});

  @override
  State<AddValuePage> createState() => _AddValuePageState();
}

class _AddValuePageState extends State<AddValuePage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.white,
            size: 31,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<AddValueCubit, AddValueStates>(
          builder: (context, state) {
            if (state is AddValuesDateSelected) {
              // Se o estado é AddValuesDateSelected, exibe a data selecionada
              return ElevatedButton(
                onPressed: () =>
                    context.read<AddValueCubit>().selectDate(context),
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.all(13),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.white.withOpacity(0.05),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(11),
                      ),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.date.toString()),
                    const Icon(Icons.date_range),
                  ],
                ),
              );
            } else {
              // Caso contrário, exibe o botão para selecionar a data
              return ElevatedButton(
                onPressed: () =>
                    context.read<AddValueCubit>().selectDate(context),
                child: const Text('Selecionar Data'),
              );
            }
          },
        ),
      ),
    );
  }
}

class ValueTextField extends StatefulWidget {
  const ValueTextField({
    super.key,
  });

  @override
  State<ValueTextField> createState() => _ValueTextFieldState();
}

class _ValueTextFieldState extends State<ValueTextField> {
  final maskFormatter = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    decimalSeparator: ',',
    thousandSeparator: '.',
  );

  @override
  void initState() {
    super.initState();
    maskFormatter.updateValue(0.00);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 23,
      ),
      controller: maskFormatter,
    );
  }
}
