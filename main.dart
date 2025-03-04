/*
import 'package:flutter/material.dart';

void main() {
  // ignore: prefer_typing_uninitialized_variables
  var onPressed;
  // ignore: prefer_typing_uninitialized_variables
  var child = "Start Quiz";
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 93, 28, 104),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
              crossAxisAlignment: CrossAxisAlignment.center, // C. horizantally
              children: [
                Image.asset(
                  "assets/images/quiz-logo.png",
                  width: 300,
                ),
                const SizedBox(height: 40),
                const Text(
                  "Learn Flutter the fun way!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    child,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

*/

/*
Main'den sadece çağrı yapıyorsun.
Quiz'de background color gibi tüm ekranlarda kullanılacak düzenlemeleri yapıyorsun
Ayrıca ekran değişikliğide Quiz'de gerçekleşiyor ve farklı ekranlar farklı class'larda
yapılandırılıyor. Quiz.dart ekranların birbirleri ile haberleşmesini sağlıyor
denebilir.
 */

import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(
    const Quiz(),
  );
}
