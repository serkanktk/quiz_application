import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  // this will be automatically this.startQuiz argument
  final void Function() startQuiz;

  /* override'ı annotation'ınını kullanmamızın sebebi, bu methodun
  StatelessWidget için extend edildiğini vurgulamak!
  */
  @override
  Widget build(BuildContext context) {
    // Center widget centers its content. Therefore it's content covers all the screen!
    // Since it comes after Container widget, it will cover all the screen
    return Center(
      child: Column(
        // It will make column widget to use use min space in vertical axis (main axis = vertical axis !)
        mainAxisSize: MainAxisSize.min,
        /* 57 --> Adding Transparency to Widgets
              --> Color argument'ini kullanarak objelere opaklık veya saydamlık eklemek mümkün.
              Resmi istenilen layout rengine getirdikten sonra sağdaki sliding bar ile
              opaklık derecesini ayarlayabilirsin. .fromARGB fonksiyonunda en soldaki değeri maximum olan 255'e getirdiğinde
              widget tamamiyle opak olur. 0'a yaklaştıkça opaklık widget'ın opaklık derecesi düşer.
         */
        children: [
          Image.asset("assets/images/quiz-logo.png",
              width: 300, color: const Color.fromARGB(161, 255, 255, 255)),
          const SizedBox(height: 30),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
          ),
          const SizedBox(height: 30),
          /* --> 56) Adding Icons to Buttons
                --> Eğer butonlara icon eklemek istiyorsan, button widget'inden sonra
                .icon fonksiyonunu kullanabilirsin. Fakat bu durumda, child yerine
                label argument'ini kullanman gerekir. Icon için ise icon: argumentini
                kullanmalısın.

                --> Icon is a regular widget provided by Flutter. So, you can use it
                with other widgets as well, not just buttons.          
          */
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            // onPressed: startQuiz,  --> is possible as well
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz!"),
          )
        ],
      ),
    );
  }
}





/*
  --> Tasarım sırasında eğer henüz fonksiyonu oluşturmak istemiyorsan, kod
  yazarken bu şekilde anonymous function yazarak geçiştirebilirsin bir süreliğine
  onPressed için:
    OutlinedButton(
            onPressed: () {},
            child: const Text("Start Quiz!"),
          )

 */