import 'package:moodswinger_app/models/moods.dart';

class Entry {
  final Mood? mood;
  final String head;
  final String note;
  final DateTime date;
  Entry(
      {required this.mood,
      required this.head,
      required this.note,
      required this.date});

  String get getHead => head;
  String get getNote => note;
  DateTime get getDate => date;
  Mood? get getMood => mood;
}

class MonthEntries {
  List<Entry> getEntries() {
    List<Entry> entries = [];
    return entries;
  }

  void addEntry(Entry newEntry) {
    getEntries().add(newEntry);
  }
}
