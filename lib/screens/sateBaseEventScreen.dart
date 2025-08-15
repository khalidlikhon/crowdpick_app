import 'package:crowdpick_app/component/static_styles.dart';
import 'package:flutter/material.dart';

import '../component/_customWidgets/homeScreen_widgets.dart';
import '../component/_customWidgets/responsiveHelper.dart';
import '../component/dataModel.dart';
import '../component/demoData.dart';
import 'clickedEventScreen.dart';

class SateBaseEventScreen extends StatelessWidget {
  final String title;

  const SateBaseEventScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 15),
          // Top bar with back button & title
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F1F1F),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.keyboard_backspace, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 10),
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
                        title,
                        style: const TextStyle(
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

          // Event List
          Expanded(
            child: ListView.builder(
              itemCount: eventsList.length,
              padding: EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final event = eventsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => clickedEventScreen(event: event),
                      ),
                    );
                  },
                  child: _stateBaseEventCard(event, context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Card widget
Widget _stateBaseEventCard(Map<String, dynamic> event, context) {
  final double width = ResponsiveHelper.cardWidth(context);

  return Padding(
    padding: const EdgeInsets.only(bottom: 18),
    child: Hero(
      tag: 'clickedImageOnHero-${event["id"]}',
      child: Container(
        width: width,
        height: MediaQuery.of(context).size.height * 0.35,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(
              (event['image']?.isNotEmpty ?? false)
                  ? event['image']!
                  : 'https://via.placeholder.com/300x200.png?text=No+Image',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['eventTitle'] ?? '',  // changed from 'title' to 'eventTitle'
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.verified, size: 14, color: Colors.white70),
                      SizedBox(width: 4),
                      Text(
                        event["organizerName"]! ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.white70),
                      SizedBox(width: 4),
                      Text(
                        event["eventLocation"] ?? "",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
