import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

class ToastHelper {
  static void info(BuildContext context, String title, String description) {
    return CherryToast.info(
      title: Text(title, style: const TextStyle(color: Colors.black)),
      action: Text(description, style: const TextStyle(color: Colors.black)),
      // actionHandler: () {
      //  },
    ).show(context);
  }

  static void success(
    BuildContext context,
    String title,
  ) {
    return CherryToast.success(title: Text(title, style: const TextStyle(color: Colors.black)))
        .show(context);
  }

  static void warning(
    BuildContext context,
    String title,
    String description,
  ) {
    return CherryToast.warning(
      title: Text(title, style: const TextStyle(color: Colors.black)),
      // description: Text(description, style: const TextStyle(color: Colors.black)),
      // animationType: AnimationType.fromLeft,
      // action: const Text("Backup data", style: TextStyle(color: Colors.black)),
      // actionHandler: () {
      //   print("Hello World!!");
      // },
    ).show(context);
  }
}
