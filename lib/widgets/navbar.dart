import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool isMini;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.isMini = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isMini 
          ? const EdgeInsets.symmetric(horizontal: 25, vertical: 10)
          : const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isMini 
            ? const Color(0xFF120A28).withOpacity(0.8)
            : const Color(0xFF120A28),
        borderRadius: isMini ? BorderRadius.circular(22) : BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: isMini ? 15 : 10,
            spreadRadius: isMini ? 0 : 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.music_note, 1),
          _buildNavItem(Icons.favorite_border, 2),
          _buildNavItem(Icons.person, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isActive = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: isActive
              ? const LinearGradient(
                  colors: [Color(0xFF6C4DF4), Color(0xFF7D59FF)],
                )
              : null,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 28,
          color: isActive ? Colors.white : Colors.white70,
        ),
      ),
    );
  }
}