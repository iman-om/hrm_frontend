import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final VoidCallback onAddPressed;

  const CustomSearchBar({super.key, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 11.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 4), // Shadow position
                    blurRadius: 4, // Shadow blur
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 20,
                      color: Color(0xFF292D33),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'WorkSans',
                          color: Colors.black,
                        ),
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                          hintText: 'Search anything...',
                          hintStyle: TextStyle(
                            fontFamily: 'WorkSans',
                            color: Color(0xFF292D33),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 255, 255, 255),
          //     shape: BoxShape.circle,
          //   ),
          //   child: IconButton(
          //     icon: SvgPicture.asset(
          //       'assets/icons/add_icon.svg',
          //       fit: BoxFit.cover,
          //       width: 24,
          //       height: 24,
          //       color: Colors.white,
          //     ),
          //     onPressed: onAddPressed,
          //   ),
          // ),
        ],
      ),
    );
  }
}
