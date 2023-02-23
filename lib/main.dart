import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_controller/slider_controller_observer.dart';

import 'app.dart';

void main() {
  Bloc.observer = SliderControllerObserver();
  runApp(const MyApp());
}
