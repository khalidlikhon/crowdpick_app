import 'package:crowdpick_app/screens/myticketScreen.dart';
import 'package:flutter/material.dart';
import 'package:crowdpick_app/screens/homeScreen.dart';
import 'package:crowdpick_app/screens/profileScreen.dart';

class appCustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const appCustomBottomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF1F1F1F),
            elevation: 0,
            selectedItemColor: Color(0xFF95E143),
            unselectedItemColor: Colors.white.withOpacity(0.7),
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 8,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
            ),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) {
              if (onTap != null) {
                onTap!(index);
              } else if (index != currentIndex) {
                if (index == 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => homeScreen()),
                  );
                } else if (index == 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  myticketScreen()),
                  );
                } else if (index == 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => profileScreen()),
                  );
                }
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: _buildNavItem(
                  icon: Icons.home,
                  label: 'Home',
                  isSelected: currentIndex == 0,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(
                  icon: Icons.confirmation_number,
                  label: 'My Ticket',
                  isSelected: currentIndex == 1,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(
                  icon: Icons.person,
                  label: 'Profile',
                  isSelected: currentIndex == 2,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 22,
          color: isSelected ? Color(0xFF95E143) : Colors.white70,
        ),
        SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Color(0xFF95E143) : Colors.white70,
          ),
        ),
      ],
    );
  }
}
