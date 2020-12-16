import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        header: CustomHeader(
          builder: (BuildContext buildContext, RefreshStatus refreshStatus) {
            if (refreshStatus == RefreshStatus.refreshing || refreshStatus == RefreshStatus.idle || refreshStatus == RefreshStatus.completed) {
              return CupertinoActivityIndicator();
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
              return CupertinoActivityIndicator();
            } else {
              return const SizedBox(
                height: 0,
              );
            }
          },
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      height: 80,
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Container(
            width: 52,
            height: 52,
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey,
            ),
          ),
          const Spacer(),
          Text(
            'me',
            style: TextStyle(
              fontSize: 12,
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
      height: 80,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
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
          const Spacer(),
          Text(
            'others',
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
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 15,
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
