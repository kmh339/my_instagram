import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'bottom_navigator_state.dart';

class BottomNavigatorCubit extends Cubit<BottomNavigatorState> {
  BottomNavigatorCubit() : super(BottomNavigatorInitial());

  void updateTabIndex({int index}) {
    emit(BottomNavigatorInProgress());
    emit(BottomNavigatorUpdated(tabIndex: index));
  }
}
