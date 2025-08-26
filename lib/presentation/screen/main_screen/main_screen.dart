import 'package:flutter/material.dart';
import 'package:layer_complain/presentation/screen/complains/complains_screen.dart';
import 'package:layer_complain/presentation/screen/message/message_screen.dart';
import 'package:layer_complain/utils/constraints.dart';

import '../add_complains/add_complains_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import 'component/main_controller.dart';
import 'component/my_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  final bool showBack;

  const MainScreen({super.key, this.showBack = false});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainController _controller = MainController();

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      ComplainsScreen(showBack: widget.showBack),
      AddComplainsScreen(showBack: widget.showBack),
      MessageScreen(showBack: widget.showBack),
      const ProfileScreen(),
    ];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: StreamBuilder<int>(
        initialData: 0,
        stream: _controller.naveListener.stream,
        builder: (context, snapshot) {
          final currentIndex = snapshot.data ?? 0;
          return FloatingActionButton(
            elevation: 2,
            onPressed: () => _controller.changeNav(2),
            backgroundColor: currentIndex == 2 ? primaryColor : whiteColor,
            shape: const CircleBorder(),
            child: Icon(
              Icons.add,
              size: 30,
              color: currentIndex == 2 ? whiteColor : primaryColor,
            ),
          );
        },
      ),
      body: StreamBuilder<int>(
        initialData: 0,
        stream: _controller.naveListener.stream,
        builder: (context, AsyncSnapshot<int> snapshot) {
          int item = snapshot.data ?? 0;
          return _screens[item];
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(controller: _controller),
    );
  }
}
