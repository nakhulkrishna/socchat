import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socchat/ui/screen/auth/login/login_screen.dart';
import 'package:socchat/ui/screen/bottom_navigation/bottom_navigation_screen.dart';

import '../other/user_provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;

        if (user == null) {
          return const LoginScreen();
        } else {
          userProvider.loadUser(user.uid);
          return BottomNavigationScreen();
        }
      },
    );
  }
}
