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
import 'package:socchat/core/services/database_service.dart';
import 'package:socchat/ui/screen/auth/signup/signup_viewmodel.dart';
import 'package:socchat/ui/widgets/button_widgets.dart';
import 'package:socchat/ui/widgets/textfield_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupViewmodel(AuthService(), DatabaseService()),
      child: Consumer<SignupViewmodel>(builder: (context, model, child) {
        return Scaffold(
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                40.verticalSpace,
                Text(
                  "Create your account",
                  style: h,
                ),
                5.verticalSpace,
                Text("Please Provide The Details"),
                30.verticalSpace,
                CustomeTextField(
                  onChanged: model.setName,
                  hint: "Enter Name",
                ),
                20.verticalSpace,
                CustomeTextField(
                  onChanged: model.setEmail,
                  hint: "Enter Email",
                ),
                20.verticalSpace,
                CustomeTextField(
                  isPassword: true,
                  onChanged: model.setPassword,
                  hint: "Enter Password",
                ),
                20.verticalSpace,
                CustomeTextField(
                  isPassword: true,
                  onChanged: model.setConfirmPassword,
                  hint: "Confirm Password",
                ),
                30.verticalSpace,
                CustomeButtom(
                  loading: model.state == ViewState.loading,
                  onPressed: model.state == ViewState.loading
                      ? null
                      : () async {
                          try {
                            await model.signup();
                            Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            context.showSnackBar(e.toString());
                          } catch (e) {
                            context.showSnackBar(e.toString());
                          }
                        },
                  label: 'Sign up',
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Alredy have an account?",
                      style: body.copyWith(color: grey),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, login);
                        },
                        child: Text("Login",
                            style: body.copyWith(fontWeight: FontWeight.bold)))
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
