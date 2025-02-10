import 'package:flutter/material.dart';

void showOtpDialog({
  required TextEditingController codeController,
  required BuildContext context,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [],
      );
    },
  );
}

// 32:23 continue tomorrow right here....
