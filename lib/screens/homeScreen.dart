import 'package:crowdpick_app/component/_customWidgets/appCustomBottomNav.dart';
import 'package:crowdpick_app/screens/sateBaseEventScreen.dart';
import 'package:flutter/material.dart';
import 'package:crowdpick_app/component/static_styles.dart';

import '../component/_customWidgets/eventScreen_widgets.dart';
import '../component/_customWidgets/homeScreen_widgets.dart';
import '../component/dataModel.dart';
import '../component/demoData.dart';
import 'clickedEventScreen.dart';


class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: appSearchBar(),
            ),

            Padding(
                padding: EdgeInsets.only(top: 15, bottom: 5, right: 16, left: 16),
              child: allCategoriesCard(),
            ),

            /// Upcoming & Subtitle + See all button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title & Subtitle
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore Upcoming!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Explore the Universe of Events at Your Fingertips.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  /// See All Button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_)=> SateBaseEventScreen(title: 'Upcoming Events')
                        ),
                      );
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            /// Upcoming Responsive Horizontal Cards
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5 ,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => clickedEventScreen(event: eventsList[index]), // Option A
                          ),
                        );
                      },
                      child: upcomingCard(event: eventsList[index])
                  );
                },
              ),
            ),
            SizedBox(height: 10),


            /// Discover & Subtitle + See all button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title & Subtitle
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover All Events!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Uncover Every Exciting Event Happening Around You.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  /// See All Button
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SateBaseEventScreen(title: 'All Events',),
                        ),
                      );
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            /// Discover Responsive Horizontal Cards
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eventDataList.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => clickedEventScreen(event: eventsList[index]), // Option A
                        ),
                      );
                    },
                    child: discoverCard(
                      event: eventsList[index], // Pass the EventData object directly
                      parentHeight: 252,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),



            /// Title Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Milestones of Remarkable Events',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Discover the success stories crafted by Crowdpick’s flawless event management.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 9,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(height: 10),
            pastEventStorie(events: pastEventList),

            SizedBox(height: 20),

            /// Services Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,  // center horizontally
                  children: [
                    Text(
                      'Our Offerings',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Discover the essential features that make Crowdpick the trusted platform for event organizers!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 9,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: allServiceCard(context)
            ),



            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Divider(color: Colors.white38, height: 1)),
            Positioned(
              left: 0,
              right: 0,
              bottom: 15,
              child: Center(
                child: Text(
                  '© 2025 Crowdpick. All rights reserved.',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: appCustomBottomNavBar(currentIndex: 0),
    );
  }
}
