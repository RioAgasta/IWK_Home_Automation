import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackbarService{
  void showSnakbar(BuildContext context, Message, color) {
    final snackBar = SnackBar(content: Text(Message), backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}