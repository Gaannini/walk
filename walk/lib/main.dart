import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int walk = 0;
  ShakeDetector? shakeDetector;

  void onPhoneShake() {
    setState(() {
      walk = walk + 1;
    });
  }

  @override
  void initState() {
    super.initState();

    shakeDetector = ShakeDetector.autoStart(
      // 흔들기 감지 즉시 시작
      shakeSlopTimeMS: 1, // 감지 주기
      shakeThresholdGravity: 10000, // 감지 민감도
      onPhoneShake: onPhoneShake, // 감지 후 실행할 함수
    );
  }

  @override
  void dispose() {
    shakeDetector!.stopListening(); // 흔들기 감지 중지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircleAvatar(
        radius: 140.0,
        backgroundColor: Colors.green[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$walk',
              style: const TextStyle(
                fontSize: 70.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
