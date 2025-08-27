import 'dart:ui';
import 'package:crowdpick_app/component/static_styles.dart';
import 'package:flutter/material.dart';
import '../component/_customWidgets/eventScreen_widgets.dart';
import '../component/dataModel.dart';

class clickedEventScreen extends StatelessWidget {
  final Map<String, dynamic> event; // Keep as Map

  const clickedEventScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventData = EventData.fromJson(event);
    final eventIndex = eventDataList.indexWhere(
      (e) =>
          e.eventTitle == eventData.eventTitle &&
          e.eventDate == eventData.eventDate,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'clickedImageOnHero-${event["id"]}',
              child: Image.network(event['image']!, fit: BoxFit.cover),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.55,
              minChildSize: 0.45,
              maxChildSize: 0.85,
              snap: true,
              builder: (context, scrollController) {
                return ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 5,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.grey[600],
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),

                            // Title
                            Text(
                              event['eventTitle']!,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Date & Time Row
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  event['eventDate']!,
                                  style: TextStyle(color: Colors.grey[300]),
                                ),
                                const SizedBox(width: 16),
                                Icon(
                                  Icons.access_time,
                                  size: 18,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  event['eventTime']!,
                                  style: TextStyle(color: Colors.grey[300]),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Location
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 18,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    event['eventLocation']!,
                                    style: TextStyle(color: Colors.grey[300]),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),

                            // Deadline or extra info
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_off_outlined,
                                  size: 18,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    'Deadline : ${event['purchaseDeadline']}',
                                    style: TextStyle(color: Colors.grey[300]),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Organizer
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Organized by : ',
                                  style: TextStyle(color: Colors.grey[200]),
                                ),

                                Expanded(
                                  child: Row(
                                    children: [
                                      // If verified → show icon first
                                      if (event['isVerified'] == true) ...[
                                        const Icon(
                                          Icons.verified,
                                          size: 13,
                                          color: Colors.blueAccent,
                                        ),
                                        const SizedBox(width: 4),
                                      ],

                                      // Organizer name (always visible)
                                      Expanded(
                                        child: Text(
                                          event['organizerName'] ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.grey[200],
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 28),

                            // Summary Expandable
                            ExpandableWidget(
                              title: 'Event Summary',
                              textContent: event['eventSummary'],
                              isExpanded: true,
                            ),
                            const SizedBox(height: 12),

                            // Policy Expandable
                            ExpandableWidget(
                              title: 'Privacy Policy',
                              textContent: event['eventPolicy'],
                              isExpanded: false,
                            ),

                            const SizedBox(height: 16),
                            Text(
                              'Ticket details & price',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Modified ticket widget call
                            _TicketListWidget(tickets: event['tickets']),

                            const SizedBox(height: 25),
                            // Buy Ticket Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF95E143),
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Back Button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TicketListWidget extends StatelessWidget {
  final Map<String, dynamic> tickets;

  const _TicketListWidget({required this.tickets});

  @override
  Widget build(BuildContext context) {
    if (tickets.isEmpty) {
      return Text(
        'No tickets available',
        style: TextStyle(color: Colors.white70),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: tickets.entries.map(_buildTicketCard).toList(),
    );
  }

  Widget _buildTicketCard(MapEntry<String, dynamic> entry) {
    final ticketData = entry.value as Map<String, dynamic>;
    final type = entry.key;
    final price = ticketData['price']?.toString() ?? '0';
    final description =
        ticketData['description']?.toString() ?? 'No description available';
    final available = ticketData['available']?.toString() ?? '0';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xFF95E143).withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            '৳$price',
            style: TextStyle(
              color: Color(0xFF95E143),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
