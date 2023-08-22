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
    String dayName = DateFormat('EEEE', 'pt_BR').format(
      DateTime.parse(widget.spending.date),
    );

    String formattedDate = DateFormat('dd/MM/yyyy', 'pt_BR').format(
      DateTime.parse(widget.spending.date),
    );

    dayName = capitalizeFirstLetter(dayName);

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
                formattedDate,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dayName),
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
              Text(
                widget.spending.description,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
