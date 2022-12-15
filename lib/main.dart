import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_weather_cubit/blocs/Weather/weather_bloc.dart';
import 'package:open_weather_cubit/blocs/tempsetting/tempsettings_bloc.dart';
import 'package:open_weather_cubit/blocs/theme/theme_bloc.dart';

import 'package:open_weather_cubit/pages/homepage.dart';
import 'package:open_weather_cubit/repository/weather_repository.dart';
import 'package:open_weather_cubit/service/weatherapiservice.dart';
import 'package:http/http.dart' as http;

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<WeatherRepository>(
      create: (context) => WeatherRepository(
          weatherApiServices: WeatherApiService(httpClient: http.Client())),
      child: MultiBlocProvider(
          providers: [
            BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc(
                  weatherRepository: context.read<WeatherRepository>()),
            ),
            BlocProvider<TempsettingsBloc>(
              create: (context) => TempsettingsBloc(),
            ),
            BlocProvider<ThemeBloc>(
              create: (context) => ThemeBloc(),
            ),
          ],
          child: BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {
              context.read<ThemeBloc>().setTheme(state.weather.temp);
            },
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  title: 'Weather app',
                  theme: state.appTheme == AppTheme.dark
                      ? ThemeData.dark()
                      : ThemeData(
                          primarySwatch: Colors.blue,
                        ),
                  home: const Homepage(),
                );
              },
            ),
          )),
    );
  }
}
