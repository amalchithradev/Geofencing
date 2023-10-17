
import 'dart:io';

import 'package:flutter/material.dart';
import '../Themes/gfThemes.dart';
class Dialogs {
  Future<bool?> exitAppDialog(BuildContext context) async {
    try {
      return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: gfTheme(context).dialogTheme.shape,
            title: Text('Exit', style: gfTheme(context).primaryTextTheme.headline2),
            content: Text(
              'Sure you want to exit?',
              style: gfTheme(context).primaryTextTheme.headline3,
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel', style: gfTheme(context).primaryTextTheme.headline3),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('Exit', style: gfTheme(context).primaryTextTheme.headline6),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  exit(0);
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }
}

