import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/round_icon_button.dart';
import '../../../story/presentation/screens/create_story_screen.dart';
import '../widgets/chats_list.dart';
import '../widgets/my_profile_pic.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  static const routeName = '/chats-screen';

  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      backgroundColor: AppColors.realWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: Constants.defaultPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // build chats app bar
                _buildChatsAppBar(),

                const SizedBox(height: 20),

                // Search widget
                _buildChatsSearchWidget(),

                const SizedBox(height: 30),

                // Chats List
                const SizedBox(
                  height: 600,
                  child: ChatsList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatsAppBar() => Row(
        children: [
          const MyProfilePic(),
          const SizedBox(width: 5),
          const Text(
            'Chats',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          RoundIconButton(
            icon: FontAwesomeIcons.camera,
            onPressed: () {
              Navigator.of(context).pushNamed(CreateStoryScreen.routeName);
            },
          )
        ],
      );

  Widget _buildChatsSearchWidget() => Container(
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 15),
            Icon(Icons.search),
            SizedBox(width: 15),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      );
}
