import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';

class FoodInfoCard extends StatelessWidget {
  final String name;
  final String brand;
  final int protein;
  final int fat;
  final int carbohydrates;

  const FoodInfoCard({
    Key? key,
    required this.name,
    required this.brand,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // Valor ajustável conforme necessário
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        elevation: 0, // Define a elevação do Card como 0 para evitar sombras duplicadas
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$brand',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'P: $protein G: $fat C: $carbohydrates',
                    style: TextStyle(
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
