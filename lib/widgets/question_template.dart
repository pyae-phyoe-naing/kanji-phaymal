import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kanji_phay_mal/helper.dart';
import 'package:kanji_phay_mal/models/question_model.dart';
import 'package:kanji_phay_mal/pages/question_detail_page.dart';
import 'package:kanji_phay_mal/services/api_services.dart';
import 'package:kanji_phay_mal/utils/theme.dart';

class QuestionTemplate extends StatefulWidget {
  final String baseUrl;
  final String title;
  const QuestionTemplate(
      {super.key, required this.baseUrl, required this.title});

  @override
  State<QuestionTemplate> createState() => _QuestionTemplateState();
}

class _QuestionTemplateState extends State<QuestionTemplate> {
  final ApiServices apiServices = ApiServices();
  List<QuestionModel> allQuiz = [];
  bool isLoading = false;
  bool noConnection = false;
  @override
  void initState() {
    super.initState();
    getAllQuestion();
  }

  getAllQuestion() async {
    setState(() {
      isLoading = true;
      noConnection = false;
    });
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      List<QuestionModel> questions =
          await apiServices.getAllQuiz(widget.baseUrl);
      setState(() {
        allQuiz = questions;
        isLoading = false;
      });
    } else {
      setState(() {
        noConnection = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.15,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 17),
        ),
        actions: [
          GestureDetector(
            onTap: getAllQuestion,
            child: Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 233, 231, 231)),
              child: const Icon(
                Icons.refresh,
                color: Colors.redAccent,
                size: 24,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: noConnection
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 30,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('No internet connection!'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          getAllQuestion();
                        },
                        child: const Text('Try Again'),
                      ),
                    ),
                  ],
                ),
              )
            : isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(255, 114, 124, 1),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: GridView.builder(
                            itemCount: allQuiz.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        onPressed: () {
                                          favorite(index);
                                        },
                                        splashRadius: 20,
                                        icon: Icon(
                                          checkFavoriteExist(allQuiz[index].id,
                                                  allQuiz[index].level)
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: checkFavoriteExist(
                                                  allQuiz[index].id,
                                                  allQuiz[index].level)
                                              ? const Color.fromRGBO(
                                                  255, 114, 124, 1)
                                              : null,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 15),
                                        width: 70,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(219, 234, 254, 1),
                                        ),
                                        child: const Icon(
                                          Icons.dashboard,
                                          size: 30,
                                          color:
                                              Color.fromRGBO(59, 130, 246, 1),
                                        )),
                                    Text(
                                      allQuiz[index].name,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => QuestionDetailPage(
                                            cards: allQuiz[index].cards,
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 15, left: 10, right: 10),
                                        height: 33,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color:
                                              Color.fromRGBO(236, 236, 236, 1),
                                        ),
                                        child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Started',
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 14),
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
    var check = checkFavoriteExist(allQuiz[index].id, allQuiz[index].level);

    if (!check) {
      setState(() {
        favoriteCards.add({
          "id": allQuiz[index].id,
          "level": allQuiz[index].level,
          "name": allQuiz[index].name,
          "cards": allQuiz[index].cards,
          'favorite': true
        });
      });
    } else {
      setState(() {
        favoriteCards.removeWhere(
          (element) =>
              element['id'] == allQuiz[index].id &&
              element["level"] == allQuiz[index].level &&
              element["name"] == allQuiz[index].name,
        );
      });
    }
  }
}
