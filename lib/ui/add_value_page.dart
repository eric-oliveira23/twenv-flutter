import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../components/appbar_title.dart';
import '../../components/main_content_header.dart';
import '../../components/textfield_title.dart';
import '../../cubit/add_value/add_value_cubit.dart';
import '../../util/date_formatter.dart';
import '../../util/price_formatter.dart';

class AddValuePage extends StatefulWidget {
  const AddValuePage({super.key});

  @override
  State<AddValuePage> createState() => _AddValuePageState();
}

class _AddValuePageState extends State<AddValuePage> {
  final MoneyMaskedTextController maskFormatter = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    decimalSeparator: ',',
    thousandSeparator: '.',
  );

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddValueCubit(),
      child: BlocBuilder<AddValueCubit, AddValueStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              title: const AppBarTitle(),
            ),
            body: MainContentContainer(
              enableMenu: false,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nova despesa do mês',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              const Text('Total de gastos: '),
                              Text(
                                priceFormatter(10.toString()),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Tooltip(
                                message: '5% a mais que o mês anterior',
                                child: SizedBox(
                                  height: 25,
                                  child: SvgPicture.asset(
                                    'assets/images/icon-up.svg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  MoneyTextField(maskFormatter: maskFormatter),
                  const SizedBox(height: 25),
                  const Row(
                    children: [
                      Text('Data da despesa'),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const DateButton(),
                  const SizedBox(height: 15),
                  TextFieldWithTitle(
                    title: 'Descrição da despesa',
                    controller: descriptionController,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AddValueCubit>().addButtonClicked(
                                  maskFormatter.text,
                                  context
                                      .read<AddValueCubit>()
                                      .picked
                                      .toString(),
                                  descriptionController.text,
                                  context,
                                );
                          },
                          child: state is AddValuesLoading
                              ? Lottie.asset(
                                  'assets/animations/loading_animation.json',
                                  width: 70,
                                )
                              : const Text('Adicionar'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancelar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
                    ? formatDate(state.date)
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

class MoneyTextField extends StatefulWidget {
  final MoneyMaskedTextController maskFormatter;

  const MoneyTextField({super.key, required this.maskFormatter});

  @override
  State<MoneyTextField> createState() => _MoneyTextFieldState();
}

class _MoneyTextFieldState extends State<MoneyTextField> {
  @override
  void initState() {
    super.initState();
    widget.maskFormatter.updateValue(0.00);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
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
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
      controller: widget.maskFormatter,
    );
  }
}
