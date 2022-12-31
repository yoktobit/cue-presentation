import 'package:flutter/material.dart';
import 'package:test1/model/code_lists.dart';

Widget? createBottomNavigationBar(BuildContext context, CodeLists? codelists) {
  return codelists != null
      ? BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Listen",
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            } else if (index == 1) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/codelists', ModalRoute.withName('/'),
                  arguments: codelists);
            }
          },
        )
      : null;
}
