  import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  String _selectedSpecialist = 'Nutritionist';
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay now = TimeOfDay.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: now,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  String _getScheduledDateTime(TimeOfDay selectedTime, DateTime selectedDate) {
    DateTime scheduled = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final dayName = DateFormat('EEEE').format(scheduled);
    final dateFormatted = DateFormat('dd-MM-yyyy').format(scheduled);
    final timeFormatted = DateFormat('HH:mm').format(scheduled);

    return '$dayName, $dateFormatted at $timeFormatted';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultation"),
        backgroundColor: const Color.fromARGB(146, 94, 233, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose What You Need:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: ['Nutritionist', 'Fitness Coach', 'Psychologist', 'General Doctor']
                  .map((specialist) => RadioListTile<String>(
                        title: Text(specialist),
                        value: specialist,
                        groupValue: _selectedSpecialist,
                        onChanged: (value) {
                          setState(() {
                            _selectedSpecialist = value!;
                          });
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select consultation time:",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectTime(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.access_time),
                    Text(
                      _selectedTime != null ? _selectedTime!.format(context) : 'Choose Time',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select consultation date:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: "Choose Date",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime now = DateTime.now();
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: now,
                  lastDate: DateTime(now.year + 3),
                );

                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                    _dateController.text =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline),
                label: const Text("Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(146, 94, 233, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                onPressed: () {
                  if (_selectedTime == null || _selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Please select a time and date")),
                    );
                    return;
                  }

                  final schedule =
                      _getScheduledDateTime(_selectedTime!, _selectedDate!);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Specialist: $_selectedSpecialist\nScheduled: $schedule",
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(146, 94, 233, 1),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: const Color.fromARGB(146, 94, 233, 1)),
              ),
              child: const Text(
                '"It\'s better to be sick because of exercise than sick because of love, '
                'it\'s better to choose DOMS in the body than DOMS in the heart."',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
