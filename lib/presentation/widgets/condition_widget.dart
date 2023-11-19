import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/provider/main_screen_model.dart';
import 'package:weather_app/presentation/widgets/additional_data_widget.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>().currentWeather;
    if (model == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final image = Image.network(
      'https:${model.current!.condition!.icon!}',
      height: 200,
      scale: 0.2,
    );
    return Column(
      children: [
        image,
        const ConditionText(),
        const Padding(
          padding: EdgeInsets.only(top: 50),
          child: WindAndHumInfoWIdget(),
        ),
      ],
    );
  }
}

class ConditionText extends StatelessWidget {
  const ConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>().currentWeather;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Text(model!.current!.lastUpdated!),
        Text(
          '${model?.current!.tempC!.toInt()}°C',
          style: const TextStyle(fontSize: 40),
        ),
        Text(
          '${model?.location?.name ?? ''}, ${model?.location?.country ?? ''} ',
        ),
        Text(model?.current?.condition!.text! ?? ''),
      ],
    );
  }
}

class WindAndHumInfoWIdget extends StatelessWidget {
  const WindAndHumInfoWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>().currentWeather;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AdditionalDataWidget(
            name: 'Ветер',
            figure: model?.current?.windKph,
            imagePath: 'assets/images/wind_flow.png',
          ),
          const MyDivider(),
          AdditionalDataWidget(
            name: 'Осадки',
            figure: model?.current?.precipMm,
            imagePath: 'assets/images/precipitation.png',
          ),
          const MyDivider(),
          AdditionalDataWidget(
            name: 'Влажность',
            figure: model?.current?.humidity?.toDouble(),
            imagePath: 'assets/images/humidity.png',
          ),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(253, 253, 253, 1),
        ),
        width: 3,
        height: 100,
      ),
    );
  }
}
