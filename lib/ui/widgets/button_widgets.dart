import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socchat/core/constants/colors.dart';
import 'package:socchat/core/constants/styles.dart';

class CustomeButtom extends StatelessWidget {
  const CustomeButtom({
    super.key,
    this.onPressed,
    required this.label,
    this.loading = false,
  });
  final VoidCallback? onPressed;
  final String label;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: primary),
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                label,
                style: body.copyWith(color: white),
              ),
      ),
    );
  }
}
