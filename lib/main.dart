import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hardcore_writer/page1.dart';
import 'package:hardcore_writer/state/mainstate.dart';
import 'package:hardcore_writer/widgets/misc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    MainController.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(body: Observer(
        builder: (context) {
          return mainState.isLoading ? LoadingScreen() : Page1();
        },
      )),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hardcore Writer",
            style: TextStyle(fontSize: 32, color: Colors.red),
          ),
          const SizedBox(height: 64),
          LoadingAnimationWidget.beat(
            color: Colors.red,
            size: 200,
          ),
          const SizedBox(height: 64),
          const Text(
            "Loading",
            style: TextStyle(fontSize: 32, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class MainController {
  static void initState() {
    mainState.isLoading = true;
    Future.delayed(const Duration(seconds: 3), () {
      mainState.isLoading = false;
    });
  }
}
