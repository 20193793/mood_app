import 'package:flutter/material.dart';
import 'package:moodswinger_app/components/theme.dart';
import 'package:moodswinger_app/components/widgets/main_widgets.dart';
import 'package:moodswinger_app/screens/sign_in.dart';
import 'package:moodswinger_app/screens/welcome.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _MyAppState();
}

class _MyAppState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  //Controllers
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late TabController _tabController;

  //Authentication
  final _formKey = GlobalKey<FormState>();

  String fname = "";
  String lname = "";
  String email = "";
  String pass = "";

  String error = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme.theme,
        title: "Create Note",
        home: SafeArea(
            child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                  toolbarHeight: 0,
                  bottom: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: const Color(0xff323232),
                      tabs: const [
                        Tab(icon: Icon(Icons.waving_hand_outlined)),
                        Tab(icon: Icon(Icons.email_outlined)),
                      ])),
              body: BackgroundContainer(
                child: Form(
                  key: _formKey,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView(
                        children: [
                          Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 500,
                                  child: Image.asset(
                                    "images/signup.png",
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Tell Us Your Name...",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        fname = value;
                                      });
                                    },
                                    controller: fNameController,
                                    validator: (value) => value!.isEmpty
                                        ? "Please enter a name"
                                        : null,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'First Name',
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        lname = value;
                                      });
                                    },
                                    controller: lNameController,
                                    validator: (value) => value!.isEmpty
                                        ? "Please enter a name"
                                        : null,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Last Name',
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(15),
                                    child: SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _tabController.animateTo(
                                                  _tabController.index + 1);
                                            }
                                          }),
                                    )),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Already have an account?",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTheme.theme.hintColor)),
                                      TextButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignInScreen())),
                                          child: const Text(
                                            "Sign In",
                                            style: TextStyle(fontSize: 12),
                                          ))
                                    ]),
                              ])
                        ],
                      ),
                      ListView(
                        children: [
                          Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 500,
                                  child: Image.asset(
                                    "images/signin.png",
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Your Credentials...",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                    controller: emailController,
                                    validator: (value) => value!.isEmpty
                                        ? "Please enter an email"
                                        : null,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                    ),
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
                                    controller: passController,
                                    validator: (value) => value!.length <= 8
                                        ? "Please enter a password with 8 or more"
                                        : null,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),
                                  ),
                                ),
                                Text(
                                  error,
                                  style: TextStyle(
                                      color: appTheme.theme.errorColor,
                                      fontSize: 12),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(15),
                                    child: SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  "SIGN UP",
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width: 5),
                                                Icon(
                                                  Icons.check,
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          const WelcomeScreen())));
                                            }))),
                              ])
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        )));
  }
}
