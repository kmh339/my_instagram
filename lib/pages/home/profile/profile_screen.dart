import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_instagram/blocs/authentication/authentication_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();

    _refreshController = RefreshController();
  }

  Future<void> _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 100));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  Widget _textButton({int count, String title}) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: Colors.grey,
      ),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'my_account',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 16,
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.plus,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.bars,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        physics: const BouncingScrollPhysics(),
        enablePullUp: false,
        enablePullDown: true,
        onRefresh: _onRefresh,
        header: CustomHeader(
          builder: (BuildContext buildContext, RefreshStatus refreshStatus) {
            if (refreshStatus == RefreshStatus.refreshing || refreshStatus == RefreshStatus.idle || refreshStatus == RefreshStatus.completed) {
              return SizedBox(
                height: 60,
                child: CupertinoActivityIndicator(),
              );
            } else {
              return const SizedBox(
                height: 0,
              );
            }
          },
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  _UserAvatar(),
                  const SizedBox(
                    width: 24,
                  ),
                  _textButton(count: 4, title: '게시물'),
                  const SizedBox(
                    width: 16,
                  ),
                  _textButton(count: 4, title: '팔로워'),
                  const SizedBox(
                    width: 16,
                  ),
                  _textButton(count: 4, title: '팔로잉'),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  '테스트',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                height: 32,
                child: OutlinedButton(
                  onPressed: () => context.read<AuthenticationBloc>().add(AuthenticationDisproved()),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    primary: Colors.grey,
                    side: BorderSide(
                      color: Colors.grey[400],
                      width: 0.8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: Text(
                    '프로필편집(로그아웃)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            width: 80,
            height: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                padding: EdgeInsets.all(0),
                elevation: 0,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[400],
              ),
            ),
          ),
          Positioned(
            right: -2,
            bottom: -1,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.white,
              ),
              child: Icon(
                FontAwesome.plus_circle,
                color: Colors.blue,
                size: 21,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
