part of 'clock_cubit.dart';

@immutable
sealed class ClockState {}

final class ClockInitial extends ClockState {}
final class ClockSeconds extends ClockState {}
final class ClockMinutes extends ClockState {}
final class ClockHours extends ClockState {}

