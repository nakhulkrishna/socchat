import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socchat/core/constants/colors.dart';
import 'package:socchat/core/constants/styles.dart';
import 'package:socchat/core/extensions/widgets_extenstions.dart';
import 'package:socchat/core/models/user_model.dart';
import 'package:socchat/core/services/chat_services.dart';
import 'package:socchat/ui/screen/bottom_navigation/chat_list/chat_room/chat_room_viewmodel.dart';
import 'package:socchat/ui/screen/bottom_navigation/chat_list/chat_room/chat_widgets.dart';
import 'package:socchat/ui/screen/other/user_provider.dart';

class ChatRommScreen extends StatelessWidget {
  const ChatRommScreen({super.key, required this.receiver});

  final UserModel receiver;

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return ChangeNotifierProvider(
      create: (context) =>
          ChatRoomViewmodel(ChatServices(), currentUser!, receiver),
      child: Consumer<ChatRoomViewmodel>(builder: (context, model, _) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 1.sw * 0.05, vertical: 25.h),
                  child: Column(
                    children: [
                      30.verticalSpace,
                      _buildHeader(context, name: receiver.name!),
                      20.verticalSpace,
                      Expanded(
                        child: ListView.separated(
                            padding: EdgeInsets.all(0),
                            itemCount: model.message.length,
                            separatorBuilder: (context, index) =>
                                10.verticalSpace,
                            itemBuilder: (context, index) {
                              final message = model.message[index];
                              return ChatBubble(
                                message: message,
                                isCurrentUser:
                                    message.senderId == currentUser!.uid,
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              BottomFiled(
                controller: model.controller,
                onChanged: (p0) {},
                onTap: () async {
                  try {
                    await model.saveMessage();
                  } catch (e) {
                    context.showSnackBar(e.toString());
                  }
                },
              )
            ],
          ),
        );
      }),
    );
  }

  Row _buildHeader(BuildContext context, {String name = ""}) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: grey.withOpacity(0.15)),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        20.horizontalSpace,
        Text(
          name,
          style: h.copyWith(fontSize: 20.sp),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: grey.withOpacity(0.15)),
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
