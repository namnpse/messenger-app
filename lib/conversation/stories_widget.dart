import 'package:flutter/material.dart';

import '../constant/data.dart';
import '../theme/colors.dart';

class StoriesWidget extends StatefulWidget {
  const StoriesWidget({Key? key}) : super(key: key);

  @override
  State<StoriesWidget> createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        // color: Colors.red,
        // padding: EdgeInsets.only(left: 12),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: userStories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return index == 0
                  ? Padding(
                      padding: EdgeInsets.only(right: 20, left: 12),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: grey),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 33,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          SizedBox(
                            width: 75,
                            child: Align(
                                child: Text(
                              'Your Story',
                              overflow: TextOverflow.ellipsis,
                            )),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 75,
                            height: 75,
                            child: Stack(
                              children: <Widget>[
                                userStories[index]['story']
                                    ? Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle, border: Border.all(color: blue, width: 3)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            width: 75,
                                            height: 75,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(userStories[index]['img']), fit: BoxFit.cover)),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(userStories[index]['img']), fit: BoxFit.cover)),
                                      ),
                                userStories[index]['online']
                                    ? Positioned(
                                        top: 48,
                                        left: 52,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: online,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: white, width: 3)),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 75,
                            child: Align(
                                child: Text(
                              userStories[index]['name'],
                              overflow: TextOverflow.ellipsis,
                            )),
                          )
                        ],
                      ),
                    );
            }),
      // ),
    );
  }
}
