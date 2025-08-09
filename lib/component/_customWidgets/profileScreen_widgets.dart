import 'package:flutter/material.dart';

import '../static_styles.dart';

void profileOthersInfoWidget(BuildContext context, bottomSheetHeight, title, moreDetail) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
    ),
    backgroundColor: cardColor,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        height: bottomSheetHeight,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded( // Makes content scrollable if too long
              child: SingleChildScrollView(
                child: Text(
                  moreDetail,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}


const String termsConditionText = '''
By using Crowdpick, you agree to the following terms:

1. Eligibility – You must be at least 13 years old to use this app.
2. Account Security – You are responsible for keeping your login credentials safe.
3. Event Information – We display event details provided by organizers. Crowdpick is not responsible for inaccurate or outdated information.
4. Ticket Purchase – All ticket sales are final unless the organizer offers a refund policy.
5. Prohibited Activities – You agree not to misuse the platform, engage in fraudulent activities, or violate any applicable laws.
6. Service Changes – We may update, modify, or discontinue any feature at any time without prior notice.
7. Liability – Crowdpick acts as a booking platform and is not responsible for event cancellations, changes, or damages incurred during events.

By continuing to use Crowdpick, you agree to abide by these terms.
''';

const String policyText = '''
Your privacy matters to us. This policy explains how we handle your data:

Information We Collect – We collect your name, email, phone number, and other details you provide during account registration or ticket purchases.

How We Use Data – We use your information to process bookings, improve our services, and send you updates about events.

Data Sharing – We do not sell your personal information. We may share necessary data with event organizers or payment providers to complete your booking.

Security – We take appropriate measures to protect your data, but no system is 100% secure.

Cookies & Tracking – We may use cookies to improve your experience and understand app usage.

Your Rights – You can request to access, update, or delete your personal data by contacting us.

By using Crowdpick, you consent to the collection and use of your data as described in this policy.
''';

const String aboutUsText = '''
Crowdpick is your go-to platform for discovering and booking the best events around you. Whether you’re looking for concerts, sports, festivals, conferences, or local gatherings, Crowdpick connects you with the experiences you love.

Our mission is simple — to make event discovery and ticket booking easy, fast, and secure.

We work closely with event organizers to bring you exclusive events, early-bird offers, and a seamless booking experience right from your phone. With Crowdpick, you’re just a few taps away from your next great memory.
''';

