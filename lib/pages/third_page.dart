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
    double sizeValue =
        context.select((SliderValueCubit cubit) => cubit.state.sizeValue);
    double degreeValue =
        context.select((SliderValueCubit cubit) => cubit.state.degreeValue);

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
            onPopTextPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        centerTitle: true,
        title: const Text('Animated Size Controller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSize(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(seconds: 1),
              child: Transform.rotate(
                  angle: degreeValue, child: FlutterLogo(size: sizeValue)),
            ),
            const SizedBox(height: 40),
            Text(
              'Size: $sizeValue',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Slider.adaptive(
              activeColor: Colors.cyan,
              min: 30.0,
              max: 300.0,
              label: sizeValue.toString(),
              divisions: 270,
              value: sizeValue,
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
              label: degrees(degreeValue).toStringAsFixed(2),
              value: degreeValue,
              onChanged: (degreeValue) {
                context.read<SliderValueCubit>().setDegree(degreeValue);
              },
            ),
            Text(
              'Degree: ${degrees(degreeValue).toStringAsFixed(2)}\u00B0',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
