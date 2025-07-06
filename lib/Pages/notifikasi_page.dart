import 'package:fitplus/screen/home_screen.dart';
import 'package:flutter/material.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({super.key});

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  // --- Data Dummy Notifikasi Langsung dalam List ---
  // isRead: false = belum dibaca, true = sudah dibaca
  final List<Map<String, dynamic>> _allNotifications = [
    {
      'title': "Promo Spesial FitPlus!",
      'message':
          "Dapatkan diskon 20% untuk semua kelas yoga bulan ini. Buruan daftar!",
      'timestamp': DateTime.now().subtract(const Duration(hours: 1)),
      'isRead': false,
    },
    {
      'title': "Pengingat Latihan",
      'message': "Waktunya latihan beban! Jangan lewatkan sesi hari ini.",
      'timestamp': DateTime.now().subtract(const Duration(hours: 3)),
      'isRead': false,
    },
    {
      'title': "Selamat Datang di FitPlus!",
      'message':
          "Terima kasih telah bergabung. Mari capai tujuan kebugaran Anda!",
      'timestamp': DateTime.now().subtract(const Duration(days: 2)),
      'isRead': true,
    },
    {
      'title': "Pembaharuan Aplikasi",
      'message': "Versi terbaru FitPlus kini tersedia dengan fitur baru!",
      'timestamp': DateTime.now().subtract(const Duration(days: 5)),
      'isRead': true,
    },
    {
      'title': "Kelas Baru Ditambahkan!",
      'message':
          "Cek jadwal kelas zumba terbaru bersama instruktur profesional.",
      'timestamp': DateTime.now().subtract(const Duration(days: 1)),
      'isRead': false,
    },
    {
      'title': "Profil Anda Lengkap",
      'message': "Selamat! Profil kebugaran Anda kini 100% lengkap.",
      'timestamp': DateTime.now().subtract(const Duration(days: 7)),
      'isRead': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter notifikasi yang belum dibaca
    final List<Map<String, dynamic>> unreadNotifications =
        _allNotifications
            .where((notification) => !notification['isRead'])
            .toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Notifikasi",
            style: TextStyle(color: Colors.black87),
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          bottom: const TabBar(
            tabs: [Tab(text: "Belum Dibaca"), Tab(text: "Semua")],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),
        ),
        body: TabBarView(
          children: [
            // Konten untuk tab "Belum Dibaca"
            _buildNotificationList(unreadNotifications),
            // Konten untuk tab "Semua"
            _buildNotificationList(_allNotifications),
          ],
        ),
      ),
    );
  }

  // --- Widget Pembantu untuk Membuat Daftar Notifikasi ---
  Widget _buildNotificationList(List<Map<String, dynamic>> notifications) {
    if (notifications.isEmpty) {
      return const Center(
        child: Text(
          "Tidak ada notifikasi di sini.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    return ListView(
      children:
          notifications.map((notification) {
            return _NotificationCard(
              notification: notification,
              onTap: () {
                // Ketika notifikasi diketuk, tandai sebagai sudah dibaca
                setState(() {
                  // Cari notifikasi di _allNotifications dan ubah isRead-nya
                  int index = _allNotifications.indexOf(notification);
                  if (index != -1) {
                    _allNotifications[index]['isRead'] = true;
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Notifikasi '${notification['title']}' ditandai sudah dibaca.",
                    ),
                  ),
                );
              },
            );
          }).toList(),
    );
  }

  // Fungsi pembantu untuk memformat waktu
}

// --- Widget Terpisah untuk Setiap Item Notifikasi ---
class _NotificationCard extends StatelessWidget {
  final Map<String, dynamic> notification;
  final VoidCallback onTap;

  const _NotificationCard({required this.notification, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isRead = notification['isRead'];
    String title = notification['title'];
    String message = notification['message'];
    DateTime timestamp = notification['timestamp'];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      color: isRead ? Colors.white : Colors.blue.shade50,
      child: ListTile(
        leading: Icon(
          isRead ? Icons.notifications : Icons.notifications_active,
          color: isRead ? Colors.grey : Colors.blue,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          "$message\n${_formatTimestamp(timestamp)}",
          style: TextStyle(color: Colors.grey.shade700),
        ),
        isThreeLine: true,
        onTap: onTap, // Gunakan callback onTap yang diterima
      ),
    );
  }

  // Fungsi pembantu untuk memformat waktu (disalin ke sini karena _NotificationCard adalah StatelessWidget terpisah)
  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return "Baru saja";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} menit lalu";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} jam lalu";
    } else if (difference.inDays == 1) {
      return "Kemarin";
    } else {
      return "${timestamp.day}/${timestamp.month}/${timestamp.year}";
    }
  }
}
