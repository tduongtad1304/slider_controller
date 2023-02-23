import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:vector_math/vector_math.dart' show degrees;

import '../cubits/cubits.dart';
import '../widgets/widgets.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        actions: [
          createIconInfoButton(
            context,
            'Animated Size Controller Info',
            title: 'Animated Size Controller',
            content:
                'An animated size widget that can be used to adjust the size of a widget within given duration by animation.',
            popText: 'OK, I agree!',
            onPopTextPressed: () => Navigator.of(context).pop(),
          ),
        ],
        centerTitle: true,
        title: const Text('Animated Size Controller'),
      ),
      body: Center(
        child: BlocBuilder<SliderValueCubit, SliderValueState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSize(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 1),
                  child: Transform.rotate(
                      angle: state.degreeValue,
                      child: FlutterLogo(size: state.sizeValue)),
                ),
                const SizedBox(height: 40),
                Text(
                  'Size: ${state.sizeValue}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                Slider.adaptive(
                  activeColor: Colors.cyan,
                  min: 30.0,
                  max: 300.0,
                  label: state.sizeValue.toString(),
                  divisions: 270,
                  value: state.sizeValue,
                  onChanged: (sizeValue) {
                    context.read<SliderValueCubit>().setSize(sizeValue);
                  },
                ),
                const SizedBox(height: 25),
                Slider.adaptive(
                  activeColor: Colors.cyan,
                  min: radians(-360.0),
                  max: radians(360.0),
                  divisions: 72000,
                  label: degrees(state.degreeValue).toStringAsFixed(2),
                  value: state.degreeValue,
                  onChanged: (degreeValue) {
                    context.read<SliderValueCubit>().setDegree(degreeValue);
                  },
                ),
                Text(
                  'Degree: ${degrees(state.degreeValue).toStringAsFixed(2)}\u00B0',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
