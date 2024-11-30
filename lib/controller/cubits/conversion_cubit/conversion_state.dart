part of 'conversion_cubit.dart';

@immutable
sealed class ConversionState {}

final class ConversionInitial extends ConversionState {}
final class ConversionLoading extends ConversionState {}
final class ConversionLoaded extends ConversionState {}
final class ConversionError  extends ConversionState {}
