//! remove
// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/widgets.dart';
import 'package:hardcore_writer/state/mainstate.dart';
import 'package:hardcore_writer/widgets/hw_textfield/hw_textfield.dart';
import 'package:hardcore_writer/widgets/misc.dart';
import 'package:hardcore_writer/widgets/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    PageController.initState();
    super.initState();
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                DeathTimer(),
                IgnorePointer(
                  ignoring: mainState.sessionRunning ? true : false,
                  child: Slider(
                    min: 10,
                    max: 20,
                    inactiveColor: Colors.grey.withOpacity(0.33),
                    activeColor: Colors.red,
                    divisions: 4,
                    value: mainState.deathCountdownDuration.toDouble(),
                    onChanged: (double value) {
                      mainState.deathCountdownDuration = value.toInt();
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SessionTimer(),
                IgnorePointer(
                  ignoring: mainState.sessionRunning ? true : false,
                  child: Slider(
                    min: 60,
                    max: 600,
                    inactiveColor: Colors.grey.withOpacity(0.33),
                    activeColor: Colors.red,
                    divisions: 9,
                    value: mainState.sessionCountdownDuration.toDouble(),
                    onChanged: (double value) {
                      mainState.sessionCountdownDuration = value.toInt();
                    },
                  ),
                ),
              ],
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
          color: Colors.grey.withOpacity(0.1),
          padding: EdgeInsets.all(8),
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            padding: EdgeInsets.all(8),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              padding: EdgeInsets.all(8),
              child: HwTextfield(
                state: mainState.textfieldState,
                onChanged: mainState.deathCountdownController.restart,
                expands: true,
                topAlign: true,
                // onChanged: mainState.deathCountdownController.restart,
              ),
            ),
          ),
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
        return Column(
          children: [
            Text(
              "Debug:",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      PageController.startSession();
                    },
                    child: Text("Start")),
                ElevatedButton(
                    onPressed: () {
                      mainState.deathCountdownController.pause();
                      mainState.sessionCountdownController.pause();
                    },
                    child: Text("Pause")),
                ElevatedButton(
                    onPressed: () {
                      mainState.deathCountdownController.resume();
                      mainState.sessionCountdownController.resume();
                    },
                    child: Text("Resume")),
                ElevatedButton(
                    onPressed: () {
                      PageController.reset();
                    },
                    child: Text("Restart")),
              ],
            ),
          ],
        );
      },
    );
  }
}

class DeathTimer extends StatefulWidget {
  const DeathTimer({Key? key}) : super(key: key);

  @override
  State<DeathTimer> createState() => _DeathTimerState();
}

class _DeathTimerState extends State<DeathTimer> {
  @override
  void initState() {
    super.initState();
    mainState.deathCountdownController = CountDownController();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.all(16),
        child: CircularCountDownTimer(
          // Countdown duration in Seconds.
          duration: mainState.deathCountdownDuration,

          // Countdown initial elapsed Duration in Seconds.
          initialDuration: 0,

          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
          controller: mainState.deathCountdownController,

          // Width of the Countdown Widget.
          width: 48,

          // Height of the Countdown Widget.
          height: 48,

          // Ring Color for Countdown Widget.
          ringColor: Colors.black,

          // Ring Gradient for Countdown Widget.
          ringGradient: null,

          // Filling Color for Countdown Widget.
          fillColor: Colors.red,

          // Filling Gradient for Countdown Widget.
          fillGradient: null,

          // Background Color for Countdown Widget.
          backgroundColor: Colors.black,

          // Background Gradient for Countdown Widget.
          backgroundGradient: null,

          // Border Thickness of the Countdown Ring.
          strokeWidth: 4.0,

          // Begin and end contours with a flat edge and no extension.
          strokeCap: StrokeCap.round,

          // Text Style for Countdown Text.
          textStyle: const TextStyle(
            fontSize: 12.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),

          // Format for the Countdown Text.
          textFormat: CountdownTextFormat.S,

          // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
          isReverse: true,

          // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
          isReverseAnimation: false,

          // Handles visibility of the Countdown Text.
          isTimerTextShown: true,

          // Handles the timer start.
          autoStart: false,

          // This Callback will execute when the Countdown Starts.
          onStart: () {
            // Here, do whatever you want
            debugPrint('Countdown Started');
          },

          // This Callback will execute when the Countdown Ends.
          onComplete: () {
            // Here, do whatever you want
            debugPrint('Countdown Ended');
            PageController.killScreen();
          },

          // This Callback will execute when the Countdown Changes.
          onChange: (String timeStamp) {
            // Here, do whatever you want
            // debugPrint('Countdown Changed $timeStamp');
          },
        ),
      );
    });
  }
}

