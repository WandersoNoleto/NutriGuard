import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/foodCard.dart';
import 'package:nutri_guard/widgets/searchBar.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/screens/addFoodPage.dart';

class FoodInfoPage extends StatelessWidget {
  const FoodInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: Center(
          child: Text(
            'Alimentos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // Texto em branco
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Ícone em branco
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Caixa de pesquisa
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
            child: SearchBox(),
          ),
           Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: ActionButton(
                label: 'Adicionar',
                icon: Icons.add,
                onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddFoodPage(),
                      ),
                    );
                  },
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
                  child: FoodInfoCard(
                    name: 'Nome do Alimento $index',
                    brand: 'Marca $index',
                    protein: 10 + index,
                    fat: 5 + index,
                    carbohydrates: 20 + index,
                  ),
                );
              },
            ),
          ),

          // Botão Adicionar alinhado à direita
         
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
