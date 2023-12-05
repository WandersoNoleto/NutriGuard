import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/prescriptionItem.dart';

class PrescriptionHistoryPage extends StatelessWidget {
  const PrescriptionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: const Center(
          child: Text(
            'Histórico',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // Texto em branco
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Ícone em branco
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Conteúdo principal
          Expanded(
            child: ListView.builder(
              itemCount: 5, 
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
                  child: const PrescriptionItem(
                    date: '01/12/2023',
                    goal: 'Perda de Peso',
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}


