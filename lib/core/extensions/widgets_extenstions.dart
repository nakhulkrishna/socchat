import 'package:flutter/material.dart';

extension ContextExtenions on BuildContext {
  showSnackBar(String text) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(
          content: Text(
        text,
      )));
}
