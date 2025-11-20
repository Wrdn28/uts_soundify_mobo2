import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({super.key});

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  double currentSlider = 75;
  bool isPlaying = true;
  int currentNavIndex = 1; 

  void onNavTap(int index) {
    setState(() {
      currentNavIndex = index;
    });

    if (index == 0) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0518),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 26),
                  ),
                  const SizedBox(width: 15),

                  const Expanded(
                    child: Text(
                      "Green Day - Last Night on...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const Icon(Icons.favorite_border,
                      color: Colors.white, size: 26),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // images
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: const DecorationImage(
                  image: AssetImage("assets/c2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // title
            const Text(
              "Last Night on Earth",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Green Day",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            // slider music
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white24,
                      thumbColor: Colors.white,
                      trackHeight: 3,
                    ),
                    child: Slider(
                      value: currentSlider,
                      min: 0,
                      max: 200,
                      onChanged: (v) {
                        setState(() => currentSlider = v);
                      },
                    ),
                  ),

                  // Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("1:25",
                          style: TextStyle(color: Colors.white70, fontSize: 13)),
                      Text("3:15",
                          style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // player controll section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shuffle, color: Colors.white70, size: 30),
                const SizedBox(width: 25),

                Icon(Icons.skip_previous_rounded,
                    color: Colors.white70, size: 40),
                const SizedBox(width: 25),

                GestureDetector(
                  onTap: () {
                    setState(() => isPlaying = !isPlaying);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C4DF4), Color(0xFF7D59FF)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C4DF4).withOpacity(0.6),
                          blurRadius: 20,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),

                const SizedBox(width: 25),

                Icon(Icons.skip_next_rounded,
                    color: Colors.white70, size: 40),
                const SizedBox(width: 25),

                Icon(Icons.repeat, color: Colors.white70, size: 30),
              ],
            ),

            const Spacer(),

            // Mini Navbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: BottomNavBar(
                currentIndex: currentNavIndex,
                onTap: onNavTap,
                isMini: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}