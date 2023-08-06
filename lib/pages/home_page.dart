import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/pages/about_page.dart';
import 'package:kanji_phay_mal/pages/favorite_page.dart';
import 'package:kanji_phay_mal/pages/link_page.dart';
import 'package:kanji_phay_mal/pages/n2_question_page.dart';
import 'package:kanji_phay_mal/pages/n3_question_page.dart';
import 'package:kanji_phay_mal/pages/n4_question_page.dart';
import 'package:kanji_phay_mal/pages/n5_question_page.dart';
import 'package:kanji_phay_mal/pages/setting_page.dart';
import 'package:kanji_phay_mal/provider/theme_provider.dart';
import 'package:kanji_phay_mal/widgets/home_item.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            '漢字 PHAY MAL',
            style: TextStyle(fontSize: 16, letterSpacing: 1),
          ),
        ),
        actions: [
          Consumer<ThemeProvider>(builder: (_, tp, __) {
            return GestureDetector(
              onTap: () async {
                if (tp.themeMode == ThemeMode.light) {
                  tp.changeDarkTheme();
                } else {
                  tp.changeLightTheme();
                }
              },
              child: Container(
                width: 31,
                height: 31,
                margin: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(210, 212, 212, 1),
                ),
                alignment: Alignment.center,
                child: Icon(
                  tp.themeMode == ThemeMode.dark
                      ? Icons.mode_night
                      : Icons.mode_night_outlined,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      HomeItem(
                          onTap: goN5Page,
                          widget: const Text(
                            '漢字',
                            style: TextStyle(color: Colors.white),
                          ),
                          title: 'N5'),
                      HomeItem(
                          onTap: goN4Page,
                          widget: const Text(
                            '漢字',
                            style: TextStyle(color: Colors.white),
                          ),
                          title: 'N4'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeItem(
                          onTap: goN3Page,
                          widget: const Text(
                            '漢字',
                            style: TextStyle(color: Colors.white),
                          ),
                          title: 'N3'),
                      HomeItem(
                          onTap: goN2Page,
                          widget: const Text(
                            '漢字',
                            style: TextStyle(color: Colors.white),
                          ),
                          title: 'N2'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeItem(
                          onTap: goLinkPage,
                          color: const Color.fromRGBO(125, 115, 193, 1),
                          widget: const Icon(
                            Icons.link,
                            size: 25,
                            color: Colors.white,
                          ),
                          title: 'Website'),
                      HomeItem(
                          onTap: goFavoritePage,
                          color: const Color.fromRGBO(255, 114, 124, 1),
                          widget: const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.white,
                          ),
                          title: 'Favorite'),
                    ],
                  ),
                  Row(
                    children: [
                      HomeItem(
                          onTap: goSettingPage,
                          color: const Color.fromRGBO(247, 172, 61, 1),
                          widget: const Icon(
                            Icons.settings,
                            size: 25,
                            color: Colors.white,
                          ),
                          title: 'Setting'),
                      HomeItem(
                          onTap: goAboutPage,
                          color: const Color.fromRGBO(102, 206, 125, 1),
                          widget: const Icon(
                            Icons.info_outline,
                            size: 25,
                            color: Colors.white,
                          ),
                          title: 'About'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  goN5Page() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const N5QuestionPage(),
        ));
  }

  goN4Page() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const N4QuestionPage(),
        ));
  }

  goN3Page() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const N3QuestionPage(),
        ));
  }

  goN2Page() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const N2QuestionPage(),
        ));
  }

  goLinkPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const LinkPage(),
        ));
  }

  goFavoritePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const FavoritePage(),
        ));
  }

  goSettingPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SettingPage(),
        ));
  }

  goAboutPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const AboutPage(),
        ));
  }
}
