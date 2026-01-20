import 'package:flutter/material.dart';
import 'package:demo_wf/models/action_size.dart';
import 'package:demo_wf/models/app_color.dart';

class WFButtonLoading extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final String? text;

  const WFButtonLoading({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.text,
  });
@override
Widget build(BuildContext context) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: width ?? SizeState.medium.value,
    ),
    child: ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? SizeState.medium.value, 48),
        backgroundColor: AppColor.primary.value,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(text ?? '',style: TextStyle(fontSize: 15),),
    ),
  );
}

}