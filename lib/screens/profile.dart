import 'package:flutter/material.dart';
import 'package:moodswinger_app/components/widgets/main_widgets.dart';
import 'package:moodswinger_app/screens/create_feeling.dart';
import 'package:moodswinger_app/screens/home.dart';
import 'package:moodswinger_app/components/theme.dart';
import 'package:moodswinger_app/screens/sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {"/home": ((context) => const HomeScreen())},
        theme: appTheme.theme,
        title: "Month View",
        home: SafeArea(
            child: Scaffold(
          appBar:
              AppBar(title: const Text("Entries"), centerTitle: true, actions: [
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
          bottomNavigationBar: BottomBar(
              selectedIndex: 1,
              scrollController: scrollController,
              otherScreen: "/home"),
          body: BackgroundContainer(
              child: Padding(
            padding: const EdgeInsets.all(128),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("First Name"),
                  TextField(
                    decoration: InputDecoration(hintText: "Ahmed"),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Text("Last Name"),
                  TextField(
                    decoration: InputDecoration(hintText: "Mohamed"),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Text("Email"),
                  TextField(
                    decoration:
                        InputDecoration(hintText: "ahmedmohamed@gmail.com"),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Text("Password"),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "************"),
                  ),
                ],
              ),
            ),
          )),
        )));
  }
}
