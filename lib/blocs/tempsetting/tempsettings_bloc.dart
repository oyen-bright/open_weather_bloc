import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tempsettings_event.dart';
part 'tempsettings_state.dart';

class TempsettingsBloc extends Bloc<TempsettingsEvent, TempsettingsState> {
  TempsettingsBloc() : super(const TempsettingsState()) {
    on<ToggleTempEvent>((event, emit) {
      emit(state.copyWith(
          tempunit: state.tempunit == TempUnit.celsius
              ? TempUnit.fahrenheit
              : TempUnit.celsius));
    });
  }
}
