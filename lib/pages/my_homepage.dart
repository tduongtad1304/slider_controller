import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubits.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double opacityValue =
        context.select((SliderValueCubit cubit) => cubit.state.opacityValue);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          createIconInfoButton(context, 'Opacity Controller Info',
              title: 'Opacity Controller',
              content:
                  'An opacity widget that can be used to set the opaticy of a widget.',
              popText: 'OK, I agree!', onPopTextPressed: () {
            Navigator.of(context).pop();
          }),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                createRoute(const SecondPage()),
              );
            },
            icon: const Icon(Icons.looks_two),
            tooltip: 'Move to second page',
          ),
        ],
        centerTitle: true,
        title: const Text('Opacity Controller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: opacityValue,
              child: const FlutterLogo(
                size: 180,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Opacity: ${opacityValue.toStringAsFixed(2)}',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Slider.adaptive(
              divisions: 100,
              label: opacityValue.toStringAsFixed(2),
              value: opacityValue,
              onChanged: (opacityValue) {
                context.read<SliderValueCubit>().setOpacity(opacityValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
