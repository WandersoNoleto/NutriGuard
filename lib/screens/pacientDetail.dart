import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/screens/historyPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutri_guard/screens/createPrescription.dart';


class PacientDetailsPage extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> pacientSnapshot;

  const PacientDetailsPage({Key? key, required this.pacientSnapshot}) : super(key: key);

  @override
  _PacientDetailsPageState createState() => _PacientDetailsPageState();
}

class _PacientDetailsPageState extends State<PacientDetailsPage> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _activityLevelController;
  late TextEditingController _phoneNumberController;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.pacientSnapshot['name']);
    _ageController = TextEditingController(text: widget.pacientSnapshot['age'].toString());
    _weightController = TextEditingController(text: widget.pacientSnapshot['weight'].toString());
    _heightController = TextEditingController(text: widget.pacientSnapshot['height'].toString());
    _activityLevelController = TextEditingController(text: widget.pacientSnapshot['activityLevel']);
    _phoneNumberController = TextEditingController(text: widget.pacientSnapshot['phoneNumber']);
  }

  @override
  Widget build(BuildContext context) {
    String patientName = widget.pacientSnapshot['name'];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: const Center(
          child: Text(
            'Detalhes do Paciente',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      patientName,
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (_isEditing)
                      IconButton(
                        icon: Icon(Icons.save),
                        onPressed: () {
                          _saveChanges();
                        },
                      ),
                    if (!_isEditing)
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            _isEditing = true;
                          });
                        },
                      ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenHeight * 0.018),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableField("Nome", _nameController),
                    _buildEditableField("Idade", _ageController),
                    _buildEditableField("Peso", _weightController),
                    _buildEditableField("Altura", _heightController),
                    _buildEditableField("Nível de Atividade Física", _activityLevelController),
                    _buildEditableField("Número", _phoneNumberController),
                  ],
                ),
              ),
              // Botões
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.015),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButton(
                      label: 'Prescrever Dieta',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DietPrescriptionPage(patientName: patientName, objective: '', totalCalories: 0),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.018),
                    ActionButton(
                      label: 'Histórico',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrescriptionHistoryPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              enabled: _isEditing,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle(double screenHeight) {
    return TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w400, color: AppColors.textColor);
  }

  void _saveChanges() {
    // Aqui você pode enviar as alterações para o Firebase
    // Use os controladores _nameController, _ageController, _weightController, etc.
    setState(() {
      _isEditing = false;
    });
  }
}
