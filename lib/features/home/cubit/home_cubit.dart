import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'home_state.dart';

class HomeCubit extends HydratedCubit<HomeState> {
  HomeCubit() : super(HomeState.home);

  void changeTab(int index) => emit(HomeState.values.elementAt(index));

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    return HomeState.values.elementAt(json['index']);
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) => {'index': state.index};
}
