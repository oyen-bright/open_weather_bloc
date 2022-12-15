part of 'tempsettings_bloc.dart';

enum TempUnit { celsius, fahrenheit }

class TempsettingsState extends Equatable {
  final TempUnit tempunit;
  const TempsettingsState({
    this.tempunit = TempUnit.celsius,
  });

  @override
  List<Object?> get props => [tempunit];

  TempsettingsState copyWith({
    TempUnit? tempunit,
  }) {
    return TempsettingsState(
      tempunit: tempunit ?? this.tempunit,
    );
  }

  @override
  bool get stringify => true;
}