class SessionTimer extends StatefulWidget {
  const SessionTimer({Key? key}) : super(key: key);

  @override
  State<SessionTimer> createState() => _SessionTimerState();
}

class _SessionTimerState extends State<SessionTimer> {
  @override
  void initState() {
    super.initState();
    mainState.sessionCountdownController = CountDownController();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.all(16),
        child: CircularCountDownTimer(
          // Countdown duration in Seconds.
          duration: mainState.sessionCountdownDuration,

          // Countdown initial elapsed Duration in Seconds.
          initialDuration: 0,

          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
          controller: mainState.sessionCountdownController,

          // Width of the Countdown Widget.
          width: 48,

          // Height of the Countdown Widget.
          height: 48,

          // Ring Color for Countdown Widget.
          ringColor: Colors.black,

          // Ring Gradient for Countdown Widget.
          ringGradient: null,

          // Filling Color for Countdown Widget.
          fillColor: Colors.red,

          // Filling Gradient for Countdown Widget.
          fillGradient: null,

          // Background Color for Countdown Widget.
          backgroundColor: Colors.black,

          // Background Gradient for Countdown Widget.
          backgroundGradient: null,

          // Border Thickness of the Countdown Ring.
          strokeWidth: 4.0,

          // Begin and end contours with a flat edge and no extension.
          strokeCap: StrokeCap.round,

          // Text Style for Countdown Text.
          textStyle: const TextStyle(
            fontSize: 12.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),

          // Format for the Countdown Text.
          textFormat: CountdownTextFormat.MM_SS,

          // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
          isReverse: true,

          // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
          isReverseAnimation: false,

          // Handles visibility of the Countdown Text.
          isTimerTextShown: true,

          // Handles the timer start.
          autoStart: false,

          // This Callback will execute when the Countdown Starts.
          onStart: () {
            // Here, do whatever you want
            debugPrint('Countdown Started');
          },

          // This Callback will execute when the Countdown Ends.
          onComplete: () {
            // Here, do whatever you want
            debugPrint('Countdown Ended');
          },

          // This Callback will execute when the Countdown Changes.
          onChange: (String timeStamp) {
            // Here, do whatever you want
            // debugPrint('Countdown Changed $timeStamp');
          },
        ),
      );
    });
  }
}

class PageController {
  static void initState() {
    mainState.sessionRunning = false;
  }

  static void reset() {
    mainState.sessionRunning = false;
    mainState.deathCountdownController.reset();
    mainState.sessionCountdownController.reset();
  }

  static void startSession() {
    mainState.sessionRunning = true;
    mainState.deathCountdownController.start();
    mainState.sessionCountdownController.start();
  }

  static void killScreen() {
    var duration = Duration(milliseconds: 50);
    List<String> replacements = ['#', '666', 'XXX', 'DEATH'];
    Random random = Random();
    Timer.periodic(duration, (timer) {
      // Stop the timer when it matches a condition
      if (timer.tick >= 100) {
        timer.cancel();
      }
      int length = mainState.textfieldState.value.length;
      mainState.textfieldState.value = mainState.textfieldState.value += replacements[random.nextInt(4)];
      print('Tick: ${timer.tick}');
    });
  }
}
