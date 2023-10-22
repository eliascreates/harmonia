import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_feed_state.dart';

class MainFeedCubit extends Cubit<MainFeedState> {
  MainFeedCubit() : super(MainFeedInitial());
}
