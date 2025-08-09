import 'package:crowdpick_app/component/static_styles.dart';
import 'package:flutter/material.dart';

import '../component/_customWidgets/appCustomBottomNav.dart';
import '../component/_customWidgets/profileScreen_widgets.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
        body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      // Title
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F1F1F),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // TODO :Profile Section Container
                        Container(
                            padding: EdgeInsets.all(15),
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color:  Color(0xFF1F1F1F),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  // Profile Image
                                   CircleAvatar(
                                    radius: 45,
                                    backgroundImage: AssetImage('/images/userImage.jpg'),
                                    backgroundColor: Colors.grey,
                                  ),
                                  const SizedBox(height: 14),
            
                                  // Name
                                  Text(
                                    'Khalid LikhOn',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
            
                                  SizedBox(height: 2),
            
                                  // Email
                                  Text(
                                    'liOs@crowdpick.com',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 10,
                                    ),
                                  ),
            
                                  SizedBox(height: 2),
            
                                  // Phone Number
                                  Text(
                                    '+650‑543‑4800',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 10,
                                    ),
                                  ),
            
                                  SizedBox(height: 18),
            
                                  // Edit Profile Button
                                  SizedBox(
                                    width: 130,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF95E143),
                                        foregroundColor: Colors.black,
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {
                                        // handle edit
                                      },
                                      child: Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        SizedBox(height: 18),
            
            
                        // TODO : Settings Section Container
                        Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFF1F1F1F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                child: _buildProfileItem(Icons.settings, 'Settings'),
                                onTap: (){
                                  print('Settings clicked!');
            
                                },
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                child: _buildProfileItem(Icons.lock, 'Change Password'),
                                onTap: (){
                                  print('Change password clicked!');
                                },
                              )
                            ],
                          ),
                        ),
                        
                        
                        SizedBox(height: 18),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFF1F1F1F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                child: _buildProfileItem(Icons.error_outline, 'About Us'),
                                onTap: () {
                                  profileOthersInfoWidget(
                                    context, 300,
                                    'About Us', aboutUsText,
                                  );
                                },
                              ),
                              SizedBox(height: 12),
                              GestureDetector(
                                child: _buildProfileItem(Icons.verified_user_outlined, 'Terms & Conditions'),
                                onTap: (){
                                  profileOthersInfoWidget(
                                      context, 460,
                                      'Terms & Conditions', termsConditionText
                                  );
                                },
                              ),
                              SizedBox(height: 12),
                              GestureDetector(
                                child: _buildProfileItem(Icons.policy_outlined, 'Privacy Policy'),
                                onTap: () {
                                  profileOthersInfoWidget(
                                    context, 600,
                                    'Privacy Policy', policyText,
                                  );
                                },
                              ),

                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Divider(color: Colors.white38, height: 1)
                              ),

                              Row(
                                children: [
                                  Icon(Icons.logout_outlined, color: Colors.white, size: 16),
                                  SizedBox(width: 5),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pushNamedAndRemoveUntil(context, '/loginScreen', (route)=> false);
                                    },
                                    child: Text(
                                      'Log Out',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 25),
                        Profile2OrganizerPanelCard(
                            onOrganizerTap:
                                ()=> Navigator.pushNamedAndRemoveUntil(context, "/organizerAuthScreen", (route)=> false),
                        ),

                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),

        bottomNavigationBar: appCustomBottomNavBar(currentIndex: 2)
    );
  }
}



Widget _buildProfileItem(IconData icon, String title) {
  return Expanded(
    child: Row(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        SizedBox(width: 15),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}



class Profile2OrganizerPanelCard extends StatelessWidget {
  final VoidCallback onOrganizerTap;

  const Profile2OrganizerPanelCard({
    Key? key,
    required this.onOrganizerTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "Become an Organizer",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),

          // Subtitle
          Text(
            "Want to launch your own event? Join our organizer panel to create, manage, and sell tickets effortlessly.",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white70,
              height: 1.3,
            ),
          ),
          SizedBox(height: 12),

          // Organizer Panel Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onOrganizerTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.white24),
                ),
              ),
              icon: Icon(
                Icons.dashboard_customize_rounded,
                size: 16,
                color: Colors.white,
              ),
              label: Text(
                "Go Organizer Panel",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}