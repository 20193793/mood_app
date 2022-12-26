import 'package:flutter/material.dart';
import 'package:moodswinger_app/components/widgets/main_widgets.dart';
import 'package:moodswinger_app/components/theme.dart';
import 'package:moodswinger_app/screens/home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": ((context) => const HomeScreen()),
      },
      theme: appTheme.theme,
      title: "Welcome Screen",
      home: SafeArea(
        child: Scaffold(
          body: BackgroundContainer(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "You Did It!",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "You are now one step closer to living a better life and having better mentality.",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                          width: 150,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xffAE3B40))),
                              child: const Text(
                                "CONTINUE",
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const HomeScreen())));
                              })))
                ]),
          ),
        ),
      ),
    );
  }
}
