import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const ActionButton({
    Key? key,
    required this.label,
    this.icon,
    this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints(
          minWidth: width ?? double.infinity,
          minHeight: height ?? 0, 
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
