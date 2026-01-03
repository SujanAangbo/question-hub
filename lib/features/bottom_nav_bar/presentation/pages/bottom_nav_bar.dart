import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/utils/ui/app_horizontal_divider.dart';

@RoutePage()
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(DemoUi());
        },
      ),
      routes: [HomeRoute(), BookmarkRoute(), SettingsRoute()],
      bottomNavigationBuilder: (context, router) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppHorizontalDivider(color: Colors.grey),
          BottomNavigationBar(
            currentIndex: router.activeIndex,

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: "Library",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
            unselectedFontSize: 14,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,

            onTap: (index) {
              router.setActiveIndex(index);
            },
          ),
        ],
      ),
    );
  }
}
