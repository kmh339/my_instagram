import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_icons/flutter_icons.dart';

class InstagramScreen extends StatefulWidget {
  @override
  _InstagramScreenState createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {
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

  Future<void> _onLoading() async {
    // monitor network fetch
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    await Future.delayed(Duration(milliseconds: 200));

    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          'assets/logos/instagram-logo.png',
          height: 48,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 10,
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
      body: SmartRefresher(
        controller: _refreshController,
        physics: const BouncingScrollPhysics(),
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
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
        footer: CustomFooter(
          builder: (BuildContext buildContext, LoadStatus loadStatus) {
            if (loadStatus == LoadStatus.loading) {
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
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext buildContext, int index) {
            if (index == 0) {
              return _HorizontalFriendList();
            }
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 100,
              height: 200,
              color: Colors.black,
            );
          },
        ),
      ),
    );
  }
}

class _HorizontalFriendList extends StatelessWidget {
  Widget _userAvatar() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 10),
      alignment: Alignment.center,
      height: 76,
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: 52,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    padding: EdgeInsets.all(0),
                    elevation: 0,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.grey[400],
                  ),
                ),
              ),
              Positioned(
                right: -2,
                bottom: -1,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
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
          const SizedBox(height: 7),
          Text(
            '내 스토리',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _friendAvatar({int index}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      height: 76,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: BorderSide(
                  width: 2,
                  color: Colors.red,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'others',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300],
            width: 0.5,
          ),
        ),
      ),
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext buildContext, int index) {
          if (index == 0) {
            return _userAvatar();
          }
          return _friendAvatar(index: index);
        },
      ),
    );
  }
}
