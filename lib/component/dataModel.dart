import 'package:flutter/foundation.dart';
import 'demoData.dart';

class EventData {
  final String eventTitle;
  final String eventLocation;
  final String eventDate;
  final String eventTime;
  final String organizerName;
  final String image;
  final String purchaseDeadline;
  final String eventSummary;
  final String eventPolicy;
  final Map<String, Map<String, dynamic>> tickets;

  EventData({
    required this.eventTitle,
    required this.eventLocation,
    required this.eventDate,
    required this.eventTime,
    required this.organizerName,
    required this.image,
    required this.purchaseDeadline,
    required this.eventSummary,
    required this.eventPolicy,
    required this.tickets,
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      image: json['image'] ?? '',
      eventTitle: json['eventTitle'] ?? '',
      eventLocation: json['eventLocation'] ?? '',
      eventDate: json['eventDate'] ?? '',
      eventTime: json['eventTime'] ?? '',
      organizerName: json['organizerName'] ?? '',
      eventSummary: json['eventSummary'] ?? '',
      eventPolicy: json['eventPolicy'] ?? '',
      purchaseDeadline: json['purchaseDeadline'] ?? '',
      tickets: _parseTickets(json['tickets']),
    );
  }

  static Map<String, Map<String, dynamic>> _parseTickets(dynamic ticketsJson) {
    final Map<String, Map<String, dynamic>> result = {};

    if (ticketsJson is Map) {
      ticketsJson.forEach((key, value) {
        if (value is Map) {
          // Preserve original data without adding defaults
          result[key.toString()] = Map<String, dynamic>.from(value);
        }
      });
    }

    return result;
  }

  // Convert back to JSON if needed
  Map<String, dynamic> toJson() => {
    'eventTitle': eventTitle,
    'eventLocation': eventLocation,
    'eventDate': eventDate,
    'eventTime': eventTime,
    'organizerName': organizerName,
    'image': image,
    'purchaseDeadline': purchaseDeadline,
    'eventSummary': eventSummary,
    'eventPolicy': eventPolicy,
    'tickets': tickets,
  };

  // Helper getters
  String get firstTicketType => tickets.keys.first;
  String get firstTicketDescription => tickets.values.first['description'] ?? '';
  int get totalAvailableTickets => tickets.values.fold(0, (sum, ticket) => sum + (ticket['available'] as int));
}


// Mapping into EventData list
final List<EventData> eventDataList = eventsList.map((e) => EventData.fromJson(e)).toList();

