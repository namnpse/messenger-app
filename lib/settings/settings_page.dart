
import 'package:flutter/material.dart';
import 'package:flutter_messenger/theme/styles.dart';
import 'package:provider/provider.dart';
import '../theme/dark_theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
      child: Container(
        color: Styles.themeData(!themeChange.darkTheme, context).primaryColor,
        child: Column(
          children: [
            SwitchListTile(
              value: themeChange.darkTheme,
              activeColor: Colors.blue,
              // leading: Icon(Ionicons.md_moon),
              onChanged: (value) {
                // setState(() {
                //
                // });
                themeChange.darkTheme = value;
              },
              visualDensity: VisualDensity.comfortable,
              // switchType: SwitchType.cupertino,
              // switchActiveColor: Colors.indigo,
              title: Text('Dark theme', style: TextStyle(color: Theme.of(context).primaryColor),),
            ),
          ],
        ),
      ),
    );
  }
}
