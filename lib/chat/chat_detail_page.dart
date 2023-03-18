
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_messenger/chat/list_message_widet.dart';

import '../theme/colors.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _sendMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: _buildTitleAppBar(),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor
            ),
        ),
        actions: <Widget>[
          const Icon(
            Icons.phone,
            color: primary,
            size: 32,
          ),
          const SizedBox(
            width: 12,
          ),
          const Icon(
            CupertinoIcons.videocam_fill,
            color: primary,
            size: 40,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                color: online,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white38)),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      body: const ListMessagesWidget(),
      bottomSheet: _buildBottomSheet(),
    );
  }

  _buildTitleAppBar() {
    return Row(
      children: <Widget>[
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Tyler Nix",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Active now",
              style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.4), fontSize: 14),
            )
          ],
        )
      ],
    );
  }

  _buildBottomSheet() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: grey.withOpacity(0.15)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: const [
                Icon(Icons.add_circle,size: 35,color: primary,),
                SizedBox(width: 4,),
                Icon(Icons.camera_alt,size: 35,color: primary,),
                // Icon(Icons.photo,size: 35,color: primary,),
                // SizedBox(width: 4,),
                // Icon(Icons.keyboard_voice,size: 35,color: primary,),
              ],
            ),
            const SizedBox(width: 8,),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      // width: (MediaQuery.of(context).size.width-140)/2,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).disabledColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextField(
                          cursorColor: Theme.of(context).primaryColor,
                          controller: _sendMessageController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Aa",
                              suffixIcon: Icon(Icons.face,color: primary,size: 35,)
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  const Icon(Icons.thumb_up,size: 32,color: primary,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
