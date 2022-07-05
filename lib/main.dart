import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hardcore_writer/state/mainstate.dart';
import 'package:hardcore_writer/widgets/misc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: CupertinoPageScaffold(child: Observer(
        builder: (_) {
          return mainState.isLoading
              ? Center(
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
                )
              : Container();
        },
      )),
    );
  }
}
