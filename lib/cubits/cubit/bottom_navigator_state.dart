part of 'bottom_navigator_cubit.dart';

abstract class BottomNavigatorState extends Equatable {
  const BottomNavigatorState();

  @override
  List<Object> get props => [];
}

class BottomNavigatorInitial extends BottomNavigatorState {}

class BottomNavigatorInProgress extends BottomNavigatorState {}

class BottomNavigatorUpdated extends BottomNavigatorState {
  const BottomNavigatorUpdated({
    @required this.tabIndex,
  }) : assert(tabIndex != null);

  final int tabIndex;

  @override
  List<Object> get props => <Object>[tabIndex];
}
