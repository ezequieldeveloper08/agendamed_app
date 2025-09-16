import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mediup/view/core/button.dart';
import 'package:mediup/view/core/custom_text_field.dart';
import 'package:mediup/view/screens/navigation/navigation.screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastre-se')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            CustomTextField(
              label: 'Nome completo',
              hintText: 'Insira seu nome completo',
              prefixIcon: Icons.person_outline,
            ),
            CustomTextField(
              label: 'Email',
              hintText: 'Insira seu email',
              prefixIcon: Icons.email_outlined,
            ),
            CustomTextField(
              label: 'Senha',
              hintText: 'Insira sua senha',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
            Button(
              label: 'Continuar',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavigationScreen()),
              ),
              fullWidth: true,
              size: ButtonSize.large,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Já tem uma conta?'),
                Button(
                  label: 'Entrar',
                  onPressed: () {},
                  variant: ButtonVariant.ghost,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
