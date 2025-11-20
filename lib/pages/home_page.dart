import 'package:flutter/material.dart';
import '../widgets/recent_item.dart';
import '../widgets/recommended.dart';
import '../widgets/navbar.dart';
import 'music_player.dart';
import '../utils/page_transitions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void onNavTap(int index) {
    setState(() => currentIndex = index);

    if (index == 1) {
      Navigator.push(
        context,
        CustomPageTransitions.slideUp(
          const RouteSettings(name: '/music'),
          const MusicPlayerPage(),
        ),
      ).then((_) {
        setState(() => currentIndex = 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0518),
      bottomNavigationBar: SafeArea(
        child: BottomNavBar(
          currentIndex: currentIndex,
          onTap: onNavTap,
          isMini: false,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 10),

            // Profile Section
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage("assets/profile.png"),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Kelompok 10",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Soundifiy Premium",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.notifications_none, color: Colors.white70),
              ],
            ),

            const SizedBox(height: 20),

            // Title Section
            const Text(
              "Listen The\nLatest Musics",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 20),

            // Search Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.white54),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Music",
                        hintStyle: TextStyle(color: Colors.white38),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Recently Played Section
            const Text(
              "Recently Played",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 15),

            // Horizontal Recently Played List
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  RecentlyItem(img: "assets/r1.jpeg", title: "Nirvana"),
                  RecentlyItem(img: "assets/r2.jpg", title: "Gorillaz"),
                  RecentlyItem(img: "assets/r3.png", title: "Joji"),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Recommended Section Title
            const Text(
              "Recommend for you",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 15),

            // Recommended Items
            const RecommendedItem(
              img: "assets/c1.png",
              title: "I Wanna Be Yours",
              artist: "Artic Monkey",
              views: "865k",
            ),
            const RecommendedItem(
              img: "assets/c2.png",
              title: "Last Night on Earth",
              artist: "Green Day",
              views: "1.5m",
            ),
            const RecommendedItem(
              img: "assets/c3.webp",
              title: "BIRDS OF FEATHER",
              artist: "Billie Eilish",
              views: "3.2m",
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}