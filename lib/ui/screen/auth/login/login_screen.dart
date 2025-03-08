import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socchat/core/constants/colors.dart';
import 'package:socchat/core/constants/strings.dart';
import 'package:socchat/core/constants/styles.dart';
import 'package:socchat/core/enums/enums.dart';
import 'package:socchat/core/extensions/widgets_extenstions.dart';
import 'package:socchat/core/services/auth_service.dart';
import 'package:socchat/ui/screen/auth/login/login_viewmode.dart';
import 'package:socchat/ui/widgets/button_widgets.dart';
import 'package:socchat/ui/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewmode(AuthService()),
      child: Consumer<LoginViewmode>(
        builder: (context, model, _) {
          return Scaffold(
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  40.verticalSpace,
                  Text(
                    "Login",
                    style: h,
                  ),
                  5.verticalSpace,
                  Text("Please Login To Your Account"),
                  30.verticalSpace,
                  CustomeTextField(
                    onChanged: model.setEmail,
                    hint: "Enter Email",
                  ),
                  20.verticalSpace,
                  CustomeTextField(
                    onChanged: model.setPassword,
                    hint: "Enter Password",
                  ),
                  30.verticalSpace,
                  CustomeButtom(
                    loading: model.state == ViewState.loading,
                    onPressed: model.state == ViewState.loading
                        ? null
                        : () async {
                            try {
                              await model.login();
                              Navigator.pushNamed(context, home);
                            } on FirebaseAuthException catch (e) {
                              context.showSnackBar(e.toString());
                            } catch (e) {
                              context.showSnackBar(e.toString());
                            }
                          },
                    label: 'Login',
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: body.copyWith(color: grey),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, signup);
                          },
                          child: Text("Sign Up",
                              style:
                                  body.copyWith(fontWeight: FontWeight.bold)))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
