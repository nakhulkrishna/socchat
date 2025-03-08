import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:socchat/core/constants/colors.dart';
import 'package:socchat/core/constants/styles.dart';
import 'package:socchat/core/models/message_model.dart';
import 'package:socchat/ui/widgets/textfield_widget.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isCurrentUser = true,
    required this.message,
  });
  final bool isCurrentUser;
  final Message message;
  @override
  Widget build(BuildContext context) {
    final borderRadius = isCurrentUser
        ? BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r))
        : BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r));
    final alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(maxWidth: 1.sw * 0.75, minWidth: 50.w),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: isCurrentUser ? primary : grey.withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              message.content!,
              style: body.copyWith(color: isCurrentUser ? white : null),
            ),
            5.verticalSpace,
            Text(
              DateFormat('hh:mm:a').format(message.timestamp!),
              style: small.copyWith(color: isCurrentUser ? white : null),
            )
          ],
        ),
      ),
    );
  }
}

class BottomFiled extends StatelessWidget {
  const BottomFiled({
    super.key,
    this.onTap,
    this.onChanged,
    this.controller,
  });

  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 20.h),
      child: Row(
        children: [
          InkWell(
            onTap: null,
            child: CircleAvatar(
              backgroundColor: white,
              child: Icon(
                Icons.add,
              ),
            ),
          ),
          10.horizontalSpace,
          Expanded(
              child: CustomeTextField(
            onTap: onTap,
            controller: controller,
            hint: "Type...",
            isChatText: true,
            onChanged: onChanged,
          )),
        ],
      ),
    );
  }
}
