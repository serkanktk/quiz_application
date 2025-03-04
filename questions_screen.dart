import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionsScreenIndex = 0;

  // build methodu setState kullanılmadıkça tekrardan execute edilmediği için
  // setState'in içerisinde incremenet yapmalıyız
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionsScreenIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionsScreenIndex];

    return Center(
      child: Container(
        /*
        --> Padding: Bir widget'ın içeriği (örneğin, metin veya ikon) ile widget'ın kenarları arasındaki boşluktur. 
        Yani, widget'ın içindeki içerik ile widget'ın sınırları arasındaki boşluğu ayarlar.

        --> Margin: Bir widget'ın dışındaki diğer widget'lara veya ekran sınırlarına olan boşluğunu ayarlar. 
        Yani, widget'ın çevresiyle diğer öğeler arasındaki boşluğu belirler. 
        */
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // vertical axis
          crossAxisAlignment: CrossAxisAlignment.stretch, // horizantal axis
          children: [
            Text(currentQuestion.text,
                textAlign: TextAlign.center,
                // Google fonts 3. party package'dan çağrılan fonksiyon
                style: GoogleFonts.lato(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            /*Bu kod parçası, currentQuestion.answers listesindeki her bir cevabı (answer) alarak, 
            her biri için bir AnswerButton widget'ı oluşturur. map fonksiyonu bir Iterable döndürdüğü için, 
            bu Iterable'i bir List<Widget>'a dönüştürmek amacıyla ... (spread operator) kullanılır. 
            Böylece, her AnswerButton widget'ı Column ya da benzeri bir widget'ın children listesine eklenir.
        
            Kısaca: currentQuestion.answers listesindeki cevaplardan bir dizi buton oluşturur ve bunları listeye yayarak ekler. 
            */
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  // this is how you use functions from another class and pass data via functions
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
