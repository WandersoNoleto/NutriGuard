import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/screens/historyPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PacientDetailsPage extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> pacientSnapshot;

  const PacientDetailsPage({Key? key, required this.pacientSnapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String patientName = pacientSnapshot['name'];
    int age            = pacientSnapshot['age'];
    double weight = pacientSnapshot['weight'];
    double height = pacientSnapshot['height'];
    String activityLevel = pacientSnapshot['activityLevel'];
    String phoneNumber   = pacientSnapshot['phoneNumber'];

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth  = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: const Center(
          child: Text(
            'Detalhes do Paciente',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.075),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Parte acima da linha
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenHeight * 0.015),
                        topRight: Radius.circular(screenHeight * 0.015),
                      ),
                    ),
                    padding: EdgeInsets.all(screenHeight * 0.018),
                    child: Center(
                      child: Text(
                        patientName,
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(screenHeight * 0.018),
                    color: Colors.white, 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.018),
                        Text('Idade: $age anos', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.018),
                        Text('Peso: $weight kg', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.018),
                        Text('Altura: $height m', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.018),
                        Text('Nível de Atividade Física: $activityLevel', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.018),
                        Text('Número: $phoneNumber', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.018),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Botões
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.015),
                child: ActionButton(
                  label: 'Prescrever Dieta',
                  onPressed: () {
                    // Lógica para o botão "Prescrever Dieta"
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.018),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: ActionButton(
                  label: 'Histórico',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrescriptionHistoryPage(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.018),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
