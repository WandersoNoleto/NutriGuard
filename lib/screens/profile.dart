import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/navbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditing = false;

  // Dados do perfil (substitua com seus próprios dados)
  String _fullName = "John Doe";
  String _phone = "(99) 99999-9999";
  String _email = "john.doe@example.com";
  String _crn = "123456";

  // Controladores para os campos de texto
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _crnController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializar os controladores com os dados do perfil
    _fullNameController.text = _fullName;
    _phoneController.text = _phone;
    _emailController.text = _email;
    _crnController.text = _crn;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Row(
          children: [
            SizedBox(width: 8),
            Text("Perfil", style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Ativar ou desativar o modo de edição quando o ícone de lápis for clicado
              setState(() {
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
                child: Icon(Icons.person, size: screenHeight * 0.05, color: Colors.white),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildProfileField("Nome Completo", _fullNameController),
                  _buildProfileField("Telefone", _phoneController),
                  _buildProfileField("Email", _emailController),
                  _buildProfileField("CRN", _crnController),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(),
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
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
