import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:twenv/pages/add_value_page/add_value_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenv/util/price_formatter.dart';
import '../../components/main_content_header.dart';

class AddValuePage extends StatefulWidget {
  const AddValuePage({super.key});

  @override
  State<AddValuePage> createState() => _AddValuePageState();
}

class _AddValuePageState extends State<AddValuePage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddValueCubit(),
      child: Scaffold(
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
        body: MainContentContainer(
            child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nova despesa do mês',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Text('Total de gastos: '),
                        Text(
                          priceFormatter(10.toString()),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            DateButton(),
          ],
        )),
      ),
    );
  }
}

class DateButton extends StatelessWidget {
  const DateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddValueCubit, AddValueStates>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context.read<AddValueCubit>().selectDate(context),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(13),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.white.withOpacity(0.05),
            ),
            shape: MaterialStateProperty.all(
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
              Text(
                state is AddValuesDateSelected
                    ? state.date.toString()
                    : 'Selecione a data',
              ),
              const Icon(Icons.date_range),
            ],
          ),
        );
      },
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
