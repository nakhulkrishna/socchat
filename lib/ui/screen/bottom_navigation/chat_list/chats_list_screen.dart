import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socchat/core/constants/colors.dart';
import 'package:socchat/core/constants/strings.dart';
import 'package:socchat/core/constants/styles.dart';
import 'package:socchat/core/enums/enums.dart';
import 'package:socchat/core/models/user_model.dart';
import 'package:socchat/core/services/database_service.dart';
import 'package:socchat/ui/screen/bottom_navigation/chat_list/chat_room/chat_list_viewmodel.dart';
import 'package:socchat/ui/screen/other/user_provider.dart';
import 'package:socchat/ui/widgets/textfield_widget.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return currentUser == null
        ? CircularProgressIndicator()
        : ChangeNotifierProvider(
            create: (context) =>
                ChatListViewmodel(DatabaseService(), currentUser),
            child: Consumer<ChatListViewmodel>(builder: (context, model, _) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05),
                child: Column(
                  children: [
                    30.verticalSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Chats",
                        style: h,
                      ),
                    ),
                    20.verticalSpace,
                    CustomeTextField(
                      hint: "Search here...",
                      isSearch: true,
                      onChanged: model.search,
                    ),
                    10.verticalSpace,
                    model.state == ViewState.loading
                        ? Expanded(
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : model.users.isEmpty
                            ? Expanded(
                                child: Center(
                                  child: Text("No users yet"),
                                ),
                              )
                            : Expanded(
                                child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        8.verticalSpace,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 0),
                                    itemCount: model.filteredUsers.length,
                                    itemBuilder: (context, index) {
                                      final user = model.filteredUsers[index];
                                      return ChatTile(
                                        user: user,
                                        onTap: () {
                                          Navigator.pushNamed(context, chatroom,
                                              arguments: user);
                                        },
                                      );
                                    }),
                              )
                  ],
                ),
              );
            }),
          );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    this.onTap,
    required this.user,
  });
  final UserModel user;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: grey.withOpacity(0.12),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      leading: CircleAvatar(
        backgroundColor: grey,
        radius: 25,
        child: Text(user.name![0]),
      ),
      title: Text(user.name!),
      subtitle: Text(
        "data",
        style: TextStyle(color: grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "15 mains ago",
            style: TextStyle(color: grey),
          ),
          10.verticalSpace,
          CircleAvatar(
            backgroundColor: primary,
            radius: 9,
            child: Text(
              "1",
              style: small.copyWith(color: white),
            ),
          )
        ],
      ),
    );
  }
}
