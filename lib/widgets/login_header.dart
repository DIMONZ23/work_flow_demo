import 'package:flutter/material.dart';
import '../screens/wf_register_screen.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'ログオン',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
         IconButton(
              icon: const Icon(Icons.info_outline, size: 24),
              color: Colors.grey.shade600,
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true, // 👈 click background để đóng
                  barrierLabel: 'Dismiss',
                  barrierColor: Colors.black.withValues(alpha: 0.5), // 👈 nền xám mờ
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const WfRegisterScreen();
                  },
                  transitionBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
