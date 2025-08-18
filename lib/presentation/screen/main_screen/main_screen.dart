import 'package:flutter/material.dart';
import 'package:layer_complain/presentation/screen/complains/complains_screen.dart';
import 'package:layer_complain/presentation/screen/message/message_screen.dart';
import 'package:layer_complain/utils/constraints.dart';

import '../../../utils/k_images.dart';
import '../../../widgets/custom_image.dart';
import '../add_complains/add_complains_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import 'component/main_controller.dart';
import 'component/my_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainController _controller = MainController();

  final List<Widget> _screens = const [
    HomeScreen(),
    ComplainsScreen(),
    AddComplainsScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

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
