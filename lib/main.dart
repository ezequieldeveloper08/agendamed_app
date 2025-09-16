import 'package:flutter/material.dart';
import 'package:mediup/config/theme.config.dart';
import 'package:mediup/injection/app_injec.dart';
import 'package:mediup/view/screens/auth/signin.screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjec();

  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.light,
      home: SigninScreen(),
    );
  }
}
