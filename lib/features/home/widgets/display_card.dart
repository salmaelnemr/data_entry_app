import 'package:flutter/material.dart';
import '../../../core/widgets/app_text.dart';

class DisplayCard extends StatelessWidget {
  final String text;

  const DisplayCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: AppText(
          title: text,
          color: Colors.black87,
          fontSize: 18,
        ),
      ),
    );
  }
}
