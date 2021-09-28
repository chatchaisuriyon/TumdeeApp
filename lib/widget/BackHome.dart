import 'package:flutter/material.dart';

class BackHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              MediaQuery.of(context).orientation;
            });
      },
    );
  }
}
