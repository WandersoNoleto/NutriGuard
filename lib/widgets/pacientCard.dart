import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';

class PacientCard extends StatelessWidget {
  final String _name;
  final String _lastPrescption;
  final VoidCallback? callback;

  const PacientCard({
    Key? key,
    required String name,
    required String lastPrescption,
    VoidCallback? onPressed,
  })  : _name = name,
        _lastPrescption = lastPrescption,
        callback = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenHeight * 0.03), // 3% da altura da tela
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: screenHeight * 0.00, // 0.5% da altura da tela
            blurRadius: screenHeight * 0.01, // 1% da altura da tela
            offset: Offset(0, screenHeight * 0.005), // 1% da altura da tela
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenHeight * 0.01, // 1% da altura da tela
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenHeight * 0.03), // 3% da altura da tela
                bottomLeft: Radius.circular(screenHeight * 0.03), // 3% da altura da tela
              ),
            ),
          ),
          SizedBox(width: screenHeight * 0.0075), // 0.75% da altura da tela
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.015), // 1.5% da altura da tela
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    style: TextStyle(
                      fontSize: screenHeight * 0.02, // 2.4% da altura da tela
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0075), // 0.75% da altura da tela
                  Text(
                    'Última prescrição: $_lastPrescption',
                    style: TextStyle(
                      fontSize: screenHeight * 0.018, // 1.8% da altura da tela
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: screenHeight * 0.0075), // 0.75% da altura da tela
          Container(
            margin: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03, // 4% da altura da tela
              horizontal: screenHeight * 0.01, // 1% da altura da tela
            ),
            child: Center(
              child: Image.asset(
                'assets/prescriptionIcon.png',
                width: screenHeight * 0.04, // 2.4% da altura da tela
                height: screenHeight * 0.04, // 2.4% da altura da tela
              ),
            ),
          ),
        ],
      ),
    );
  }
}
