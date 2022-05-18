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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: CircleAvatar(
              radius: 16.0,
              backgroundImage: NetworkImage(loginUserIconUrl),
              onBackgroundImageError: (Object object, StackTrace? stackTrace) =>
                  Container(color: Colors.red),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
