
import 'package:crowdpick_app/screens/clickedEventScreen.dart';
import 'package:flutter/material.dart';

import 'responsiveHelper.dart';

/// Upcoming event card
class upcomingCard extends StatelessWidget {
  final Map<String, dynamic> event;

  const upcomingCard({
    Key? key,
    required this.event,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final double width = ResponsiveHelper.cardWidth(context);

    return Hero(
      tag: 'clickedImageOnHero-${event["id"]}',
      child: Container(
        width: width,
        margin: const EdgeInsets.only(left: 16),
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
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event['eventTitle'] ?? '',  // changed from 'title' to 'eventTitle'
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                event["eventSummary"]! ,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.timer_sharp, size: 14, color: Colors.white70),
                  const SizedBox(width: 4),
                  const Text(
                    "Happening today at ",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    event["eventTime"] ?? "",
                    style: const TextStyle(
                      color: Color(0xFF95E143),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.white70),
                  const SizedBox(width: 4),
                  Text(
                    event["eventLocation"] ?? "",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              /*ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => clickedEventScreen(event: event),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF95E143),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                ),
                child: const Text(
                  'Get Now',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}



/// discover all event card
class discoverCard extends StatelessWidget {
  final Map<String, dynamic> event;
  final double parentHeight;

  const discoverCard({
    Key? key,
    required this.event,
    required this.parentHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Responsive card width based on screen size
    final double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth;

    if (screenWidth < 600) {
      cardWidth = screenWidth / 1.5;
    } else if (screenWidth < 900) {
      cardWidth = (screenWidth - 48) / 2;
    } else {
      cardWidth = (screenWidth - 48) / 4;
    }

    const double imageRatio = 0.6;

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: cardWidth,
        height: parentHeight,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1F1F1F),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: SizedBox(
                  height: parentHeight * imageRatio,
                  width: double.infinity,
                  child: Hero(
                    tag: 'clickedImageOnHero-${event["id"]}',
                    child: Image.network(
                      event['image'] ?? 'https://via.placeholder.com/300x200.png?text=No+Image',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Content section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title + details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            event['eventTitle'] ?? 'No Title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                           SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 12, color: Colors.grey),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  event['eventLocation'] ?? 'No Location',
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.verified, size: 12, color: Colors.white54),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  event['organizerName'] ?? 'No Organizer',
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Date
                      Text(
                        event['eventDate'] ?? 'No Date',
                        style: const TextStyle(
                          color: Color(0xFF95E143),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/// Past Event Stories card
class pastEventStorie extends StatelessWidget {
  final List<Map<String, String>> events; // title, image, organizer

  const pastEventStorie({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double itemWidth;

    if (screenWidth >= 1024) {
      // PC or large screen: show 3.5 cards
      itemWidth = screenWidth / 3.5;
    } else if (screenWidth >= 600) {
      // Tablet: show 2.5 cards
      itemWidth = screenWidth / 2.5;
    } else {
      // Mobile: show 1.2 cards
      itemWidth = screenWidth / 1.3;
    }

    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: events.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final event = events[index];
          return Container(
            width: itemWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  /// Event Image
                  Positioned.fill(
                    child: Image.network(
                      event['image'] ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Bottom Overlay with Title & Organizer
                  Positioned(
                    left: 15,
                    right: 0,
                    bottom: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['title'] ?? 'Untitled',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          event['organizer'] ?? '',
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




/// Our Service card
Widget serviceCard(BuildContext context, serviceIcon, serviceTitle, serviceDescription,) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        border: Border.all(color: Colors.white24, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Height depends on content
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(serviceIcon, size: 22, color: Colors.white),
          const SizedBox(height: 6),
          Text(
            serviceTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            serviceDescription,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 9,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
}
Widget allServiceCard(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Decide number of columns
    int crossAxisCount = screenWidth >= 900 ? 3 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 12,
        mainAxisExtent: 124, // Let height depend on content
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final services = [
          {
            "icon": Icons.confirmation_num,
            "title": "Easy Ticket Purchase",
            "serviceDescription":
            "Discover and book tickets for your favorite events — from concerts to conferences — directly on Crowdpick, anytime, anywhere."
          },
          {
            "icon": Icons.delivery_dining,
            "title": "Instant Ticket Delivery",
            "serviceDescription":
            "Get your tickets instantly after purchase via email, or receive them directly through WhatsApp for maximum convenience."
          },
          {
            "icon": Icons.payments,
            "title": "Multiple Payment Methods",
            "serviceDescription":
            "Pay securely with bKash, Nagad, Upay, Visa, Mastercard, and more — giving you the flexibility to choose your preferred payment option."
          },
          {
            "icon": Icons.featured_play_list_outlined,
            "title": "Crowdpick Pass",
            "serviceDescription":
            "Access all your purchased tickets instantly inside Crowdpick with QR codes — no need to download or print separate PDF tickets."
          },
          {
            "icon": Icons.dashboard,
            "title": "Organizer Dashboard",
            "serviceDescription":
            "Crowdpick’s powerful dashboard gives organizers real-time sales data, attendance insights, and event performance reports — all in one place."
          },
          {
            "icon": Icons.qr_code_scanner,
            "title": "Seamless Check‑In",
            "serviceDescription":
            "Simplify entry with Crowdpick’s fast QR ticket scanning system, ensuring a smooth, hassle‑free experience for both attendees and organizers."
          }
        ];

        final service = services[index];
        return serviceCard(
          context,
          service["icon"] as IconData,
          service["title"] as String,
          service["serviceDescription"] as String,
        );
      },

    );
  }



/// all Categorie Card
class allCategoriesCard extends StatefulWidget {
  const allCategoriesCard({Key? key}) : super(key: key);

  @override
  State<allCategoriesCard> createState() => _allCategoriesCardState();
}

class _allCategoriesCardState extends State<allCategoriesCard> {
  final List<String> categoryList = [
    'Concerts',
    'Sports',
    'Festivals',
    'Comedy',
    'Conferences',
    'Tech Innovation',
    'Reunions',
    'Culture',
    'Fashion-show',
    'Exhibitions',
  ];


  int selectedCategoryIndex = 0;

  Widget categorisHorizontalCard({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFF95E143)
              : Color(0xFF1F1F1F),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Color(0xFF95E143) :  Color(0xFF1F1F1F),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return categorisHorizontalCard(
            title: categoryList[index],
            isSelected: selectedCategoryIndex == index,
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
