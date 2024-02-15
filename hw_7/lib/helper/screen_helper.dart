import 'package:flutter/material.dart';

extension Screen on BuildContext {
  getW() {
    return MediaQuery.of(this).size.width;
  }

  getH() {
    return MediaQuery.of(this).size.height;
  }

  pushTo({next}) {
    return Navigator.of(this)
        .push(MaterialPageRoute(builder: (context) => next));
  }

  sBox() {
    return const SizedBox(
      height: 20,
    );
  }
}
