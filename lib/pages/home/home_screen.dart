import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_instagram/cubits/cubit/bottom_navigator_cubit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomTabIndex;

  @override
  void initState() {
    super.initState();

    _bottomTabIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BottomNavigatorCubit, BottomNavigatorState>(
      listener: (BuildContext context, BottomNavigatorState state) {
        if (state is BottomNavigatorUpdated) {
          _bottomTabIndex = state.tabIndex;
        }
      },
      child: BlocBuilder<BottomNavigatorCubit, BottomNavigatorState>(
        builder: (BuildContext buildContext, BottomNavigatorState state) {
          return Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              title: Image.asset(
                'assets/logos/instagram-logo.png',
                width: 120,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              titleSpacing: 5,
              actions: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.heart,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.paperplane,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: Column(
              children: [],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 24,
              currentIndex: _bottomTabIndex,
              onTap: (int index) => context.read<BottomNavigatorCubit>().updateTabIndex(index: index),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/home.png',
                    width: 21,
                    height: 21,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/home.png',
                    width: 21,
                    height: 21,
                    color: Colors.black,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Ionicons.ios_search,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    Ionicons.md_search,
                    color: Colors.black,
                  ),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.plus_app,
                    color: Colors.black,
                  ),
                  label: 'plus',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.bag,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    CupertinoIcons.bag_fill,
                    color: Colors.black,
                  ),
                  label: 'bag',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.person_crop_circle,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    CupertinoIcons.person_crop_circle_fill,
                    color: Colors.black,
                  ),
                  label: 'bag',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
