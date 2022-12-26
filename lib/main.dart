import 'package:flutter/material.dart';
import 'package:moodswinger_app/components/theme.dart';
import 'package:moodswinger_app/screens/sign_in.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MoodSwinger",
      home: const SignInScreen(),
      theme: appTheme.theme));
}
