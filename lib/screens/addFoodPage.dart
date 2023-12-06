import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/screens/foodsPage.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({Key? key}) : super(key: key);

  @override
  _AddFoodPageState createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  late TextEditingController nameController;
  late TextEditingController brandController;
  late TextEditingController caloriesController;
  late TextEditingController proteinController;
  late TextEditingController fatController;
  late TextEditingController carbsController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    brandController = TextEditingController();
    caloriesController = TextEditingController();
    proteinController = TextEditingController();
    fatController = TextEditingController();
    carbsController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    brandController.dispose();
    caloriesController.dispose();
    proteinController.dispose();
    fatController.dispose();
    carbsController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Nome do Alimento'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFormField(
                    controller: brandController,
                    decoration: const InputDecoration(labelText: 'Marca (opcional)'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFormField(
                    controller: caloriesController,
                    decoration: const InputDecoration(labelText: 'Calorias'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFormField(
                    controller: proteinController,
                    decoration: const InputDecoration(labelText: 'Proteína (g)'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFormField(
                    controller: fatController,
                    decoration: const InputDecoration(labelText: 'Gordura (g)'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFormField(
                    controller: carbsController,
                    decoration: const InputDecoration(labelText: 'Carboidratos (g)'),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.015),
              child: ActionButton(
                label: 'Adicionar Alimento',
                onPressed: () => _saveFood(context),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Valores em 100g',
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }

  void _saveFood(BuildContext context) async {
    String name = nameController.text;
    String brand = brandController.text;
    double calories = parseDouble(caloriesController.text);
    double protein = parseDouble(proteinController.text);
    double fat = parseDouble(fatController.text);
    double carbs = parseDouble(carbsController.text);

    if (name.isNotEmpty && calories > 0) {
      Map<String, dynamic> foodData = {
        'name': name,
        'brand': brand,
        'calories': calories,
        'protein': protein,
        'fat': fat,
        'carbs': carbs,
      };

      try {
        await FirebaseFirestore.instance.collection('foods').add(foodData);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodInfoPage(),
          ),
        );
      } catch (e) {
        print('Error adding food: $e');
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Campos obrigatórios não preenchidos'),
            content: Text('Por favor, preencha o nome do alimento e as calorias.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  double parseDouble(String value) {
    try {
      return double.parse(value.replaceAll(',', '.')); 
    } catch (e) {
      print('Error parsing double: $e');
      return 0.0; 
    }
  }
}
