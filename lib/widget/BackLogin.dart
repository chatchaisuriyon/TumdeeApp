import 'package:flutter/material.dart';

class BackLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed('HomePagelogin');
            });
      },
    );
  }
}
