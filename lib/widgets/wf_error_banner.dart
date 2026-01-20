import 'package:flutter/material.dart';

class WfErrorBanner extends StatelessWidget {
  const WfErrorBanner({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE44F4F),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
