import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/screens/register.dart';
import 'package:nutri_guard/widgets/customButton.dart';
import 'package:nutri_guard/screens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';




class LoginPage extends StatelessWidget {

  final TextEditingController emailController    = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   LoginPage({Key? key}) : super(key: key);

  void _loginUser(BuildContext context) async {
      print('E-mail: $emailController.text');
      print('Senha: $passwordController.text');
    try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null){
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Adicione lógica para tratar falha na autenticação (usuário não encontrado, senha incorreta, etc.)
      print('AuthFail: Invalid Username or password');
    }
    } catch (e) {
      print('Error $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 60,
        ),
        color: AppColors.primaryGreen,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset('assets/logo-circle.png'),
              ),
              const SizedBox(height: 20),
              const Center(
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
              const SizedBox(height: 20),
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

              const SizedBox(height: 20),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                controller: passwordController,
                obscureText: true,
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

              const SizedBox(height: 60),
              Button(
                label: "Acessar",
                onPressed: () {
                  _loginUser(context);

                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text(
                  'Ainda não possui uma conta? Registre-se',
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
    );
  }
}


