import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_instagram/cubits/cubit/bottom_navigator_cubit.dart';
import 'package:my_instagram/pages/home/instagram/instagram_screen.dart';
import 'package:my_instagram/pages/home/profile/profile_screen.dart';
import 'package:my_instagram/pages/home/search/search_screen.dart';
import 'package:my_instagram/pages/home/shop/shop_screen.dart';

import 'new_feed/new_feed_screen.dart';

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
          if (state.tabIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (BuildContext buildContext) => NewFeedScreen(),
              ),
            );
          } else {
            _bottomTabIndex = state.tabIndex;
          }
        }
      },
      child: BlocBuilder<BottomNavigatorCubit, BottomNavigatorState>(
        builder: (BuildContext buildContext, BottomNavigatorState state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: IndexedStack(
              index: _bottomTabIndex,
              children: [
                InstagramScreen(),
                SearchScreen(),
                Container(
                  color: Colors.white,
                ),
                ShopScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
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
                    Feather.search,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    FontAwesome.search,
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
                  label: 'shop',
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
                  label: 'profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
