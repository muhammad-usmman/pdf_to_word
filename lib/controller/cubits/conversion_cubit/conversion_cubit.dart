import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'conversion_state.dart';

class ConversionCubit extends Cubit<ConversionState> {
  ConversionCubit() : super(ConversionInitial());
}
