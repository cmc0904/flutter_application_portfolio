import 'dart:async';

import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({super.key});

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  // int totalTime = 60;
  int times = 60; //1 min
  late Timer timer;
  String timeView = '0:00:00';
  bool isRunning = false;

  void timeStart() {
    if (isRunning) {
      timeStop();
      setState(() {
        isRunning = !isRunning;
      });
    } else {
      setState(() {
        isRunning = !isRunning;
      });
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            timeView = Duration(seconds: times).toString().split('.').first;
            times--;
            if (times < 0) {
              timeStop();
              setState(() {
                isRunning = !isRunning;
              });
            }
          });
        }
      });
    }

    //1초마다 1씩 감소
  }

  void timeStop() {
    timer.cancel();
  }

  void timeReset() {
    setState(() {
      timeStop();
      times = 60;
      isRunning = false;
      timeView = Duration(seconds: times).toString().split('.').first;
    });
  }

  void addTime(int sec) {
    times += sec;
    times = times < 0 ? 0 : times;
    setState(() {
      timeView = Duration(seconds: times).toString().split('.').first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      '타이머',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                )),

            Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      timeView,
                      style: const TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                )),
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    timeButton(sec: 60, color: Colors.white),
                    timeButton(
                        sec: 30,
                        color:Colors.white),
                    timeButton(
                        sec: -60, color: Colors.white),
                    timeButton(
                        sec: -30,
                        color: Colors.white),
                  ],
                ),
              ),
            ),
            
            Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isRunning)
                        IconButton(
                          onPressed: timeStart,
                          icon: const Icon(Icons.pause_circle_rounded),
                          iconSize: 50,
                          color: Colors.white,
                        )
                      else
                        IconButton(
                          onPressed: timeStart,
                          icon: const Icon(
                            Icons.play_circle_fill_rounded,
                            color: Colors.white,
                          ),
                          iconSize: 50,
                        ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: timeReset,
                        icon: const Icon(
                          Icons.restore_rounded,
                          color: Colors.white,
                        ),
                        iconSize: 50,
                      )
                    ],
                  ),
                ))
          ],
        );
  }

  GestureDetector timeButton({required int sec, required Color color}) {
    return GestureDetector(
      onTap: () => addTime(sec),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(color: color),
        child: Center(child: Text('$sec 초 추가')),
      ),
    );
  }
}
