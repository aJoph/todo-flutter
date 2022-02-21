import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/pomodoro_model.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      // CLOCK -----------------------------------------------------------------
      body: Center(
        child: Container(
          // Container Styling -------------------------------------------------
          padding: const EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width * (3 / 4),
          height: MediaQuery.of(context).size.height * (3 / 5),
          decoration: const BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.all(Radius.circular(8))),
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
                ringColor: Colors.orangeAccent,
                ringGradient: null,
                fillColor: Colors.amberAccent,
                fillGradient: null,
                backgroundColor: Colors.deepOrange[300],
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
