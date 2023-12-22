import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showCustomDialog(BuildContext context,String title,String body){
  showDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Text("failed to create"),
          content: Text(
            body,
          ),
          actions: [
            CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('close')),
          ],
        );
      });
}