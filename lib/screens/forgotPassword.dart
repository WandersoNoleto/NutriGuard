import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/widgets/customButton.dart';

class ChangePasswordPage extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _changePassword(BuildContext context) {
    Navigator.pop(context);
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
                      'Alterar Senha',
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
                keyboardType: TextInputType.text,
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Nova Senha",
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
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirmar Nova Senha",
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
              const SizedBox(height: 60),
              Button(
                label: "Enviar",
                onPressed: () {
                  
                },
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
