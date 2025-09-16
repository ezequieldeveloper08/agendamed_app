import 'package:flutter/material.dart';
import 'package:mediup/domain/entities/user.dart';
import 'package:mediup/injection/app_injec.dart';
import 'package:mediup/view/view_models/auth.view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthViewModel authViewModel = injec();
  late final User user;

  @override
  void initState() {
    super.initState();
    user = authViewModel.user!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 140,
                    height: 140,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton.filled(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.amber.shade600,
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.edit_outlined),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                user.name,
                style: theme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(user.email, style: theme.titleMedium),
              const SizedBox(height: 24),
              Divider(),
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Editar Perfil', style: TextStyle()),
              ),
              ListTile(
                leading: Icon(Icons.notifications_outlined),
                title: Text('Notificações'),
              ),
              ListTile(
                leading: Icon(Icons.wallet_outlined),
                title: Text('Pagamentos'),
              ),
              ListTile(
                onTap: () => authViewModel.signout.execute(),
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Sair do Aplicativo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
