part of 'slider_value_cubit.dart';

class SliderValueState extends Equatable {
  final double opacity;
  final double size;
  final double degree;

  const SliderValueState(
    this.opacity,
    this.size,
    this.degree,
  );

  double get opacityValue => opacity;
  double get sizeValue => size;
  double get degreeValue => degree;

  factory SliderValueState.initial() => const SliderValueState(0.1, 30.0, 0.0);

  @override
  List<Object?> get props => [opacity, size, degree];

  SliderValueState copyWith({
    double? opacity,
    double? size,
    double? degree,
  }) {
    return SliderValueState(
      opacity ?? this.opacity,
      size ?? this.size,
      degree ?? this.degree,
    );
  }

  @override
  String toString() =>
      'Slider Value(size: $size , degree: ${degrees(degree)}\u00B0, opacity: $opacity)';
}
