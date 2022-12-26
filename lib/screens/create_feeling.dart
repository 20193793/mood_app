import 'package:flutter/material.dart';
import 'package:moodswinger_app/components/theme.dart';
import 'package:moodswinger_app/components/widgets/main_widgets.dart';
import 'package:moodswinger_app/models/moods.dart';
import 'package:moodswinger_app/screens/create_note.dart';
import 'package:moodswinger_app/screens/home.dart';

List<Mood> getMoodsList() {
  List<Mood> moodsList = [];
  Mood angry = Mood(
      feel: "Sad",
      feelValue: 0,
      moodArt: const AssetImage("images/sad.png"),
      color: const Color(0xff51789A));
  Mood sad = Mood(
      feel: "Angry",
      feelValue: 1,
      moodArt: const AssetImage("images/angry.png"),
      color: const Color(0xffBC3E3E));
  Mood blessed = Mood(
      feel: "Blessed",
      feelValue: 2,
      moodArt: const AssetImage("images/blessed.png"),
      color: const Color(0xffE0A5A5));
  Mood cheerful = Mood(
      feel: "Cheerful",
      feelValue: 3,
      moodArt: const AssetImage("images/cheerful.png"),
      color: const Color(0xff37856E));
  Mood delighted = Mood(
      feel: "Delighted",
      feelValue: 4,
      moodArt: const AssetImage("images/delighted.png"),
      color: const Color(0xff6F4788));

  moodsList.add(sad);
  moodsList.add(angry);
  moodsList.add(blessed);
  moodsList.add(cheerful);
  moodsList.add(delighted);

  return moodsList;
}

class CreateFeelScreen extends StatefulWidget {
  const CreateFeelScreen({Key? key}) : super(key: key);

  @override
  State<CreateFeelScreen> createState() => _CreateFeelScreenState();
}

class _CreateFeelScreenState extends State<CreateFeelScreen> {
  List<Mood> moods = getMoodsList();
  double index = 3;
  AssetImage moodArt = const AssetImage("");
  Mood mood = Mood(
      moodArt: const AssetImage("images/cheerful.png"),
      feel: "Cheerful",
      feelValue: 3,
      color: const Color(0xff37856E));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {"/home": ((context) => const HomeScreen())},
        theme: appTheme.theme,
        title: "Create Mood",
        home: SafeArea(
            child: Scaffold(
                appBar: DefaultAppBar("How You Feeling?", true, context),
                body: BackgroundContainer(
                    child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(36),
                    child: Image(
                      image: mood.moodArt,
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                  Text(
                    mood.feel,
                    style: TextStyle(color: moods[index.toInt()].color),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Slider(
                        activeColor: appTheme.theme.colorScheme.onPrimary,
                        inactiveColor: appTheme.theme.colorScheme.surface,
                        divisions: 4,
                        min: 0,
                        max: 4,
                        value: index,
                        onChanged: (double newMoodValue) {
                          setState(() {
                            index = newMoodValue;
                            mood.moodArt = moods[index.toInt()].moodArt;
                            mood.feel = moods[index.toInt()].feel;
                          });
                        }),
                  ),
                  SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateNoteScreen(
                                      mood: mood,
                                    ))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "NEXT",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                            )
                          ],
                        ),
                      )),
                ])))));
  }
}
