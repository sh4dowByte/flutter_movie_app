import 'package:flutter/material.dart';

class AppSelectDate extends StatefulWidget {
  final Function(String)? onChange;
  final List<String> item;
  final String? activeId; // Parameter untuk nilai aktif awal
  const AppSelectDate({
    super.key,
    required this.item,
    this.onChange,
    this.activeId, // Tambahkan activeId sebagai parameter opsional
  });

  @override
  State<AppSelectDate> createState() => _AppSelectDateState();
}

class _AppSelectDateState extends State<AppSelectDate> {
  late String activeIds;

  @override
  void initState() {
    super.initState();
    // Tetapkan activeId awal dari parameter widget.activeId
    activeIds = widget.activeId ?? '';
  }

  void toggleItemById(String id) {
    setState(() {
      activeIds = id;
      if (widget.onChange != null) {
        widget.onChange!(activeIds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      width: 60,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.item.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = widget.item[index];
          final isActive = activeIds == item; // Status aktif

          // Parse string ke DateTime
          DateTime date = DateTime.parse(item);
          // Array nama hari dalam bahasa Inggris
          List<String> days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

          final day = date.day;
          final dayName = days[date.weekday - 1];

          EdgeInsets margin = EdgeInsets.only(
            left: index == 0 ? 14 : 0,
            right: index == widget.item.length - 1 ? 14 : 0,
          );

          return GestureDetector(
            onTap: () => toggleItemById(item),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: margin,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: isActive
                      ? const Color(0xFF4E4E4E)
                      : const Color(0xFFE8EAE9).withOpacity(0.08),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dayName.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            isActive ? Colors.white : const Color(0xFF8F8F8F),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      day.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            isActive ? Colors.white : const Color(0xFF8F8F8F),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
