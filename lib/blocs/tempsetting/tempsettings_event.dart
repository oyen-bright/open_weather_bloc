// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tempsettings_bloc.dart';

abstract class TempsettingsEvent extends Equatable {
  const TempsettingsEvent();

  @override
  List<Object> get props => [];
}

class ToggleTempEvent extends TempsettingsEvent {}
