import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tweetverse/constants/constants.dart';
import 'package:tweetverse/features/tweet/views/create_tweet_view.dart';
import 'package:tweetverse/theme/pallete.dart';
import 'package:flutter/cupertino.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;
  final appBar = UIConstants.appBar();

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  onCreateTweet() {
    Navigator.push(context, CreateTweetScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _page == 0 ? appBar:null,
      body: IndexedStack(
        index: _page,
        children: UIConstants.bottomTabBarPages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onCreateTweet,
        child: const Icon(
          Icons.add,
          color: Pallete.whiteColor,
          size: 28,
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _page,
        onTap: onPageChange,
        backgroundColor: Pallete.backgroundColor,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            _page == 0
                ? AssetsConstants.homeFilledIcon
                : AssetsConstants.homeOutlinedIcon,
            color: Pallete.whiteColor,
          )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            AssetsConstants.searchIcon,
            color: Pallete.whiteColor,
          )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            _page == 2
                ? AssetsConstants.notifFilledIcon
                : AssetsConstants.notifOutlinedIcon,
            color: Pallete.whiteColor,
          )),
        ],
      ),
    );
  }
}
