import 'package:flutter/material.dart';

enum ToastVariant { success, error, warning, info }

class KToast extends StatelessWidget {
  final ToastVariant variant;
  final String message;

  const KToast({
    required this.variant,
    required this.message,
    Key? key,
  }) : super(key: key);

  Color getColor(ToastVariant variant) {
    switch (variant) {
      case ToastVariant.success:
        return Colors.green;
      case ToastVariant.error:
        return Colors.red;
      case ToastVariant.warning:
        return Colors.orange;
      case ToastVariant.info:
        return Colors.blueAccent;
    }
  }

  IconData getIcon(ToastVariant variant) {
    switch (variant) {
      case ToastVariant.success:
        return Icons.check_circle_outline;

      case ToastVariant.error:
        return Icons.error_outline;

      case ToastVariant.warning:
        return Icons.warning_amber_outlined;

      case ToastVariant.info:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: getColor(variant),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            getIcon(variant),
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              message,
              // maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
