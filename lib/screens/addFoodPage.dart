import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/screens/foodsPage.dart';

class AddFoodPage extends StatelessWidget {
  const AddFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: const Center(
          child: Text(
            'Adicionar Alimento',
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
          // Inputs
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.02),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome do Alimento'),
                ),
                SizedBox(height: screenHeight * 0.015),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Marca (opcional)'),
                ),
                SizedBox(height: screenHeight * 0.015),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Proteína (g)'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: screenHeight * 0.015),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Gordura (g)'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: screenHeight * 0.015),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Carboidratos (g)'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),

          // Botão Adicionar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.015),
            child: ActionButton(
              label: 'Adicionar Alimento',
              onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FoodInfoPage(),
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
