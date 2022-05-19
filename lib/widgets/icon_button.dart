import 'package:flutter/material.dart';

IconButton createIconInfoButton(BuildContext context, String? tooltip,
    {required VoidCallback onPopTextPressed,
    required String title,
    required String content,
    required String popText}) {
  return IconButton(
    tooltip: tooltip,
    icon: const Icon(Icons.info),
    onPressed: () {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onPopTextPressed,
              child: Text(popText),
            ),
          ],
        ),
      );
    },
  );
}
