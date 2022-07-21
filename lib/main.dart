import 'package:bukit_vista_flutter_assessment/bloc_observer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}