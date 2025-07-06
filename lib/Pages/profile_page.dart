import 'package:fitplus/provider/dark_mode.dart';
import 'package:fitplus/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String defaultBahasa = "Indonesia";

  @override
  Widget build(BuildContext context) {
    final List<String> pilihanBahasa = [
      "Indonesia",
      "Inggris",
      "China",
      "Jepang",
      "India",
    ];

    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,

        title: const Text("Profile"),
        iconTheme: IconThemeData(color: Colors.black87),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                "Muhammad Amri",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: const Text("hafzamrii@gmail.com"),
              leading: Image.asset(
                "assets/images/user-fitplus.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            _buildListTile("Edit Profile"),
            const Divider(),
            _buildListTile("Aktivitas"),
            const Divider(),
            ListTile(
              trailing: DropdownButton(
                value: defaultBahasa,
                underline: const SizedBox(),
                padding: const EdgeInsets.only(right: 15),
                hint: Text(defaultBahasa),
                onChanged: (String? newBahasa) {
                  if (newBahasa != null) {
                    setState(() {
                      defaultBahasa = newBahasa;
                    });
                  }
                },
                items:
                    pilihanBahasa.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              ),
              title: const Text("Pilih Bahasa", style: TextStyle(fontSize: 16)),
            ),
            const Divider(),
            ListTile(
              trailing: Switch(
                value: isDarkMode,
                onChanged: (bool value) {
                  setState(() {
                    themeProvider.toggleTheme(value);
                  });
                },
              ),
              title: const Text("Dark Mode", style: TextStyle(fontSize: 16)),
            ),
            const Divider(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: const Color.fromARGB(146, 94, 233, 1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: const Text(
                "Keluar",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(String title) {
    return ListTile(
      trailing: const Icon(Icons.arrow_right, size: 22),
      title: Text(title, style: const TextStyle(fontSize: 16)),
    );
  }
}
