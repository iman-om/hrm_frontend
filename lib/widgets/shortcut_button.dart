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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min, 
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
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20), 
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    icon,
                    color: Colors.blue,
                    size: 24, 
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14, 
              color: Colors.black,
              fontWeight: FontWeight.bold, 
            ),
          ),
        ],
      ),
    );
  }
}
