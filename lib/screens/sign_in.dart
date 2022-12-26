import 'package:flutter/material.dart';
import 'package:moodswinger_app/components/theme.dart';
import 'package:moodswinger_app/components/widgets/main_widgets.dart';
import 'package:moodswinger_app/screens/home.dart';
import 'package:moodswinger_app/screens/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _MyAppState();
}

class _MyAppState extends State<SignInScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String email = "";
  String pass = "";

  String error = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme.theme,
        title: "Sign In",
        home: SafeArea(
            child: Scaffold(
                body: BackgroundContainer(
                    child: Form(
                        key: _formKey,
                        child: ListView(children: [
                          Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 300,
                                  child: Image.asset(
                                    "images/appbackground.png",
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Welcome Back!",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    controller: nameController,
                                    onChanged: (value) {
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                    validator: (value) => value!.isEmpty
                                        ? "Please enter an email"
                                        : null,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Email',
                                        hintText: "johndoe@gmail.com"),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        pass = value;
                                      });
                                    },
                                    obscureText: true,
                                    controller: passwordController,
                                    validator: (value) => value!.isEmpty
                                        ? "Please enter a password"
                                        : null,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Password',
                                        hintText: "password123"),
                                  ),
                                ),
                                Text(
                                  error,
                                  style: TextStyle(
                                      color: appTheme.theme.errorColor,
                                      fontSize: 12),
                                ),
                                Container(
                                    width: 100,
                                    padding: const EdgeInsets.all(15),
                                    child: ElevatedButton(
                                      child: const Text('Login'),
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const HomeScreen())));
                                      },
                                    )),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account?",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTheme.theme.hintColor)),
                                      TextButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen())),
                                          child: const Text(
                                            "Sign Up",
                                            style: TextStyle(fontSize: 12),
                                          ))
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("OR try the app",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTheme.theme.hintColor)),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeScreen()));
                                          },
                                          child: const Text(
                                            "Here",
                                            style: TextStyle(fontSize: 12),
                                          ))
                                    ]),
                              ]),
                        ]))))));
  }
}
