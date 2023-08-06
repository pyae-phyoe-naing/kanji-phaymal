import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kanji_phay_mal/pages/home_page.dart';
import 'package:kanji_phay_mal/provider/theme_provider.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3),);
  FlutterNativeSplash.remove();
  runApp(ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider tprovdier =
        Provider.of<ThemeProvider>(context, listen: false);
    tprovdier.checkThemeMode();
    return Consumer<ThemeProvider>(builder: (_, tp, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: const Color.fromRGBO(248, 249, 251, 1),
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black87,
            backgroundColor: Color.fromRGBO(248, 249, 251, 1),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
          ),
          primaryColor: Colors.white,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color.fromARGB(255, 62, 61, 61),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 62, 61, 61),
              foregroundColor: Colors.white),
          primaryColor: const Color.fromARGB(255, 102, 101, 101),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        themeMode: tp.themeMode,
        home: const HomePage(),
      );
    });
  }
}
