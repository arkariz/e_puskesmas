import 'package:e_puskesmas/features/poli/presentation/controller/navigation_controller.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/home_page.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/poli_ticket_list.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBottom extends GetView<NavigationBottomController> {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pages = <Widget>[
      const HomePage(),
      const PoliTicketListPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      //extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            navBarItem(context, Icons.home, "Home", 0),
            navBarItem(context, Icons.analytics_rounded, "Riwayat", 1),
            navBarItem(context, Icons.person, "Profile", 2),
          ],
        ),
      ),
    );
  }

  Widget navBarItem(BuildContext context, IconData icon, String text, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.changePage(index);
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        height: 60,
        width: MediaQuery.of(context).size.width / 4 - 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Obx(
                    () => Icon(
                      icon,
                      color: (index == controller.currentIndex.value) ? Colors.white : Colors.white12,
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    text,
                    style: TextStyle(
                      fontSize: 12,
                      color: (index == controller.currentIndex.value) ? Colors.white : Colors.white12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
