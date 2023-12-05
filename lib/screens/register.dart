import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/customButton.dart';
import 'package:nutri_guard/screens/login.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _registerUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        
      );
      print('E-mail: $emailController.text');
      print('Senha: $passwordController.text');
      // Se necessário, adicione lógica adicional após o registro do usuário.
    } catch (e) {
      print('Error $e');
      // Trate o erro, se necessário.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Evita o overflow ao abrir o teclado
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
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
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
                    color: AppColors.white, // Define a cor do texto digitado
                  ),
                  cursorColor: AppColors.white, // Define a cor do cursor
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
                    color: AppColors.white, // Define a cor do texto digitado
                  ),
                  cursorColor: AppColors.white, // Define a cor do cursor
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
                    color: AppColors.white, // Define a cor do texto digitado
                  ),
                  cursorColor: AppColors.white, // Define a cor do cursor
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
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
                  ),
                  style: TextStyle(
                    color: AppColors.white, // Define a cor do texto digitado
                  ),
                  cursorColor: AppColors.white, // Define a cor do cursor
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
