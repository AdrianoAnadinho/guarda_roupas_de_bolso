import 'package:flutter/material.dart';
import 'package:guarda_roupas_de_bolso/constants.dart';

import 'package:intl/intl.dart';

class DateRow extends StatelessWidget {
  final DateTime date;

  const DateRow({
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: AppColors.blue2,
            child: Text(
              DateFormat('dd/MM/yyyy').format(
                date,
              ),
              style: TextStyle(
                fontSize: 32.0,
                color: AppColors.brightOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
