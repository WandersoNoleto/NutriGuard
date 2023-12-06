import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';

class PrescriptionItem extends StatelessWidget {
  final String date;
  final String goal;

  const PrescriptionItem({Key? key, required this.date, required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 5,
      child: ListTile(
        leading: const Icon(Icons.picture_as_pdf, color: AppColors.primaryGreen),
        title: Text(date),
        subtitle: Text(goal),
        onTap: () {

        },
      ),
    );
  }
}