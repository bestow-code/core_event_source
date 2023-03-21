import 'package:bloc/bloc.dart';
import 'package:test/scaffolding.dart';

class DebugBlocObserver extends BlocObserver {
  static void observe() {
    Bloc.observer = const DebugBlocObserver();
  }

  const DebugBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    printOnFailure('Bloc.onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('\nBloc.onError - ${bloc.runtimeType}');
    print(error.toString());
    print(stackTrace.toString());
  }
}
