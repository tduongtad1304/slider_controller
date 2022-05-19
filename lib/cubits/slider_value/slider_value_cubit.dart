import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vector_math/vector_math.dart' show degrees;

part 'slider_value_state.dart';

class SliderValueCubit extends Cubit<SliderValueState> {
  SliderValueCubit() : super(SliderValueState.initial());

  void setOpacity(double opacity) => emit(state.copyWith(opacity: opacity));

  void setSize(double size) => emit(state.copyWith(size: size));

  void setDegree(double degree) => emit(state.copyWith(degree: degree));
}
