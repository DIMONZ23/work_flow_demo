import 'package:flutter/material.dart';

class WfUrlDialogCard extends StatelessWidget {
  const WfUrlDialogCard({
    super.key,
    required this.statusLabel,
    required this.controller,
    required this.isSaveEnabled,
    required this.onSave,
    this.hintText = 'URLを入力してください',
    this.onChanged,
  });

  final String statusLabel;
  final TextEditingController controller;
  final bool isSaveEnabled;
  final VoidCallback onSave;
  final String hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WF URLステータス: $statusLabel',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
            ),
            onChanged: onChanged,
          ),
          const SizedBox(height: 18),
          Center(
            child: ElevatedButton(
              onPressed: isSaveEnabled ? onSave : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6DAAFC),
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade300,
                disabledForegroundColor: Colors.grey.shade600,
                minimumSize: const Size(96, 42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('保存'),
            ),
          ),
        ],
      ),
    );
  }
}
