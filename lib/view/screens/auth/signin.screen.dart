import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mediup/injection/app_injec.dart';
import 'package:mediup/view/core/button.dart';
import 'package:mediup/view/core/custom_text_field.dart';
import 'package:mediup/view/screens/auth/signup.screen.dart';
import 'package:mediup/view/screens/navigation/navigation.screen.dart';
import 'package:mediup/view/view_models/auth.view_model.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final AuthViewModel _authViewModel = injec();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      _authViewModel.signin.execute({
        'email': _emailController.text,
        'password': _passwordController.text,
      });
    }
  }

  void _onSigninListener() {
    if (_authViewModel.signin.error) {
      Fluttertoast.showToast(
        msg: "Erro ao fazer login",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    if (_authViewModel.signin.completed) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigationScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _authViewModel.signin.addListener(_onSigninListener);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24,
            children: [
              SizedBox(height: 48),
              Image.asset('assets/images/logo.png', width: 180),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                hintText: 'Insira seu email',
                prefixIcon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Digite um email válido';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _passwordController,
                label: 'Senha',
                hintText: 'Insira sua senha',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              ListenableBuilder(
                listenable: _authViewModel.signin,
                builder: (context, child) {
                  return Button(
                    label: 'Entrar',
                    onPressed: _onLogin,
                    fullWidth: true,
                    size: ButtonSize.large,
                    isLoading: _authViewModel.signin.running,
                  );
                },
              ),
              Center(child: Text('ou')),
              Button(
                label: 'Entrar com Google',
                icon: Bootstrap.google,
                fullWidth: true,
                size: ButtonSize.large,
                variant: ButtonVariant.outline,
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Não tem uma conta?'),
                  Button(
                    label: 'Cadastrar-se',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    ),
                    variant: ButtonVariant.ghost,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
