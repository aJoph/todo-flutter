import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pomodoro_model.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  _PomodoroPageState createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  final CountDownController _countDownController = CountDownController();

  @override
  Widget build(BuildContext context) {
    int _timerDuration =
        Provider.of<PomodoroModel>(context).currentTimerDuration;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // CLOCK -----------------------------------------------------------------
      body: Center(
        child: Container(
          // Container Styling -------------------------------------------------
          padding: const EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width * (3 / 5),
          height: MediaQuery.of(context).size.height * (3 / 5),
          decoration:  BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                // Buttons -----------------------------------------------------
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _countDownController.start(),
                      child: const Text("Start"),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _countDownController.pause(),
                      child: const Text("Stop"),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              CircularCountDownTimer(
                duration: 25 * 60,
                initialDuration: _timerDuration,
                controller: _countDownController,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: Theme.of(context).primaryColorLight,
                ringGradient: null,
                fillColor: Theme.of(context).colorScheme.onPrimary,
                fillGradient: null,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                backgroundGradient: null,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                    fontSize: 36.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  debugPrint('Countdown Started');
                },
                onComplete: () {
                  debugPrint('Countdown Ended');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
