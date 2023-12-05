import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/pacientCard.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/searchBar.dart';
import 'package:nutri_guard/screens/pacientDetail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: const Center(
          child: Text(
            'Pacientes',
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

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02), // 5% da largura da tela
            child: const SearchBox(),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navegar para a PatientDetailsPage com o nome do paciente
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PacientDetailsPage(patientName: 'Paciente $index'),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
                    child: PacientCard(
                      name: 'Paciente $index',
                      lastPrescption: '29/11/2023',
                    ),
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
