import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/routes.dart';
import 'package:weather_app/features/comprehensive_weather_info/presentation/provider/favorite_cities_model.dart';
import 'package:weather_app/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteCitiesModel(),
      child: MaterialApp(
        routes: AppRoutes.routes,
        initialRoute: AppRouteNames.main,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
