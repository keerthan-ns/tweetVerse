import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweetverse/common/common.dart';
import 'package:tweetverse/features/explore/controller/explore_controller.dart';
import 'package:tweetverse/features/explore/widgets/search_tile.dart';
import 'package:tweetverse/theme/theme.dart';

class ExploreView extends ConsumerStatefulWidget {
  const ExploreView({super.key});

  @override
  ConsumerState<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {
  final searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarTextFieldBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Pallete.greyColor));
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            controller: searchController,
            onSubmitted: (value) {
              setState(() {
                isShowUsers = true;
              });
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10).copyWith(
                  left: 20,
                ),
                fillColor: Pallete.searchBarColor,
                filled: true,
                enabledBorder: appBarTextFieldBorder,
                focusedBorder: appBarTextFieldBorder,
                hintText: 'Search TweetVerse'),
          ),
        ),
      ),
      body: isShowUsers
          ? ref.watch(searchUserProvider(searchController.text)).when(
                data: (users) {
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = users[index];
                      return SearchTile(userModel: user);
                    },
                  );
                },
                error: (error, st) => ErrorText(error: error.toString()),
                loading: () => const Loader(),
              )
          : const SizedBox(),
    );
  }
}
