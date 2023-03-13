import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_messenger/settings/settings_page.dart';
import 'package:get/get.dart';
import './home_controller.dart';
import '../common/lazy_index_stack.dart';
import '../conversation/conversation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Obx(() => _buildTabViews()),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.bottomIndex.value,
          elevation: 1,
          onTap: controller.setBottomIndex,
          selectedItemColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_fill),
              label: 'Chats',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(CupertinoIcons.person_2_alt),
            //   label: 'People',
            // ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabViews() {
    List<Widget> tabs = [];
    tabs.add(ConversationPage());
    // tabs.add(SettingsScreen());
    tabs.add(SettingsScreen());
    return LazyIndexedStack(
      index: controller.bottomIndex.value,
      children: tabs,
    );
  }
}
