import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socchat/core/models/message_model.dart';

import 'package:socchat/core/models/user_model.dart';
import 'package:socchat/core/other/base_view_model.dart';
import 'package:socchat/core/services/chat_services.dart';

class ChatRoomViewmodel extends BaseViewModel {
  final ChatServices _chatServices;
  final UserModel _currentUser;
  final UserModel _receiver;
  StreamSubscription? _subscription;
  ChatRoomViewmodel(this._chatServices, this._currentUser, this._receiver) {
    getChatRoom();
    _subscription = _chatServices.getMessags(chatRoomId).listen((message) {
      _messages = message.docs.map((e) => Message.fromMap(e.data())).toList();
      notifyListeners();
    });
  }
  String chatRoomId = "";

  final _messageController = TextEditingController();

  TextEditingController get controller => _messageController;

  List<Message> _messages = [];
  List<Message> get message => _messages;
  getChatRoom() {
    if (_currentUser.uid.hashCode > _receiver.uid.hashCode) {
      chatRoomId = "${_currentUser.uid}_${_receiver.uid}";
    } else {
      chatRoomId = "${_receiver.uid}_${_currentUser.uid}";
    }
  }

  saveMessage() async {
    log("send message");
    try {
      if (_messageController.text.isEmpty) {
        throw Exception("please enter some text");
      }

      final now = DateTime.now();
      final message = Message(
          timestamp: now,
          id: now.microsecondsSinceEpoch.toString(),
          content: _messageController.text,
          senderId: _currentUser.uid,
          receiverId: _receiver.uid);
      await _chatServices.saveMessage(message.toMap(), chatRoomId);
      _messageController.clear();
    } catch (e) {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _subscription?.cancel();
  }
}
