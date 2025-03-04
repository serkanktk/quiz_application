import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // activeScreen'in Widget veya null olabileceğini vurgulamak için ? koymamız gerekiyor.
  // Teknik olarak initState() çağrılmadan önce activeScreen null olacağından
  // bu durumun ? ile belirtilmesi gerekmektedir.
  Widget? activeScreen;
  // var activeScreen = "start-screen"; // 63(alternative to swicth screen)

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = ResultsScreen(
          switchScreen,
          chosenAnswers: selectedAnswers,
        );
      });
    }
  }

  /* --> initState <-- metodu, statefulWidget'ların yaşam döngüsünün bir parçasıdır.
     Widget ilk kez oluşturulduğunda build metodu çağrılmadan hemen önce çağrılır.
     Widget'ın başlangıç state'ini hazırlamak için kullanılır.
     Eğer daha sonra setState() çağrılırsa, build() tekrar çalışır. Fakat initState() çağrılmaz  
  */
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(context) {
    /* 
    StartScreen'den önce başka bir .dart file'ında bu yapılanmayı yapmamızın ana sebebi
    tüm ekranlarda aynı background color'ını kullanacak olmamız
     */
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 65, 22, 140),
                Color.fromARGB(255, 143, 104, 211),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              activeScreen, // 63(alternative to switch screen): child: activeScreen == "start-screen" ? StartScreen(switchScreen) : const QuestionsScreen(),
          // activeScreen == "start-screen" --> condition
          // ? StartScreen(switchScreen) --> value used if condition is met
          // const QuestionScreen() --> value used if condition is not met
        ),
      ),
    );
  }
}
