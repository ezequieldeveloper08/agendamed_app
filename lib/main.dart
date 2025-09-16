import 'package:flutter/material.dart';
import 'package:mediup/config/theme.config.dart';
import 'package:mediup/injection/app_injec.dart';
import 'package:mediup/view/screens/auth/signin.screen.dart';
import 'package:mediup/view/screens/navigation/navigation.screen.dart';
import 'package:mediup/view/view_models/auth.view_model.dart';

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
      home: InitApp(),
    );
  }
}

class InitApp extends StatefulWidget {
  const InitApp({super.key});

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  final AuthViewModel viewModel = injec();

  @override
  void initState() {
    super.initState();
    viewModel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel.load,
      builder: (context, child) {
        if (viewModel.load.running) {
          return Center(child: CircularProgressIndicator());
        }
        if (viewModel.load.error) {
          return SigninScreen();
        }

        return NavigationScreen();
      },
    );
  }
}
