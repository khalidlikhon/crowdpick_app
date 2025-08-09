import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  final String title;
  final String? textContent;
  final List<String>? listContent;
  final bool isExpanded; // true = open, false = closed

  const ExpandableWidget({
    super.key,
    required this.title,
    this.textContent,
    this.listContent,
    this.isExpanded = false,
  });

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.black.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: _expanded, // start open/close based on parameter
          onExpansionChanged: (value) {
            setState(() {
              _expanded = value;
            });
          },
          iconColor: const Color(0xFF95E143),
          collapsedIconColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "Click to view →",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          children: [
            if (widget.textContent != null)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  widget.textContent!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
              ),
            if (widget.listContent != null)
              ...widget.listContent!.map((text) => ListTile(
                title: Text(
                  text,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              )),
          ],
        ),
      ),
    );
  }
}




//TODO: search Bar -
Container appSearchBar (){
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search here...',
          hintStyle: TextStyle(color: Colors.grey.shade500),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.grey.shade500),
        ),
      )
  );
}
