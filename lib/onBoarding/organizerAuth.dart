import 'package:crowdpick_app/component/static_styles.dart';
import 'package:flutter/material.dart';

import '../component/_customWidgets/appCustomBottomNav.dart';

class organizerAuthScreen extends StatelessWidget {
  const organizerAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Text(
              'Organizer Authentication Screen!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
    );
  }
}
