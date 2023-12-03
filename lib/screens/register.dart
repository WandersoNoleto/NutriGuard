import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/screens/login.dart';
import 'package:nutri_guard/widgets/customButton.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 60, // Aumenta o espaço vertical
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
              const SizedBox(height: 20), // Ajusta o espaço
              
              // ignore: prefer_const_constructors
              Center(
                child: const Column(
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
                autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Nome Completo",
                  labelStyle: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
         

                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Número de Telefone",
                  labelStyle: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
         

                ),
              ),

              const SizedBox(height: 20),

              // Adiciona os campos de formulário
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
                ),
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              
              const SizedBox(height: 20),
              
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
         

                ),
              ),

              

              const SizedBox(height: 30),
              
              Button(
                label: "Registrar",
                onPressed: () {
                },
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
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
    );
  }
}
