import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/screens/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditing = false;

  // Controladores para os campos de texto
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _crnController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializar os controladores com os dados do usuário
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // Recuperar o usuário atualmente autenticado
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Usuário logado, agora recuperar os dados da coleção 'users'
      DocumentSnapshot<Map<String, dynamic>> userDocument =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      // Preencher os controladores com os dados recuperados
      if (userDocument.exists) {
        Map<String, dynamic> userData = userDocument.data()!;
        _fullNameController.text = userData['fullName'] ?? '';
        _phoneController.text = userData['phoneNumber'] ?? '';
        _emailController.text = user.email ?? '';
        _crnController.text = userData['crn'] ?? '';
      }
    }
  }

  Future<void> _saveUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
          'fullName': _fullNameController.text,
          'phoneNumber': _phoneController.text,
          'crn': _crnController.text,
        });
      } catch (e) {
        print('Error updating user data: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        iconTheme: const IconThemeData(color: AppColors.white),
        title: const Row(
          children: [
            SizedBox(width: 8),
            Text("Perfil", style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit, color: Colors.white),
            onPressed: () {
              setState(() {
                if (_isEditing) {
                  _saveUserData();
                }
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: AppColors.primaryGreen,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            child: Center(
              child: CircleAvatar(
                radius: screenHeight * 0.06,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: screenHeight * 0.05, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildProfileField("Nome Completo", _fullNameController),
                  _buildProfileField("Telefone", _phoneController),
                  _buildProfileField("Email", _emailController),
                  _buildProfileField("CRN N° de inscrição", _crnController),
                  SizedBox(height: 16),
                  ActionButton(
                    label: 'Sair',
                    onPressed: () {
                      _signOut(context);
                    },
                  ),
                  Text(
                    'Versão 1.10.2',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navbar(),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        enabled: _isEditing,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
