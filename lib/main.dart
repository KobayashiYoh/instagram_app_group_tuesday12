import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  final String loginUserIconUrl =
      'https://pics.prcm.jp/d72814fa00d0d/84842254/jpeg/84842254_480x460.jpeg';
  final String loginUserId = 'user_id';
  final String postedImageUrl =
      'https://cdn.pixabay.com/photo/2022/05/10/11/12/tree-7186835_960_720.jpg';
  final String pressedLikeButtonUserId = 'user';
  final String postedText = '''
    投稿文
  ''';

  Widget userIcon({required String url, double radius = 20.0}) {
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
      title: Row(
        children: [
          const Text(
            'Instagram',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.chevron_down,
              size: 16.0,
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_box_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.chat_bubble_text),
        ),
      ],
    );
  }

  Widget postedItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  userIcon(url: loginUserIconUrl),
                  const SizedBox(width: 8.0),
                  Text(
                    loginUserId,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_control),
              ),
            ],
          ),
        ),
        Image.network(postedImageUrl),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.chat_bubble),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_outlined),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
              ),
            ],
          ),
        ),
        Text('いいね！：$pressedLikeButtonUserId、他'),
        Text(
          postedText,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget instagramTabBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black87,
      unselectedItemColor: Colors.black45,
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
          icon: userIcon(url: loginUserIconUrl, radius: 16.0),
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
          postedItem(),
          postedItem(),
          postedItem(),
          postedItem(),
          postedItem(),
          postedItem(),
          postedItem(),
          postedItem(),
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

  PostedItem({
    required this.userId,
    required this.iconImageUrl,
    required this.postedImage,
    required this.pressedLikeButtonUserId,
    required this.text,
  });
}
