
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';

class MessageItemWidget extends StatelessWidget {
  final bool isMine;
  final String profileImg;
  final String message;
  final int messageType;
  final bool isDifference;
  MessageItemWidget({
    required Key key,
    required this.isMine,
    required this.profileImg,
    required this.message,
    required this.messageType,
    required this.isDifference,
  }) : super(key: key);
  RxBool isShowingDate = RxBool(false);

  @override
  Widget build(BuildContext context) {
    if(isMine){
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Obx(
                  ()=> AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isShowingDate.isTrue ? Padding(
                    padding:  isDifference ? const EdgeInsets.only(top: 8.0): const EdgeInsets.all(8.0),
                    child: Text('12:28 12/02/2022'),
                  ) : SizedBox.shrink()
              ),
            ),
            SizedBox(
              height: isDifference ? 8: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      isShowingDate.value = !isShowingDate.value;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: getMessageType(messageType)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          message,
                          style: TextStyle(
                              color: white,
                              fontSize: 17
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }else{
      return Padding(
        padding:  EdgeInsets.all(1.0),
        child: Column(
          children: [
            Obx(
                  ()=> AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isShowingDate.isTrue ? Padding(
                    padding:  isDifference ? const EdgeInsets.only(top: 8.0): const EdgeInsets.all(8.0),
                    child: Text('12:28 12/02/2022'),
                  ) : SizedBox.shrink()
              ),
            ),
            SizedBox(
              height: isDifference ? 8: 0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: showAvatar() ? BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              profileImg),
                          fit: BoxFit.cover)) : null,
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      isShowingDate.value = !isShowingDate.value;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: grey,
                          borderRadius: getMessageType(messageType)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          message,
                          style: TextStyle(
                              color: black,
                              fontSize: 17
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 4,),
              ],
            ),
          ],
        ),
      );
    }
  }

  bool showDateTime(messageType) {
    return (messageType == 1 || messageType == 4);
  }

  bool showAvatar() {
    return (messageType == 3 || messageType == 4);
  }

  getMessageType(messageType){
    if(isMine){
      // start message
      if(messageType == 1){
        return BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30)
        );
      }
      // middle message
      else if(messageType == 2){
        return BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30)
        );
      }
      // end message
      else if(messageType == 3){
        return BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30)
        );
      }
      // standalone message
      else{
        return BorderRadius.all(Radius.circular(30));
      }
    }
    // for sender bubble
    else{
      // start message
      if(messageType == 1){
        return BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)
        );
      }
      // middle message
      else if(messageType == 2){
        return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)
        );
      }
      // end message
      else if(messageType == 3){
        return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)
        );
      }
      // standalone message
      else{
        return BorderRadius.all(Radius.circular(30));
      }
    }


  }
}
