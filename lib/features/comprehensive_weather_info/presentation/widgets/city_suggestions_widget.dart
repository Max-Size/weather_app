import 'package:flutter/material.dart';

class CitySuggestionsListWidget extends StatelessWidget {
  const CitySuggestionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 100),
      itemBuilder: (context, index){
        return const Text('cityName');
      },
      separatorBuilder: (context,index) => const Divider(),
      itemCount: 20,
    );
  }
}
