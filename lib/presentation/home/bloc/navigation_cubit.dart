import 'package:bloc/bloc.dart';


part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void updateIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}