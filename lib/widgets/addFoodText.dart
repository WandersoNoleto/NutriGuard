import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';

class AddFoodText extends StatelessWidget {
  final String mealName;
  final VoidCallback onTap;

  const AddFoodText({
    Key? key,
    required this.mealName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          '+ Adicionar',
          style: TextStyle(
            color: AppColors.primaryGreen, 
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
