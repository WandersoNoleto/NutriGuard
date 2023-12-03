import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/screens/historyPage.dart';

class PacientDetailsPage extends StatelessWidget {
  final String patientName;

  // Construtor que recebe o nome do paciente
  const PacientDetailsPage({Key? key, required this.patientName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: Center(
          child: Text(
            'Detalhes do Paciente',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // Texto em branco
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), 
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
                    padding: EdgeInsets.all(screenHeight * 0.018), // 
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

                  // Parte abaixo da linha
                  Padding(
                    padding: EdgeInsets.all(screenHeight * 0.018),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.009), 
                        Text('Idade: 25', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.009), 
                        Text('Peso: 70 kg', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.009), 
                        Text('Altura: 1.75 m', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.009), 
                        Text('Nível de Atividade Física: Moderado', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.009), 
                        Text('Última Prescrição: 29/11/2023', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.009), 
                        Text('Número: (99) 98437-2017', style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                        SizedBox(height: screenHeight * 0.009), 
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
              SizedBox(height: screenHeight * 0.009), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: ActionButton(
                  label: 'Histórico',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrescriptionHistoryPage(),
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
      bottomNavigationBar: Navbar(),
    );
  }
}
