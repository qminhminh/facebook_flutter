import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../features/chat/presentation/screens/chats_screen.dart';
import '../constants/app_colors.dart';
import '../constants/constants.dart';
import '../widgets/round_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.greyColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          title: _buildFacebookText(),
          actions: [
            _buildSearchWidget(),
            _buildMessengerWidget(),
          ],
          bottom: TabBar(
            tabs: Constants.getHomeScreenTabs(_tabController.index),
            controller: _tabController,
            onTap: (index) {
              setState(() {});
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: Constants.screens,
        ),
      ),
    );
  }

  Widget _buildFacebookText() => const Text(
        'facebook',
        style: TextStyle(
          color: AppColors.blueColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildSearchWidget() => const RoundIconButton(
        icon: FontAwesomeIcons.magnifyingGlass,
      );

  Widget _buildMessengerWidget() => InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ChatsScreen.routeName);
        },
        child: const RoundIconButton(
          icon: FontAwesomeIcons.facebookMessenger,
        ),
      );
}
