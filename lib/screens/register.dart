import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/screens/login.dart';
import 'package:nutri_guard/widgets/customButton.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController crnController = TextEditingController();

  bool _isObscure = true;

  void _registerUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      String fullName = fullNameController.text;
      String phone = phoneController.text;
      String crn = crnController.text;

      String userId = userCredential.user?.uid ?? '';

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'fullName': fullName,
        'phoneNumber': phone,
        'crn': crn,
        'authUser': userId,
      });
    } catch (e) {
      print('Error during registerUser: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          color: AppColors.primaryGreen,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset('assets/logo-circle.png'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                Center(
                  child: Column(
                    children: [
                      Text(
                        'Bem-vindo ao ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'NutriGuard',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  controller: fullNameController,
                  decoration: InputDecoration(
                    labelText: "Nome Completo",
                    labelStyle: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                    focusColor: AppColors.white,
                  ),
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: "Número de Telefone",
                    labelStyle: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                    focusColor: AppColors.white,
                  ),
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  controller: crnController,
                  decoration: InputDecoration(
                    labelText: "CRN",
                    labelStyle: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                    focusColor: AppColors.white,
                  ),
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                    focusColor: AppColors.white,
                  ),
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  obscureText: _isObscure,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                    focusColor: AppColors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                Button(
                  label: "Registrar",
                  onPressed: () {
                    _registerUser(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Já possui cadastro? Faça login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
