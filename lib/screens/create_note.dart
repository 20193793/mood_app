import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moodswinger_app/components/theme.dart';
import 'package:moodswinger_app/components/widgets/main_widgets.dart';
import 'package:moodswinger_app/models/mood_entry.dart';
import 'package:moodswinger_app/models/moods.dart';
import 'package:moodswinger_app/screens/home.dart';

class CreateNoteScreen extends StatefulWidget {
  final Mood? mood;
  final String? month;
  const CreateNoteScreen({Key? key, @required this.mood, @required this.month})
      : super(key: key);

  @override
  State<CreateNoteScreen> createState() => _MyAppState();
}

class _MyAppState extends State<CreateNoteScreen> {
  DateTime date = DateTime.now();
  Future selectDateIn(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1960),
      lastDate: DateTime(2080),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  TextEditingController headController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  MonthEntries entries = MonthEntries();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {"/home": ((context) => const HomeScreen())},
        theme: appTheme.theme,
        title: "Create Note",
        home: SafeArea(
            child: Scaffold(
          appBar:
              DefaultAppBar("Why are you ${widget.mood?.feel}?", true, context),
          body: BackgroundContainer(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //Headline textfield
                      TextFormField(
                        controller: headController,
                        decoration: const InputDecoration(
                          hintText: 'Add a Headline...',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  selectDateIn(context);
                                },
                                icon: Icon(
                                  Icons.calendar_today_outlined,
                                  size: 24,
                                  color: appTheme.theme.colorScheme.primary,
                                )),
                            Text(
                              DateFormat.yMMMMEEEEd().format(date),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      //Thoughts textfield
                      TextField(
                          controller: noteController,
                          minLines: 1,
                          maxLines: 50,
                          decoration: const InputDecoration(
                            hintText: 'Express your thoughts here...',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xff5C4964))),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xff323232)),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Entry newEntry = Entry(
                  mood: widget.mood,
                  head: headController.text,
                  note: noteController.text,
                  date: date);
              entries.addEntry(newEntry);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const HomeScreen())));
            },
            child: Icon(
              Icons.check,
              color: appTheme.theme.colorScheme.onPrimary,
            ),
          ),
        )));
  }
}
