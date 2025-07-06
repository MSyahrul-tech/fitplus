import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SportPage extends StatelessWidget {
  const SportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sport Page"),
          backgroundColor: const Color.fromARGB(146, 94, 233, 1),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.accessibility_new_outlined), text: 'Workout'),
              Tab(icon: Icon(Icons.pool), text: 'Swimming'),
              Tab(icon: Icon(Icons.self_improvement), text: 'Yoga'),
            ],
          ),
        ),
        body: TabBarView(
          children: [

           
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                workoutItem(
                  title: "Chest",
                  exercises: [
                    "Bench press (3x15 reps)",
                    "Incline bench press (3x15 reps)",
                    "Pec deck (3x15 reps)",
                  ],
                  images: [
                    "assets/images/chest1.jpg",
                    "assets/images/chest2.jpg",
                  ],
                ),
                const Divider(),
                workoutItem(
                  title: "Shoulder",
                  exercises: [
                    "Shoulder press (3x15 reps)",
                    "Lateral raise (3x15 reps)",
                    "Rear delt flys (3x15 reps)",
                  ],
                  images: [
                    "assets/images/shoulder1.jpg",
                    "assets/images/shoulder2.jpg",
                  ],
                ),
                const Divider(),
                workoutItem(
                  title: "Back",
                  exercises: [
                    "Lat pulldown (3x15 reps)",
                    "Barbell row (3x15 reps)",
                    "Close grip cable row (3x15 reps)",
                  ],
                  images: [
                    "assets/images/back1.jpg",
                    "assets/images/back2.jpg",
                  ],
                ),
                const Divider(),
                workoutItem(
                  title: "Bicep",
                  exercises: [
                    "Dumbell biceps curl (3x15 reps)",
                    "Alternating hammer curl (3x15 reps)",
                    "Reverse curl (3x15 reps)",
                  ],
                  images: [
                    "assets/images/bicep1.jpg",
                    "assets/images/bicep2.jpg",
                  ],
                ),
                const Divider(),
                workoutItem(
                  title: "Tricep",
                  exercises: [
                    "Bar pushdown (3x15 reps)",
                    "Reverse pushdown (3x15 reps)",
                    "Rope pushdown (3x15 reps)",
                  ],
                  images: [
                    "assets/images/tricep1.jpg",
                    "assets/images/tricep2.jpg",
                  ],
                ),
                const Divider(),
                workoutItem(
                  title: "Leg",
                  exercises: [
                    "Squat (3x15 reps)",
                    "Leg extension (3x15 reps)",
                    "Leg press (3x15 reps)",
                    "Romanian deadlift (3x15 reps)",
                    "Calf raise (3x15 reps)",
                  ],
                  images: [
                    "assets/images/leg1.jpg",
                    "assets/images/leg2.jpg",
                  ],
                ),
              ],
            ),

           
            ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ListTile(
                  leading: Icon(Icons.pool_outlined),
                  title: Text("Gaya Dada"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Melatih otot dada dan kaki."),
                      Text("Gerakan lambat dan stabil (cocok untuk pemula)."),
                      Text("Meningkatkan koordinasi tubuh."),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.pool_outlined),
                  title: Text("Gaya Bebas"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Membakar banyak kalori."),
                      Text("Melatih otot dada, bahu, punggung, inti tubuh."),
                      Text("Cocok untuk latihan kardio intens."),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.pool_outlined),
                  title: Text("Gaya Punggung"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Melatih otot punggung dan bahu."),
                      Text("Baik untuk postur dan tulang belakang."),
                      Text("Tidak terlalu berat."),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.pool_outlined),
                  title: Text("Gaya Kupu-kupu"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Latihan seluruh tubuh yang intens."),
                      Text("Sangat bagus untuk kekuatan otot punggung dan lengan."),
                      Text("Membakar kalori sangat tinggi (tapi cukup sulit)."),
                    ],
                  ),
                ),
              ],
            ),

          
            ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ListTile(
                  leading: Icon(Icons.self_improvement_outlined),
                  title: Text("Downward"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fungsi: peregangan seluruh tubuh, terutama bahu, punggung, dan paha belakang."),
                      Text("Manfaat: melatih kekuatan tubuh bagian atas dan fleksibilitas."),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.self_improvement_outlined),
                  title: Text("Warrior Pose"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fungsi: kekuatan kaki, pinggul, keseimbangan."),
                      Text("Manfaat: postur tubuh lebih baik dan meningkatkan ketahanan otot."),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.self_improvement_outlined),
                  title: Text("Cobra Pose"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fungsi: peregangan dada dan punggung bawah."),
                      Text("Manfaat: meningkatkan fleksibilitas tulang belakang dan membuka dada."),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget workoutItem({
    required String title,
    required List<String> exercises,
    required List<String> images,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 0.8,
          ),
          items: images
              .map((imagePath) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 10),
        ...exercises.map((e) => Text(e)), 
      ],
    );
  }
}
