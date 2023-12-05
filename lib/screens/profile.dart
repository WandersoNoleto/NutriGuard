import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/navbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditing = false;

  // Dados do perfil (substitua com seus próprios dados)
  final String _fullName = "John Doe";
  final String _phone    = "(99) 99999-9999";
  final String _email    = "john.doe@example.com";
  final String _crn      = "123456";

  // Controladores para os campos de texto
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _crnController = TextEditingController();

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
        iconTheme: const IconThemeData(color: AppColors.white),
        title: const Row(
          children: [
            SizedBox(width: 8),
            Text("Perfil", style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
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
                  _buildProfileField("CRN", _crnController),
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
}
