import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  String timeLeft() {
    Duration diff = exam.dateTime.difference(DateTime.now());
    if (diff.isNegative) {
      return "Испитот е поминат";
    }
    return "${diff.inDays} дена, ${(diff.inHours % 24)} часа";
  }

  @override
  Widget build(BuildContext context) {
    bool isPast = exam.dateTime.isBefore(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: isPast ? Colors.red.shade100 : Colors.green.shade100,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exam.subject,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: 6),
                    Text(
                        "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
                  ],
                ),

                Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 6),
                    Text("${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text("Простории: ${exam.rooms.join(", ")}"),
                    ),
                  ],
                ),

                const SizedBox(height: 15),
                Text("Преостанато време: ${timeLeft()}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
