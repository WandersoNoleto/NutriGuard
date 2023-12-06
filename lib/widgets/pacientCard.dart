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
        borderRadius: BorderRadius.circular(screenHeight * 0.03), 
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: screenHeight * 0.00, 
            blurRadius: screenHeight * 0.01, 
            offset: Offset(0, screenHeight * 0.005), 
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenHeight * 0.01, 
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenHeight * 0.03), 
                bottomLeft: Radius.circular(screenHeight * 0.03), 
              ),
            ),
          ),
          SizedBox(width: screenHeight * 0.0075), 
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.015), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    style: TextStyle(
                      fontSize: screenHeight * 0.02, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0075), 
                  Text(
                    'Ainda não há prescrições',
                    style: TextStyle(
                      fontSize: screenHeight * 0.018, 
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: screenHeight * 0.0075), 
          Container(
            margin: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03, 
              horizontal: screenHeight * 0.01, 
            ),
            child: Center(
              child: Image.asset(
                'assets/prescriptionIcon.png',
                width: screenHeight * 0.04, 
                height: screenHeight * 0.04, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
