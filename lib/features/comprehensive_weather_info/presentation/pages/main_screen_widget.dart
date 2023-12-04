import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/main_screen_model.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/widgets/condition_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<MainScreenModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Center(child: Text('Погода')),
      ),
      backgroundColor: const Color.fromRGBO(244, 249, 255, 1),
      body: /*const SizedBox(
        width: double.infinity,
        child:*/

          ListView(
        children: const [
          WeatherCondition(),
        ],
      ),
      //),
    );
  }
}
