import 'package:flutter/material.dart';

import 'myhomepage.dart';
//DateTime time=DateTime(0000,0, 0, 00, 1, 0);

DateTime time=DateTime.now().add(Duration(hours: 0,minutes: 1,seconds: 0));
Duration rem=Duration.zero;
DateTime time2=DateTime.now().add(Duration(hours: 0,minutes: 5,seconds: 0));
Duration rem2=Duration.zero;
String text="00:00:00";
String text2="00:00:00";
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() async {
    while (!rem.isNegative) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        rem = time.difference(DateTime.now());
        text = "${rem.inHours.toString().padLeft(2, '0')}:"
            "${(rem.inMinutes % 60).toString().padLeft(2, '0')}:"
            "${(rem.inSeconds % 60).toString().padLeft(2, '0')}";
      });

      if (rem.isNegative) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Finished")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${time.hour.toString().padLeft(2, '0')}:"
                  "${time.minute.toString().padLeft(2, '0')}:"
                  "${time.second.toString().padLeft(2, '0')}",
              style: const TextStyle(fontSize: 24),
            ),
            Text(text, style: const TextStyle(fontSize: 24)),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  time = DateTime.now().add(const Duration(minutes: 1));
                  rem = Duration.zero;
                  startTimer();
                });

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Timer Started")));
              },
              child: const Text("Start"),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  rem += const Duration(seconds: 20);
                  time = time.add(const Duration(seconds: 20));
                });
              },
              child: const Text("Add 20s"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyHomePage()));
              },
              child: const Text("Test Page"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyHomePage()));
              },
              child: const Text("Replace Page"),
            ),
          ],
        ),
      ),
    );
  }
}