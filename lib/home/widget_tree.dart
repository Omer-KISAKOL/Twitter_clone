import 'package:flutter/material.dart';

import '../services/auth.dart';
import 'login.dart';
import 'signup.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ServiceAuth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SignUp();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
