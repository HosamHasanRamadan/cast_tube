import 'dart:async';

import 'package:cast_tube/extensions/extensions.dart';
import 'package:cast_tube/providers.dart';
import 'package:cast_tube/utils/sleep_timer_manager.dart';
import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

class SleepTimerPicker extends StatefulWidget {
  const SleepTimerPicker({super.key});

  @override
  State<SleepTimerPicker> createState() => _SleepTimerPickerState();
}

class _SleepTimerPickerState extends State<SleepTimerPicker> {
  SleepTimerManager get timerManager => context.read(sleepTimerManagerProvider);

  static const numberOfTicks = 30;
  int minutesPicked = 5;

  late final Timer _timer;

  final remainingTimeNotifier = ValueNotifier(Duration.zero);
  @override
  void initState() {
    super.initState();
    _getRemainingDuration();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _getRemainingDuration(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Duration>(
      valueListenable: remainingTimeNotifier,
      builder: (context, value, child) {
        late Widget child;
        if (value == Duration.zero)
          child = picker;
        else
          child = countDown;

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _getRemainingDuration() {
    timerManager.remainingTime().then(
          (value) => remainingTimeNotifier.value = value,
        );
  }

  Widget get countDown {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          remainingTimeNotifier.value.mmss,
          style: Theme.of(context).textTheme.headline4,
        ),
        TextButton(
          onPressed: () => timerManager.stop(),
          child: const Text('Stop'),
        ),
      ],
    );
  }

  Widget get picker {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WheelSlider(
            totalCount: numberOfTicks,
            initValue: 0,
            isInfinite: false,
            perspective: .001,
            squeeze: 1,
            onValueChanged: (value) {
              final val = value as int;
              minutesPicked = (val + 1) * 5;
              setState(() {});
            },
          ),
          Text(
            '$minutesPicked min',
            style: Theme.of(context).textTheme.headline5,
          ),
          TextButton(
            onPressed: () => timerManager.setTimer(
              Duration(minutes: minutesPicked),
            ),
            child: const Text('Set'),
          ),
        ],
      ),
    );
  }
}
