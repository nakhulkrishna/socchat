import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socchat/core/services/auth_service.dart';
import 'package:socchat/ui/screen/other/user_provider.dart';
import 'package:socchat/ui/widgets/button_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05),
        child: Column(
          children: [
            50.verticalSpace,
            CustomeButtom(
              label: "logOut",
              onPressed: () {
                AuthService().logout();
                Provider.of<UserProvider>(context).clearUser();
              },
            )
          ],
        ),
      ),
    );
  }
}
