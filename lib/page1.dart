//! remove
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/widgets.dart';
import 'package:hardcore_writer/state/mainstate.dart';
import 'package:hardcore_writer/widgets/hw_textfield/hw_textfield.dart';
import 'package:hardcore_writer/widgets/misc.dart';
import 'package:hardcore_writer/widgets/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return PageLayout(
          header: Header(),
          body: Body(),
          footer: Foot(),
        );
      },
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "HEADER",
              style: TextStyle(fontSize: 32, color: Colors.red),
            ),
          ],
        );
      },
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          child: HwTextfield(state: mainState.textfieldState),
        );
      },
    );
  }
}

class Foot extends StatefulWidget {
  const Foot({Key? key}) : super(key: key);

  @override
  State<Foot> createState() => _FootState();
}

class _FootState extends State<Foot> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container();
      },
    );
  }
}
