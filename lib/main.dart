import 'package:agrichapchap/constants/app_theme.dart';
import 'package:agrichapchap/pages/splash_screen.dart';
import 'package:agrichapchap/providers/create_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ChangeNotifierProvider(
        create: (context) => CartProvider(),
        child: MaterialApp(
          title: 'Agrichapchap',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          // home: BottomNavPage(title: 'Agrichapchap'),
          home: const MyHomePage(title: 'Agrichapchap'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
