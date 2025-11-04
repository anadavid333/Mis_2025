import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';
class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    bool isPast = exam.dateTime.isBefore(DateTime.now());

    return Card(
      color: isPast ? Colors.purple.shade100 : Colors.green.shade100,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.school, size: 35),
        title: Text(
          exam.subject,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month, size: 18),
                const SizedBox(width: 4),
                Text(
                    "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.access_time, size: 18),
                const SizedBox(width: 4),
                Text("${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.location_on, size: 18),
                const SizedBox(width: 4),
                Text(exam.rooms.join(", ")),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExamDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}