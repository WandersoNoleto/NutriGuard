import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/foodCard.dart';
import 'package:nutri_guard/widgets/searchBar.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/screens/addFoodPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodInfoPage extends StatelessWidget {
  const FoodInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: const Center(
          child: Text(
            'Alimentos',
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
          // Caixa de pesquisa
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
            child: const SearchBox(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: ActionButton(
                label: 'Adicionar',
                icon: Icons.add,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddFoodPage(),
                    ),
                  );
                },
              ),
            ),
          ),

          // Lista de cartões de informações de alimentos do Firebase
          Expanded(
            child: FutureBuilder<QuerySnapshot>(
              // Substitua 'foods' pelo nome da sua coleção no Firebase
              future: FirebaseFirestore.instance.collection('foods').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro: ${snapshot.error}'),
                  );
                }

                var foodDocuments = snapshot.data?.docs ?? [];
                return ListView.builder(
                  itemCount: foodDocuments.length,
                  itemBuilder: (context, index) {
                    var foodData = foodDocuments[index].data() as Map<String, dynamic>;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
                      child: FoodInfoCard(
                        name: foodData['name'] ?? '',
                        brand: foodData['brand'] ?? '',
                        protein: (foodData['protein'] ?? 0).toDouble(),
                        fat: (foodData['fat'] ?? 0).toDouble(),
                        carbohydrates: (foodData['carbs'] ?? 0).toDouble(),
                      ),
                    );
                  },
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
