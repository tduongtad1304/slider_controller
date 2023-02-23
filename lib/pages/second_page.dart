import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubits.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          createIconInfoButton(context, 'Animated Opacity Info',
              title: 'Animated Opacity Controller',
              content:
                  'An animated opacity widget that can be used to fade in or out a widget within given duration.',
              popText: 'OK, I agree!',
              onPopTextPressed: () => Navigator.of(context).pop()),
          IconButton(
            onPressed: () =>
                Navigator.of(context).push(createRoute(const ThirdPage())),
            icon: const Icon(Icons.looks_3),
            tooltip: 'Move to second page',
          ),
        ],
        centerTitle: true,
        title: const Text('Animated Opacity Controller'),
      ),
      body: Center(
        child: BlocSelector<SliderValueCubit, SliderValueState, double>(
          selector: (state) => state.opacityValue,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: state,
                  duration: const Duration(milliseconds: 400),
                  child: const FlutterLogo(size: 180),
                ),
                const SizedBox(height: 40),
                Text(
                  'Animated Opacity: ${state.toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                Slider.adaptive(
                  activeColor: Colors.teal,
                  divisions: 100,
                  label: state.toStringAsFixed(2),
                  value: state,
                  onChanged: (opacityValue) {
                    context.read<SliderValueCubit>().setOpacity(opacityValue);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
