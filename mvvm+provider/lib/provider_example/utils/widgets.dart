import 'package:flutter/material.dart';

import 'utils.dart';

customTile(
    {required BuildContext context,
    required String title,
    required Icon icon,
    required Widget navigateTo}) {
  return ListTile(
    title: Text(title),
    leading: icon,
    onTap: () {
      Navigator.push(context, createRoute(child: navigateTo)
          // MaterialPageRoute(builder: (context) => navigateTo),
          );
    },
  );
}
