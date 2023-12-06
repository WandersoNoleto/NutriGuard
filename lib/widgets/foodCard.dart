import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';

class FoodInfoCard extends StatelessWidget {
  final String name;
  final String brand;
  final dynamic protein;
  final double fat;
  final double carbohydrates;
  final double calories;

  const FoodInfoCard({
    Key? key,
    required this.name,
    required this.brand,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
    required this.calories
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${calories.toString()} kcal',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryGreen,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    brand,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'P: $protein G: $fat C: $carbohydrates',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
