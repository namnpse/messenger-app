import 'package:flutter/material.dart';
import 'package:flutter_messenger/theme/styles.dart';
import 'package:provider/provider.dart';
import 'home/home_page.dart';
import 'theme/dark_theme_provider.dart';

void main() {
  runApp(MessgenerApp());
}

class MessgenerApp extends StatefulWidget {
  const MessgenerApp({Key? key}) : super(key: key);

  @override
  State<MessgenerApp> createState() => _MessgenerAppState();
}

class _MessgenerAppState extends State<MessgenerApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // home: ConversationPage(),
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: HomePage(),
            );
          },
        ),);
  }
}

