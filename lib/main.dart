import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  Widget buildInfoTile(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "$title: $value",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStat(String value, String title) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor : Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Header Section
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.orange,
                        Colors.redAccent,

                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: -55,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundImage:
                      AssetImage("assets/images/profile.png"),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            /// Name & Profession
            const Center(
              child: Column(
                children: [
                  Text(
                    "Sahreyar Ahmed",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Software Engineer",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Flutter Developer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Statistics
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                  )
                ],
              ),
              child: Row(
                children: [
                  buildStat("8", "Projects"),
                  buildStat("200", "Followers"),
                  buildStat("5+", "Years Exp"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: toggleFollow,
                      icon: Icon(
                        isFollowing
                            ? Icons.check
                            : Icons.person_add,
                      ),
                      label: Text(
                        isFollowing
                            ? "Following"
                            : "Follow",
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.message),
                      label: const Text("Message"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.message),
                      label: const Text("Call"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Profile Details
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Profile Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  buildInfoTile(
                    Icons.email,
                    "Email",
                    "aniksahreyar@gmail.com",
                  ),

                  buildInfoTile(
                    Icons.badge,
                    "Student ID",
                    "232-134-036",
                  ),

                  buildInfoTile(
                    Icons.school,
                    "Department",
                    "Software Engineering",
                  ),

                  buildInfoTile(
                    Icons.calendar_month,
                    "Batch",
                    "5th",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// About Me
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Passionate Flutter developer with experience in building modern mobile applications. I enjoy creating beautiful user interfaces and solving real-world problems through technology.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}