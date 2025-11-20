import 'package:flutter/material.dart';

class RecommendedItem extends StatelessWidget {
  final String img;
  final String title;
  final String artist;
  final String views;

  const RecommendedItem({
    super.key,
    required this.img,
    required this.title,
    required this.artist,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              img,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                Text(
                  artist,
                  style: const TextStyle(color: Colors.white60, fontSize: 14),
                ),
                Text(
                  "$views / steams",
                  style: const TextStyle(color: Colors.white38, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
