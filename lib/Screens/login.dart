import 'package:flutter/material.dart';

import '../colors.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradient1,gradient2],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            )
          ),
        ),
      )
    );
  }
}
