import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../model/spending_model.dart';
import '../../util/capitalize_first_letter.dart';
import '../../util/price_formatter.dart';

class SpendingTile extends StatefulWidget {
  final SpendingModel spending;

  const SpendingTile({
    super.key,
    required this.spending,
  });

  @override
  State<SpendingTile> createState() => _SpendingTileState();
}

class _SpendingTileState extends State<SpendingTile> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String monthName = DateFormat('EEEE', 'pt_BR').format(widget.spending.date);
    String date = DateFormat('dd/MM', 'pt_BR').format(widget.spending.date);
    monthName = capitalizeFirstLetter(monthName);

    return Animate(
      effects: const [
        FadeEffect(
          duration: Duration(
            seconds: 1,
          ),
          curve: Curves.decelerate,
        ),
        SlideEffect(
          begin: Offset(0, 3),
          duration: Duration(
            seconds: 1,
          ),
          curve: Curves.decelerate,
        ),
      ],
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
          border: Border.all(
            color: Colors.white.withOpacity(0.15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(monthName),
                  Text(
                    priceFormatter(
                      widget.spending.value.toString(),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.spending.description),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
