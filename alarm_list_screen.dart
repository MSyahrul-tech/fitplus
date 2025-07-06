import 'package:flutter/material.dart';
import 'reminder_sleep_screen.dart';

class AlarmListScreen extends StatefulWidget {
  const AlarmListScreen({super.key});

  @override
  State<AlarmListScreen> createState() => _AlarmListScreenState();
}

class _AlarmListScreenState extends State<AlarmListScreen> {
  List<Map<String, dynamic>> alarms = [];

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alarm List"),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 30),
            onPressed: () async {
              final newAlarm = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReminderSleepScreen(),
                ),
              );

              if (newAlarm != null && newAlarm is Map<String, dynamic>) {
                setState(() {
                  alarms.add(newAlarm);
                });
                _showSnackBar("Alarm berhasil ditambahkan!");
              }
            },
          ),
        ],
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: alarms.isEmpty
          ? const Center(child: Text("Belum ada alarm yang disimpan"))
          : ListView.builder(
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                final alarm = alarms[index];

                final String timeString = alarm['time'];
                final parts = timeString.split(':');
                final TimeOfDay time = TimeOfDay(
                  hour: int.parse(parts[0]),
                  minute: int.parse(parts[1]),
                );

                final String mode = alarm['mode'];
                final Map<String, bool> daysMap =
                    Map<String, bool>.from(alarm['days']);
                final days =
                    daysMap.keys.where((day) => daysMap[day]!).join(', ');

                bool isAlarmActive = alarm['isActive'] ?? true;

                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: ListTile(
                    title: Text(
                      "${time.format(context)} - $mode",
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Text("Hari: $days"),
                    leading: const Icon(Icons.alarm),
                    trailing: Switch(
                      value: isAlarmActive,
                      onChanged: (bool value) {
                        setState(() {
                          alarm['isActive'] = value;
                        });
                      },
                    ),
                    onTap: () async {
                      final editedAlarm = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReminderSleepScreen(
                            alarmData: alarm,
                          ),
                        ),
                      );

                      if (editedAlarm != null &&
                          editedAlarm is Map<String, dynamic>) {
                        setState(() {
                          alarms[index] = editedAlarm; // Update alarm
                        });
                        _showSnackBar("Alarm berhasil diperbarui!");
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
