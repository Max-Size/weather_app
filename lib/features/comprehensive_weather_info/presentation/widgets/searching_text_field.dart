import 'package:flutter/material.dart';

class SearchingTextFieldWidget extends StatelessWidget {
  const SearchingTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding:  EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Поиск',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
