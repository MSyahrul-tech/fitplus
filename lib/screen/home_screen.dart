import 'package:flutter/material.dart';
// import 'package:fitplus/Authentication/login_screen.dart';
import 'consultasion_page.dart';
// import 'healty_food_page.dart';
// import 'reminder_sleep_page.dart';
 import 'Sport_Page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo-brand.png", width: 90),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(146, 94, 233, 1),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => LoginScreen()),
            // );
          },
          icon: Icon(Icons.menu, color: Colors.black),
        ),
      ),
      body: GridView.count(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        children: [
          _buildGridItem(
            imagePath: "assets/images/healty-food.png",
            label: "HEALTY FOOD",
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => HealtyFoodPage()));
            },
          ),
          _buildGridItem(
            imagePath: "assets/images/reminder-sleep.png",
            label: "REMINDER SLEEP",
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => ReminderSleepPage()));
            },
          ),
          _buildGridItem(
            imagePath: "assets/images/sport.png",
            label: "SPORT",
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (_) => SportPage()));
            },
          ),
          _buildGridItem(
            imagePath: "assets/images/consultation-time.png",
            label: "CONSULTATION TIME",
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (_) => ConsultationPage()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Account"),
        ],
      ),
    );
  }

  // Widget reusable untuk item Grid
  Widget _buildGridItem({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 242, 153),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: 150, fit: BoxFit.cover),
              const SizedBox(height: 20),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
