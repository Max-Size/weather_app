import 'package:flutter/material.dart';
import 'package:weather_app/config/routes.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/widgets/condition_widget.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/widgets/next_day_forecast_widget.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/widgets/today_hourly_forecast_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.location_city),
          onPressed: () => Navigator.of(context).pushNamed(
            AppRouteNames.favouriteCities,
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Center(child: Text('Погода')),
      ),
      backgroundColor: const Color.fromRGBO(244, 249, 255, 1),
      body: ListView(
        children: const [
          WeatherCondition(),
          TodayHourlyForecastWidget(),
          NextDayForecastWidget(dayIndex: 1),
          NextDayForecastWidget(dayIndex: 2),
        ],
      ),
    );
  }
}
