import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        // butona vertical ve horizantal olarak padding koyulmasını sağlıyor
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        // buton arkaplan rengi
        backgroundColor: const Color.fromARGB(255, 50, 0, 116),
        // buton text rengi
        foregroundColor: Colors.white,
        // buton şekli
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
