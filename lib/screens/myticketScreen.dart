import 'package:flutter/material.dart';
import '../component/_customWidgets/appCustomBottomNav.dart';

class myticketScreen extends StatefulWidget {
  const myticketScreen({super.key});

  @override
  State<myticketScreen> createState() => _myticketScreenState();
}

class _myticketScreenState extends State<myticketScreen> {
  bool isComingSoonSelected = true;

  @override
  Widget build(BuildContext context) {
    // Filter tickets based on toggle selection
    List<Map<String, String>> filteredTickets = TicketData.allTickets.where((ticket) {
      String status = ticket['status'] ?? 'Upcoming';
      if (isComingSoonSelected) {
        return status == 'Upcoming';
      } else {
        return status == 'Completed' || status == 'Cancelled';
      }
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),

            // Page Title
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
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

            const SizedBox(height: 10),

            // Ticket list
            Expanded(
              child: ListView.builder(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: filteredTickets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // On ticket tap (you can navigate to ticket details here)
                    },
                    child: _buildTicketCard(filteredTickets[index]),
                  );
                },
              ),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          // Coming Soon Button
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() => isComingSoonSelected = true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isComingSoonSelected
                    ? const Color(0xFF95E143)
                    : const Color(0xFF212121),
                foregroundColor:
                isComingSoonSelected ? Colors.black : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Coming Soon',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(width: 15),

          // History Button
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() => isComingSoonSelected = false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: !isComingSoonSelected
                    ? const Color(0xFF95E143)
                    : const Color(0xFF212121),
                foregroundColor:
                !isComingSoonSelected ? Colors.black : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'History',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
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
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1F1F),
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

          const SizedBox(height: 10),

          // Title
          Text(
            ticket['title'] ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          // Date, time, quantity
          Row(
            children: [
              Text(
                ticket['date'] ?? '',
                style:
                const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(width: 8),
              Text(
                'at ${ticket['time'] ?? ''}',
                style:
                const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(width: 8),
              const Text(
                '*',
                style: TextStyle(
                    color: Color(0xFF95E143),
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              const SizedBox(width: 4),
              Text(
                '${ticket['quantity']} Tickets',
                style: const TextStyle(
                    color: Color(0xFF95E143),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 4),

          // Location
          Text(
            ticket['location'] ?? '',
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),

          const SizedBox(height: 8),
          const Divider(color: Colors.white24, thickness: 1),
          const SizedBox(height: 6),

          // Booking code
          const Text('Booking Code',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(ticket['bookingCode'] ?? '',
              style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

/// Separate Ticket Data Class
class TicketData {
  static final List<Map<String, String>> allTickets = [
    {
      'ImageUrl':
      'https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2?auto=format&fit=crop&w=800&q=60',
      'title': 'Music Vibe Festival',
      'date': 'August 15, 2025',
      'time': '08:00 PM',
      'location': 'Hatirjheel Concert Ground, Dhaka',
      'type': 'Standard',
      'quantity': '2',
      'totalPrice': '800',
      'bookingCode': 'MVF-2025-3302',
      'purchaseDate': 'July 30, 2025',
      'status': 'Upcoming',
    },
    {
      'ImageUrl':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlcaQ7QAgs4AiAo3D8xslMoaxBOUWCVPEghA&s',
      'title': 'International Art Expo',
      'date': 'July 12, 2025',
      'time': '02:00 PM',
      'location': 'Bangabandhu International Conference Center, Dhaka',
      'type': 'Standard',
      'quantity': '2',
      'totalPrice': '1000',
      'bookingCode': 'IAE-2025-4521',
      'purchaseDate': 'March 28, 2025',
      'status': 'Completed',
    },
    {
      'ImageUrl':
      'https://images.unsplash.com/photo-1549923746-c502d488b3ea?auto=format&fit=crop&w=800&q=60',
      'title': 'Food & Flavors Fair',
      'date': 'October 10, 2025',
      'time': '11:00 AM',
      'location': 'Bangabandhu International Conference Center, Dhaka',
      'type': 'Standard',
      'quantity': '3',
      'totalPrice': '900',
      'bookingCode': 'FFF-2025-2278',
      'purchaseDate': 'September 1, 2025',
      'status': 'Upcoming',
    },
    {
      'ImageUrl':
      'https://images.unsplash.com/photo-1478720568477-152d9b164e26?auto=format&fit=crop&w=800&q=60',
      'title': 'Retro Film Night',
      'date': 'June 1, 2025',
      'time': '07:00 PM',
      'location': 'Shilpakala Academy, Dhaka',
      'type': 'VIP',
      'quantity': '1',
      'totalPrice': '500',
      'bookingCode': 'RFN-2025-9912',
      'purchaseDate': 'May 18, 2025',
      'status': 'Cancelled',
    },
    {
      'ImageUrl':
      'https://images.unsplash.com/photo-1519677100203-a0e668c92439?auto=format&fit=crop&w=800&q=60',
      'title': 'Startup Innovation Summit',
      'date': 'May 5, 2025',
      'time': '09:00 AM',
      'location': 'International Convention City Bashundhara, Dhaka',
      'type': 'Premium',
      'quantity': '1',
      'totalPrice': '1500',
      'bookingCode': 'SIS-2025-5531',
      'purchaseDate': 'April 20, 2025',
      'status': 'Completed',
    },
  ];
}
