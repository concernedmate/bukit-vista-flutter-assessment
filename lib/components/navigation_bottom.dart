import 'package:bukit_vista_flutter_assessment/components/page_transition.dart';
import 'package:bukit_vista_flutter_assessment/features/guestList/view/guestList_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget navbarBottom(BuildContext context, int selectedIndex, [Function(int)? onTapFunc]){
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 32),
        label: '',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.wallet, size: 24),
        label: '',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications, size: 32),
        label: '',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person, size: 32),
        label: '',
        backgroundColor: Colors.white,
      ),
    ],
    currentIndex: selectedIndex,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    onTap: onTapFunc ?? (index) {
      switch (index) {
        case 0:
          Navigator.push(
            context, 
            fadeOut(GuestListPageProvider())
          );
          break;
        default:
      }
    }
  );
}