import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Color returnColor(Map<String, Object> data) {
    if (data["user_answer"] == data["correct_answer"]) {
      return const Color.fromARGB(255, 6, 141, 252);
    }
    return const Color.fromARGB(255, 220, 63, 115);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // It takes a single child and make it scrollable
      child: SingleChildScrollView(
        child: Column(
          // map objesine aktırımı yaptıktan sonra .map fonksiyonunu kullanarak
          // değişkenleri build methodu içerisinde kullanmak mümkün
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                    color: returnColor(data),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),

                // Expanded widget'ı, layout içerisindeki widget'ın, diğer widget'ların
                // kapladığı alanın dışında kalan boş alanı dinamik olarak kaplamasını sağlar

                /* 
                If you use "Expanded" inside of a row, the widget that is passed as a child
                to expanded, can't take more than the width of that row. That's what
                "Expanded" guarantees.    
                */
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data["question"] as String,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data["user_answer"] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 223, 75, 125),
                        ),
                      ),
                      Text(
                        data["correct_answer"] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 40, 149, 239),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
