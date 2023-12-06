import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/pacientCard.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/searchBar.dart';
import 'package:nutri_guard/screens/pacientDetail.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/screens/addPacient.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<String>(
      future: _getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Erro: ${snapshot.error}'),
            ),
          );
        } else {
          String userName = snapshot.data ?? '';

          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryGreen,
              iconTheme: const IconThemeData(color: AppColors.white),
              title: Text(
                'Bem-vindo, $userName',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.04),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Meus pacientes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryGreen,
                        ),
                      ),
                      ActionButton(
                        label: 'Adicionar',
                        icon: Icons.add,
                        width: screenWidth * 0.1, 
                        height: screenHeight * 0.05, 
                        onPressed: (){
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddPacientPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.04),
                  child: const SearchBox(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
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
      },
    );
  }

  Future<String> _getUserName() async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (userSnapshot.exists) {
        return userSnapshot['fullName'];
      }
      return '';
    } catch (e) {
      print('Cant find User: $e');
      return '';
    }
  }
}
