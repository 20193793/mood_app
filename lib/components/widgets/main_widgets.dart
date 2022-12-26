import 'package:flutter/material.dart';
import 'package:moodswinger_app/components/theme.dart';
import 'package:moodswinger_app/screens/home.dart';

class BottomBar extends StatefulWidget {
  int selectedIndex;
  final ScrollController scrollController;
  final String otherScreen;
  BottomBar(
      {Key? key,
      required this.selectedIndex,
      required this.scrollController,
      required this.otherScreen})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

//Not used
class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      if (widget.selectedIndex == index) {
        widget.scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      } else {
        Navigator.pushNamed(context, widget.otherScreen);
      }
      setState(() {
        widget.selectedIndex = index;
      });
    }

    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 28,
            ),
            activeIcon: Icon(Icons.home_rounded, size: 28),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 24,
            ),
            label: "Profile")
      ],
    );
  }
}

// Container used to set gradient background
class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              appTheme.theme.colorScheme.surface,
              appTheme.theme.colorScheme.background
            ])),
        child: child);
  }
}

// Appbar
PreferredSizeWidget DefaultAppBar(
    String title, bool hasClose, BuildContext context) {
  Widget addCloseButton() {
    if (hasClose) {
      return IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => HomeScreen())));
          },
          icon: const Icon(Icons.close_rounded),
          color: appTheme.theme.colorScheme.tertiary);
    } else {
      return Container();
    }
  }

  return AppBar(
    leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 16,
        )),
    title: Text(
      title,
      textAlign: TextAlign.center,
    ),
    actions: [addCloseButton()],
  );
}
