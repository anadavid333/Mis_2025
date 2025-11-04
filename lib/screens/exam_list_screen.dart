import '../widgets/exam_card.dart';
import 'package:flutter/material.dart';
import 'package:lab1/models/exam.dart';

class ExamListScreen extends StatelessWidget{
  const ExamListScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    List<Exam> exams = [
      Exam(subject: "Мобилни апликации", dateTime: DateTime(2025, 2, 5, 10, 0), rooms: ["Лаб 1"]),
      Exam(subject: "Веб базирани системи", dateTime: DateTime(2025, 2, 6, 12, 0), rooms: ["АМФ 3"]),
      Exam(subject: "Оперативни системи", dateTime: DateTime(2026, 2, 7, 9, 0), rooms: ["Е-2", "Е-1"]),
      Exam(subject: "Бази на податоци", dateTime: DateTime(2025, 2, 8, 11, 0), rooms: ["Лаб 2"]),
      Exam(subject: "Машинско учење", dateTime: DateTime(2025, 2, 9, 13, 0), rooms: ["АМФ 1"]),
      Exam(subject: "Информациски системи", dateTime: DateTime(2026, 2, 10, 8, 30), rooms: ["ЕК 2"]),
      Exam(subject: "Компјутерска графика", dateTime: DateTime(2025, 12, 11, 15, 0), rooms: ["Лаб 4"]),
      Exam(subject: "Дискретна математика", dateTime: DateTime(2025, 10, 20, 12, 0), rooms: ["Е-3"]),
      Exam(subject: "ООП", dateTime: DateTime(2025, 1, 21, 9, 0), rooms: ["Лаб 3"]),
      Exam(subject: "Интернет технологии", dateTime: DateTime(2025, 2, 4, 11, 0), rooms: ["АМФ 2"]),
    ];

    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) => ExamCard(exam: exams[index]),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.deepPurple.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.list_alt),
                const SizedBox(width: 6),
                Text(
                  "Вкупно испити: ${exams.length}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}