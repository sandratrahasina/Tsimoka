import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MainFrame()
      )
    );
  }
}

//back-ground
//---------------------------------------------------------------------------------------
class MainFrame extends StatelessWidget {
  const MainFrame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('notification');
  }
}