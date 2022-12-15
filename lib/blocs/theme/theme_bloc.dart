import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../../models/weather.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>((event, emit) {
      emit(state.copyWith(appTheme: event.appTheme));
    });
  }

  void setTheme(double currentTemp) {
    if (currentTemp > kWarmOrNot) {
      add(const ChangeThemeEvent(appTheme: AppTheme.light));
    } else {
      add(const ChangeThemeEvent(appTheme: AppTheme.dark));
    }
  }
}


// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   WeatherBloc weatherBloc;
//   late final StreamSubscription weatherSubscription;
//   ThemeBloc({required this.weatherBloc}) : super(ThemeState.initial()) {
//     weatherSubscription =
//         weatherBloc.stream.listen((WeatherState weatherState) {
//       if (weatherState.weather.temp > kWarmOrNot) {
//         add(const ChangeThemeEvent(appTheme: AppTheme.light));
//       } else {
//         add(const ChangeThemeEvent(appTheme: AppTheme.dark));
//       }
//     });

//     on<ChangeThemeEvent>((event, emit) {
//       emit(state.copyWith(appTheme: event.appTheme));
//     });
//   }

//   @override
//   Future<void> close() {
//     weatherSubscription.cancel();
//     return super.close();
//   }
// }
