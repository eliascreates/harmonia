import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class AppBlocObserver extends BlocObserver {
  
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError $error');
    super.onError(bloc, error, stackTrace);
  }
}
