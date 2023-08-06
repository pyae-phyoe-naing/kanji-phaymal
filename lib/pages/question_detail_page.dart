import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/helper.dart';
import 'package:kanji_phay_mal/models/card_model.dart';
import 'package:kanji_phay_mal/utils/theme.dart';
import 'package:kanji_phay_mal/widgets/card/select_ans_item.dart';
import 'package:kanji_phay_mal/widgets/card/shadow_card.dart';
import 'package:kanji_phay_mal/widgets/card/card_appbar.dart';
import 'package:kanji_phay_mal/widgets/card/show_answer.dart';
import 'package:kanji_phay_mal/widgets/nab_button.dart';
import 'package:kanji_phay_mal/widgets/card/question_avator.dart';

class QuestionDetailPage extends StatefulWidget {
  final List<CardModel> cards;
  const QuestionDetailPage({super.key, required this.cards});

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage>
    with SingleTickerProviderStateMixin {
  late List<CardModel> cards;
  int currentIndex = 0;
  int indicatorIndex = 0;
  int? selectedIndex;
  bool showAnswer = false;

  List<Map<String, dynamic>> answers = [];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    cards = widget.cards;
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar(
          currentIndex: currentIndex,
          indicatorIndex: indicatorIndex,
          cards: cards,
          context: context),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        width: width,
        height: height,
        child: Stack(
          children: [
            //---------- Indicator circle ----------//
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cards.map((card) {
                return Container(
                  width: cards[currentIndex].name == card.name ? 18 : 8,
                  height: cards[currentIndex].name == card.name ? 8 : 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      shape: cards[currentIndex].name == card.name
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      color: cards[currentIndex].name == card.name
                          ? Colors.blueAccent
                          : Colors.grey.shade500,
                      borderRadius: cards[currentIndex].name == card.name
                          ? BorderRadius.circular(3)
                          : null),
                );
              }).toList(),
            ),

            //---------- Card-----------//
            Positioned(
              top: ((height - height * 0.63) / 4) - 10,
              right: (width - width * 0.77) / 1.54,
              child: ShadowCard(
                zAxis: -0.08,
                width: width * 0.77,
                height: height * 0.54,
                color: const Color.fromARGB(255, 247, 241, 243),
              ),
            ),
            Positioned(
              top: ((height - height * 0.63) / 4.3) - 10,
              right: (width - width * 0.77) / 1.32 - 17,
              child: ShadowCard(
                zAxis: -0.045,
                width: width * 0.77,
                height: height * 0.54,
                color: const Color.fromARGB(255, 243, 243, 245),
              ),
            ),
            Positioned(
              top: ((height - height * 0.63) / 5.1) - 10,
              right: (width - width * 0.77) / 1.3 - 28,
              child: ShadowCard(
                zAxis: 0,
                width: width * 0.77,
                height: height * 0.54,
                color: const Color.fromRGBO(252, 250, 250, 1),
              ),
            ),

            Positioned(
              top: ((height - height * 0.63) / 4.7) - 10,
              right: (width - width * 0.77) / 1.3 - 28,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: height * 0.54,
                  width: width * 0.77,
                  decoration: AppTheme.boxDecoration,
                  child: Column(children: [
                    //----- Question Text ------//
                    QuestionAvator(name: cards[currentIndex].name),

                    !showAnswer
                        ?
                        //------------- Select Answer  --------//
                        Column(
                            children: [
                              for (var (index, ques)
                                  in cards[currentIndex].questions.indexed) ...[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                    checkAnswer(cards[currentIndex].name, ques);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 2),
                                    margin: const EdgeInsets.only(
                                        bottom: 20, left: 40, right: 40),
                                    height: 50,
                                    decoration: AppTheme.boxDecoration.copyWith(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              206, 204, 204, 0.49),
                                        ),
                                      ],
                                      color: const Color.fromARGB(
                                          255, 243, 245, 249),
                                    ),
                                    child: SelectAnsItem(
                                        selectedIndex: selectedIndex,
                                        index: index,
                                        answers: answers,
                                        name: cards[currentIndex].name,
                                        ques: ques),
                                  ),
                                ),
                              ],
                            ],
                          )
                        :
                        //-------Answer Text --------//
                        ShowAnswer(card: cards[currentIndex]),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
      // -------Botton NavigationBar----------//
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //--------------Back Card Button -------//
            NabButton(
                icon: Icons.undo_outlined,
                onTap: currentIndex == 0 ? null : goBackCard),
            //--------------View Answer Button -------//
            NabButton(icon: Icons.shuffle_outlined, onTap: viewAnswer),
            //--------------Reset Answer Button -------//
            NabButton(icon: Icons.refresh, onTap: resetAnswer),
            
            //-------------- Next Card Button -------//
            NabButton(
                icon: Icons.play_arrow_outlined,
                onTap: currentIndex == cards.length - 1 ? null : goNextCard),
          ],
        ),
      ),
    );
  }

  //-------Bottom Nav Action -------- //
  goBackCard() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _offsetAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-1.5, 0.0),
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.ease,
        ));
        _controller.reverse(from: 1);
        showAnswer = false;
        selectedIndex = null;
      });
    }
  }

  viewAnswer() {
    setState(() {
      showAnswer = !showAnswer;
    });
  }

  resetAnswer() {
    setState(() {
      indicatorIndex = 0;
      answers = [];
    });
  }

  goNextCard() {
    if (cards.length - 1 > currentIndex) {
      setState(() {
        _offsetAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(1.5, 0.0),
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.ease,
        ));
        _controller.reverse(from: 1);
        currentIndex++;
        selectedIndex = null;
        showAnswer = false;
      });
    }
  }
  //---------------------------- //

  checkAnswer(String quesName, String que) async {
    if (que == cards[currentIndex].answer) {
      toastMessage('The answer is correct!',
          const Color.fromRGBO(102, 206, 125, 1), context);

      await Future.delayed(const Duration(milliseconds: 600));

      if (cards.length - 1 > currentIndex) {
        setState(() {
          _offsetAnimation = Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(1.5, 0.0),
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.ease,
          ));
          _controller.reverse(from: 0.7);
          currentIndex++;
          selectedIndex = null;
        });
      }

      if (cards.length > indicatorIndex &&
          !checkAnsExist(answers, quesName, que)) {
        setState(() {
          indicatorIndex++;
          answers.add({'quesName': quesName, 'ans': que});
        });
      }
    } else {
      toastMessage('The answer is wrong!', const Color.fromRGBO(255, 114, 124, 1), context);
    }
  }
}
