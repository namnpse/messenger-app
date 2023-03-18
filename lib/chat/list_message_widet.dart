import 'package:flutter/material.dart';
import 'package:flutter_messenger/chat/message_item_widget.dart';

import '../constant/data.dart';

class ListMessagesWidget extends StatefulWidget {
  const ListMessagesWidget({Key? key}) : super(key: key);

  @override
  State<ListMessagesWidget> createState() => _ListMessagesWidgetState();
}

class _ListMessagesWidgetState extends State<ListMessagesWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0)).then((value) {
      _scrollController.animateTo(
        // 0.0,
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 80),
      itemCount: messages.length,
      // reverse: true,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return MessageItemWidget(
            key: Key(index.toString()),
            isDifference: index == 0 ? true : messages[index]['isMe'] != messages[index-1]['isMe'],
            isMine: messages[index]['isMe'],
            messageType: messages[index]['messageType'],
            message: messages[index]['message'],
            profileImg: messages[index]['profileImg']);
      },
    );
  }
}
