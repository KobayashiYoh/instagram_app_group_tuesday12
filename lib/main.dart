import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* ---------- この行より上には触らない！ ------------------------------------ */

// 自分のID（日本語でもOK）
var id = 'user_id';

// 投稿する文章（\nで改行）
var toukoubun = '投稿文';

// 投稿する画像のアドレス（URL）
var adoresu = '';

/* ---------- この行より下には触らない！ ------------------------------------- */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Instagram App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  var aikonUrl =
      'https://pics.prcm.jp/d72814fa00d0d/84842254/jpeg/84842254_480x460.jpeg';
  final iineId = 'iine_oshita_user';
  final hiduke = '${DateTime.now().month}月${DateTime.now().day}日';

  Widget userIcon({required String url, double radius = 16.0}) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(url),
      onBackgroundImageError: (Object object, StackTrace? stackTrace) =>
          Container(color: Colors.red),
    );
  }

  PreferredSizeWidget? instagramAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1.0,
      title: SizedBox(
        height: kToolbarHeight,
        width: 152.0,
        child: Row(
          children: [
            Expanded(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1200px-Instagram_logo.svg.png',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 4.0),
              child: const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 18.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      actions: const [
        Icon(Icons.add_box_outlined),
        SizedBox(width: 16.0),
        Icon(Icons.favorite_border),
        SizedBox(width: 16.0),
        Icon(CupertinoIcons.chat_bubble_text),
        SizedBox(width: 16.0),
      ],
    );
  }

  Widget itemHeader() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              userIcon(url: aikonUrl),
              const SizedBox(width: 8.0),
              Text(
                id,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const Icon(Icons.keyboard_control),
        ],
      ),
    );
  }

  Widget buttonMenuBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.favorite_border),
              SizedBox(width: 8.0),
              Icon(CupertinoIcons.chat_bubble),
              SizedBox(width: 8.0),
              Icon(Icons.send_outlined),
            ],
          ),
          const Icon(Icons.bookmark_border),
        ],
      ),
    );
  }

  Widget postedItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        itemHeader(),
        Image.network(
          adoresu,
          errorBuilder: (c, o, e) => Container(
            color: Colors.red,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buttonMenuBar(),
              Text('いいね！：$iineId、他'),
              Text(
                toukoubun,
                style: const TextStyle(color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        userIcon(
                          url: aikonUrl,
                          radius: 12.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: const Text('コメントを追加…'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 72.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('❤'),
                          Text('🙌'),
                          Text('⊕'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                hiduke,
                style: const TextStyle(fontSize: 13.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget instagramTabBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 28.0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.ondemand_video_outlined),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: userIcon(url: aikonUrl, radius: 12.0),
          label: '',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: instagramAppBar(),
      body: ListView(
        children: [
          postedItem(),
        ],
      ),
      bottomNavigationBar: instagramTabBar(),
    );
  }
}

class PostedItem {
  String userId;
  String iconImageUrl;
  String postedImage;
  String pressedLikeButtonUserId;
  String text;
  int month;
  int day;

  PostedItem({
    required this.userId,
    required this.iconImageUrl,
    required this.postedImage,
    required this.pressedLikeButtonUserId,
    required this.text,
    required this.month,
    required this.day,
  });
}
