import 'package:crowdpick_app/screens/ticketDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/_customWidgets/appCustomBottomNav.dart';
import 'controllers/ticektController.dart';

class myTicketScreen extends StatelessWidget {
  final MyTicketController controller = Get.put(MyTicketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),

            // Page Title
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'My Tickets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // Toggle buttons
            _buildToggleButtons(),

            SizedBox(height: 10),

            // Ticket list
            Expanded(
              child: Obx(() {
                final tickets = controller.filteredTickets;
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemCount: tickets.length,
                  itemBuilder: (context, index) {
                    final ticket = tickets[index]; // <-- store ticket data
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                            MaterialPageRoute(builder: (_)=> ticketDetailsScreen(ticket: tickets[index]),
                            )
                        );
                      },
                      child: _buildTicketCard(tickets[index]),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: appCustomBottomNavBar(currentIndex: 1),
    );
  }

  /// Toggle Button Widget
  Widget _buildToggleButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Obx(() {
        final isComingSoonSelected = controller.isComingSoonSelected.value;
        return Row(
          children: [
            // Coming Soon Button
            Expanded(
              child: ElevatedButton(
                onPressed: controller.selectComingSoon,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isComingSoonSelected
                      ? Color(0xFF95E143)
                      : Color(0xFF212121),
                  foregroundColor:
                  isComingSoonSelected ? Colors.black : Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Coming Soon',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(width: 15),

            // History Button
            Expanded(
              child: ElevatedButton(
                onPressed: controller.selectHistory,
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isComingSoonSelected
                      ? Color(0xFF95E143)
                      : Color(0xFF212121),
                  foregroundColor:
                  !isComingSoonSelected ? Colors.black : Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'History',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  /// Ticket Card Widget
  Widget _buildTicketCard(Map<String, String> ticket) {
    Color statusTextColor;
    switch (ticket['status']) {
      case 'Cancelled':
        statusTextColor = Colors.red.shade700;
        break;
      case 'Completed':
        statusTextColor = Colors.green.shade700;
        break;
      default:
        statusTextColor = Colors.grey;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with status badge
          Stack(
            children: [
              if (ticket['ImageUrl'] != null &&
                  ticket['ImageUrl']!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    ticket['ImageUrl']!,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              if (ticket['status'] != null)
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      ticket['status']!,
                      style: TextStyle(
                        color: statusTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 10),

          // Title
          Text(
            ticket['title'] ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4),

          // Date, time, quantity
          Row(
            children: [
              Text(
                ticket['date'] ?? '',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              SizedBox(width: 8),
              Text(
                'at ${ticket['time'] ?? ''}',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              SizedBox(width: 8),
              Text(
                '*',
                style: TextStyle(
                  color: Color(0xFF95E143),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 4),
              Text(
                '${ticket['quantity']} Tickets',
                style: TextStyle(
                  color: Color(0xFF95E143),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

           SizedBox(height: 4),

          // Location
          Text(
            ticket['location'] ?? '',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),

          SizedBox(height: 8),
          const Divider(color: Colors.white24, thickness: 1),
          SizedBox(height: 6),

          // Booking code
          Text(
            'Booking Code',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4),
          Text(
            ticket['bookingCode'] ?? '',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
