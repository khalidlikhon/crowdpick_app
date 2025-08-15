import 'package:get/get.dart';

import '../../component/demoData.dart';

class MyTicketController extends GetxController {
  var isComingSoonSelected = true.obs;

  List<Map<String, String>> get filteredTickets {
    return TicketData.allTickets.where((ticket) {
      String status = ticket['status'] ?? 'Upcoming';
      if (isComingSoonSelected.value) {
        return status == 'Upcoming';
      } else {
        return status == 'Completed' || status == 'Cancelled';
      }
    }).toList();
  }

  void selectComingSoon() => isComingSoonSelected.value = true;
  void selectHistory() => isComingSoonSelected.value = false;
}
