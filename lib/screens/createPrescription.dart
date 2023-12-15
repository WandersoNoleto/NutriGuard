import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/mealCard.dart';
import 'package:nutri_guard/widgets/addFoodText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutri_guard/widgets/searchBar.dart';

class DietPrescriptionPage extends StatefulWidget {
  final String patientName;
  final String objective;
  final double totalCalories;

  const DietPrescriptionPage({
    Key? key,
    required this.patientName,
    required this.objective,
    required this.totalCalories,
  }) : super(key: key);

  @override
  _DietPrescriptionPageState createState() => _DietPrescriptionPageState();
}

class _DietPrescriptionPageState extends State<DietPrescriptionPage> {
  TextEditingController objectiveController = TextEditingController();
  bool isEditingObjective = false;
  List<Meal> meals = [
    Meal('Café da manhã'),
    Meal('Almoço'),
    Meal('Jantar'),
    Meal('Ceia'),
  ];

  @override
  void initState() {
    super.initState();
    objectiveController.text = widget.objective;
  }

void _openFoodModal(int mealIndex) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: Colors.white, // Adiciona esta linha para definir o fundo como branco
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryGreen,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Escolha um Alimento',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            SearchBox(),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
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
                      return Column(
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  foodData['name'] ?? '',
                                  style: TextStyle(
                                    color: AppColors.primaryGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${foodData['calories'] ?? 0} Cal',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Marca: ${foodData['brand'] != null && foodData['brand'].toString().isNotEmpty ? foodData['brand'] : 'Genérico'}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                                Text(
                                  'P: ${foodData['protein'] ?? 0}g  G: ${foodData['fat'] ?? 0}g  C: ${foodData['carbs'] ?? 0}g',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.5),
                            thickness: 1.0,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
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
            'Prescrição de Dieta',
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
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.075,
          ),
          padding: EdgeInsets.all(screenHeight * 0.018),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenHeight * 0.015),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    widget.patientName,
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
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: objectiveController,
                                enabled: isEditingObjective,
                                decoration: InputDecoration(
                                  labelText: 'Objetivo',
                                  contentPadding: EdgeInsets.only(left: 8.0),
                                ),
                              ),
                              if (isEditingObjective)
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(Icons.save),
                                    onPressed: () {
                                      setState(() {
                                        isEditingObjective = false;
                                      });
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (!isEditingObjective)
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              setState(() {
                                isEditingObjective = true;
                              });
                            },
                          ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.018,
                    ),
                    Text(
                      'Calorias Totais: ${widget.totalCalories} kcal',
                      style: TextStyle(
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.018,
                    ),

                    for (int index = 0; index < meals.length; index++)
                      Column(
                        children: [
                          MealCard(
                            key: Key('meal_$index'),
                            label: meals[index].name,
                            onDelete: () {
                              setState(() {
                                meals.removeAt(index);
                              });
                            },
                          ),
                          AddFoodText(
                            mealName: meals[index].name,
                            onTap: () {
                              _openFoodModal(index);
                            },
                          ),
                        ],
                      ),

                    SizedBox(height: screenHeight * 0.018),

                    ActionButton(
                      label: 'Adicionar Refeição',
                      onPressed: () {
                        setState(() {
                          meals.add(Meal('Nova Refeição'));
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Meal {
  String name;
  List<Food> foods;

  Meal(this.name) : foods = [];

  void addFood(Food food) {
    foods.add(food);
  }
}

class Food {
  String name;
  double calories;
  double protein;
  double fat;
  double carbohydrates;

  Food({
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  });
}
