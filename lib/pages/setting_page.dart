import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 16, letterSpacing: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Card(
              elevation: 0.3,
              child: Consumer<ThemeProvider>(
                builder: (context, tp, child) => ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Dark Mode'),
                  trailing: Switch(
                      value: tp.themeMode == ThemeMode.dark,
                      onChanged: (val) {
                        if (val) {
                          tp.changeDarkTheme();
                        } else {
                          tp.changeLightTheme();
                        }
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
