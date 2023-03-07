import 'package:flutter/material.dart';
import './conversation_header_widget.dart';
import '../theme/colors.dart';
import 'stories_widget.dart';
import 'converstions_widget.dart';
// import 'package:line_icons/line_icons.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPage createState() => _ConversationPage();
}

class _ConversationPage extends State<ConversationPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              // elevation: 0,
              backgroundColor: Colors.white,
              pinned: true,
              // expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: ConversationHeaderWidget(),
              ),
            ),
            //  add another sliver app bar
            // const SliverAppBar(
            //   // pinned: true,
            //   // expandedHeight: 250.0,
            //   // title: Text('data'),
            //   // title: Text('data'),
            //   flexibleSpace: FlexibleSpaceBar(
            //     title: ConversationHeaderWidget(),
            //   ),
            // ),
            // SliverGrid(
            //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200.0,
            //     mainAxisSpacing: 10.0,
            //     crossAxisSpacing: 10.0,
            //     childAspectRatio: 4.0,
            //   ),
            //   delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //       return Container(
            //         alignment: Alignment.center,
            //         color: Colors.teal[100 * (index % 9)],
            //         child: Text('Grid Item $index'),
            //       );
            //     },
            //     childCount: 20,
            //   ),
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return index == 0 ?
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      cursorColor: black,
                      controller: _searchController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: black.withOpacity(0.5),
                          ),
                          hintText: "Search",
                          border: InputBorder.none),
                    ),
                  )
                      : StoriesWidget();
                },
                childCount: 2,
              ),
            ),
            ConversationsWidget(),
          ],
        ),
      // ),
    );
  }
}
