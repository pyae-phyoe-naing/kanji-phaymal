import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/helper.dart';
import 'package:kanji_phay_mal/pages/question_detail_page.dart';
import 'package:kanji_phay_mal/utils/theme.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.15,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
        title: const Text(
          'Favorite',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.builder(
                  itemCount: favoriteCards.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: AppTheme.boxDecoration.copyWith(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  favorite(index);
                                },
                                icon: Icon(
                                  checkFavoriteExist(favoriteCards[index]['id'],
                                          favoriteCards[index]['level'])
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: checkFavoriteExist(
                                          favoriteCards[index]['id'],
                                          favoriteCards[index]['level'])
                                      ? const Color.fromRGBO(255, 114, 124, 1)
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(239, 227, 248, 1),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              favoriteCards[index]['level'],
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            favoriteCards[index]['name'],
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => QuestionDetailPage(
                                  cards: favoriteCards[index]['cards'],
                                ),
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 10, right: 10),
                              height: 33,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromRGBO(236, 236, 236, 1),
                              ),
                              child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Started',
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.trending_up,
                                      color: Colors.black87,
                                    )
                                  ]),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  favorite(int index) {
    setState(() {
      favoriteCards.removeWhere(
        (element) =>
            element['id'] == favoriteCards[index]['id'] &&
            element["level"] == favoriteCards[index]['level'],
      );
    });
  }
}
