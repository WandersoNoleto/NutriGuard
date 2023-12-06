import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/screens/homePage.dart';
import 'package:nutri_guard/widgets/navbar.dart';
import 'package:nutri_guard/widgets/customActionButton.dart';

class AddPacientPage extends StatefulWidget {
  const AddPacientPage({Key? key}) : super(key: key);

  @override
  _AddPacientPageState createState() => _AddPacientPageState();
}

class _AddPacientPageState extends State<AddPacientPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  double _weight = 0.0;
  double _height = 0.0;
  int _age = 0;
  String _activityLevel = '';
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        iconTheme: const IconThemeData(color: AppColors.white),
        title: const Text(
          'Cadastrar Paciente',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite seu nome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondaryGreen),
                    ),
                    focusColor: AppColors.secondaryGreen,
                  ),
                  style: TextStyle(
                    color: AppColors.secondaryGreen,
                  ),
                  cursorColor: AppColors.secondaryGreen,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite seu peso';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _weight = double.parse(value!);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Altura (cm)',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondaryGreen),
                    ),
                    focusColor: AppColors.secondaryGreen,
                  ),
                  style: TextStyle(
                    color: AppColors.secondaryGreen,
                  ),
                  cursorColor: AppColors.secondaryGreen,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite sua altura';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _height = double.parse(value!);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Idade',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondaryGreen),
                    ),
                    focusColor: AppColors.secondaryGreen,
                  ),
                  style: TextStyle(
                    color: AppColors.secondaryGreen,
                  ),
                  cursorColor: AppColors.secondaryGreen,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite sua idade';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _age = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nível de Atividade Física',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondaryGreen),
                    ),
                    focusColor: AppColors.secondaryGreen,
                  ),
                  style: TextStyle(
                    color: AppColors.secondaryGreen,
                  ),
                  cursorColor: AppColors.secondaryGreen,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, selecione seu nível de atividade física';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _activityLevel = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Número de Telefone' ,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondaryGreen),
                    ),
                    focusColor: AppColors.secondaryGreen,
                  ),
                  style: TextStyle(
                    color: AppColors.secondaryGreen,
                  ),
                  cursorColor: AppColors.secondaryGreen,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite seu número de telefone';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phoneNumber = value!;
                  },
                ),
                const SizedBox(height: 32.0),
                ActionButton(
                  label: 'Salvar',
                  onPressed: () {
                    _submitForm();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      try {
        String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
        await FirebaseFirestore.instance.collection('pacients').add({
          'authUser': userId,
          'name': _name,
          'weight': _weight,
          'height': _height,
          'age': _age,
          'activityLevel': _activityLevel,
          'phoneNumber': _phoneNumber,
        });

        // Limpar o formulário após o salvamento
        _formKey.currentState?.reset();

        // Exibir uma mensagem de sucesso ou navegar para outra tela, se necessário
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Paciente cadastrado com sucesso!'),
          ),
        );
      } catch (e) {
        print('Erro ao cadastrar paciente: $e');
        // Exibir uma mensagem de erro, se necessário
      }
    }
  }
}
