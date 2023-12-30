import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/pages/main_screen_widget.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/main_screen_model.dart';

class TodayHourlyForecastWidget extends StatelessWidget {
  const TodayHourlyForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();
    return ListView(
      scrollDirection: Axis.horizontal,
      children: ,
    );
  }
}

class HourlyForecastListItem extends StatelessWidget {
  
  final String time;
  final String conditionImageUrl;
  final int tempC;
  
  const HourlyForecastListItem({
    super.key, 
    required this.time, 
    required this.conditionImageUrl, 
    required this.tempC,});

  @override
  Widget build(BuildContext context) {
    return Column(children: [],);
  }
}
