import 'package:flutter/material.dart';


class ShortcutButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ShortcutButton({
    required this.title,
    required this.icon,
    required this.onTap,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );
  }
}
