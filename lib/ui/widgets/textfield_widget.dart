import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socchat/core/constants/colors.dart';
import 'package:socchat/core/constants/strings.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    this.onChanged,
    required this.hint,
    this.focusNode,
    this.isSearch = false,
    this.isChatText = false,
    this.controller,
    this.onTap,
    this.isPassword = false,
  });
  final void Function(String)? onChanged;
  final String? hint;
  final FocusNode? focusNode;
  final bool isSearch;

  final bool isChatText;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isChatText ? 35.h : null,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        focusNode: focusNode,
        obscureText: isPassword,
        decoration: InputDecoration(
            contentPadding:
                isChatText ? EdgeInsets.only(bottom: 5.h, left: 12.w) : null,
            hintText: hint,
            suffixIcon: isSearch
                ? Container(
                    height: 55,
                    width: 55,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset(searchIcon),
                  )
                : isChatText
                    ? InkWell(onTap: onTap, child: Icon(Icons.send))
                    : null,
            filled: true,
            fillColor: isChatText ? white : grey.withOpacity(0.12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(isChatText ? 25.r : 10.r),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
