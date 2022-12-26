import 'package:flutter/material.dart';
import 'package:moodswinger_app/components/theme.dart';
import 'package:moodswinger_app/components/widgets/main_widgets.dart';
import 'package:moodswinger_app/screens/create_feeling.dart';
import 'package:moodswinger_app/screens/profile.dart';
import 'package:moodswinger_app/screens/sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    //Supposed to show the name of signed in user but nothing is shown
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/profile": ((context) => const ProfileScreen()),
        },
        theme: appTheme.theme,
        title: "Home",
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                title: const Text("Entries"),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SignInScreen())));
                      },
                      icon: Icon(Icons.logout_outlined,
                          color: appTheme.theme.hintColor)),
                ]),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const CreateFeelScreen())));
                },
                child: const Icon(Icons.add_rounded)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            body: BackgroundContainer(
              child: ListView(
                children: [
                  EnrtyCard(
                      color: const Color(0xffBC3E3E),
                      title: "Awful day at work!",
                      mood: "ANGRY",
                      date: "18th at 9:21"),
                  EnrtyCard(
                      color: const Color(0xffE0A5A5),
                      title: "She said yes!!! 💍",
                      mood: "BLESSED",
                      date: "26th at 17:43"),
                  EnrtyCard(
                      color: const Color(0xff51789A),
                      title: "All things done and settled",
                      mood: "SAD",
                      date: "28th at 21:09"),
                  EnrtyCard(
                      color: const Color(0xff51789A),
                      title: "The wedding might be off",
                      mood: "SAD",
                      date: "31st at 17:43"),
                  EnrtyCard(
                      color: const Color(0xffE0A5A5),
                      title: "I love her so much",
                      mood: "BLESSED",
                      date: "5nd at 14:21"),
                  EnrtyCard(
                      color: const Color(0xff6F4788),
                      title: "Best day ever!!!",
                      mood: "DELIGHTED",
                      date: "8nd at 21:33"),
                ],
              ),
            ),
            bottomNavigationBar: BottomBar(
                selectedIndex: 0,
                scrollController: scrollController,
                otherScreen: "/profile"),
          ),
        ));
  }
}

class EnrtyCard extends StatefulWidget {
  String title;
  String mood;
  String date;
  final Color color;
  EnrtyCard({
    Key? key,
    required this.title,
    required this.mood,
    required this.date,
    required this.color,
  }) : super(key: key);

  @override
  State<EnrtyCard> createState() => _EnrtyCardState();
}

class _EnrtyCardState extends State<EnrtyCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: appTheme.theme.colorScheme.surface,
              elevation: 12,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(32))),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                    gradient: LinearGradient(colors: [
                      appTheme.theme.colorScheme.surface,
                      widget.color
                    ], begin: const Alignment(0.2, 0))),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title),
                      SizedBox(
                        width: 200,
                        height: 32,
                        child: Divider(
                          indent: 0,
                          color: appTheme.theme.colorScheme.outline,
                        ),
                      ),
                      Text(
                        widget.mood,
                        style: TextStyle(color: widget.color, fontSize: 32),
                      ),
                      const SizedBox(
                        height: 16,
                        width: double.infinity,
                      ),
                      Text(widget.date,
                          style: TextStyle(
                            color: appTheme.theme.colorScheme.outline,
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
