import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socchat/core/constants/colors.dart';
import 'package:socchat/core/constants/strings.dart';
import 'package:socchat/ui/screen/bottom_navigation/ProfileScreen/profile_screen.dart';
import 'package:socchat/ui/screen/bottom_navigation/bottom_navigation_viewmodel.dart/bottom_navigation_viewmodel.dart';
import 'package:socchat/ui/screen/bottom_navigation/chat_list/chats_list_screen.dart';
import 'package:socchat/ui/screen/other/user_provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});
  static final List<Widget> screens = [
    Text("Home Screen"),
    ChatsListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationViewmodel(),
      child: Consumer<BottomNavigationViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: screens[model.currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 10)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  onTap: model.setIndex,
                  elevation: 20.0,
                  items: [
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Image.asset(
                            homeIcon,
                            height: 35,
                            width: 35,
                          ),
                        ),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Image.asset(
                            chatIcon,
                            height: 35,
                            width: 35,
                          ),
                        ),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Image.asset(
                            profileIcon,
                            height: 35,
                            width: 35,
                          ),
                        ),
                        label: ""),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
