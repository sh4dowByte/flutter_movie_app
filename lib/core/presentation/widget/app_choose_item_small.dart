import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_skeleton.dart';

class AppChooseItemSmall extends StatefulWidget {
  final List<Map<String, dynamic>> item;
  final Function(int)? onChange; // Mengubah agar menerima list of selectedIds
  final List<int> activeIds;
  const AppChooseItemSmall(
      {super.key,
      required this.item,
      this.onChange,
      this.activeIds = const []});

  @override
  State<AppChooseItemSmall> createState() => _AppChooseItemSmallState();

  static Widget loading() {
    return SizedBox(
      height: 46,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Jumlah skeleton placeholder
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AppSkeleton(
              borderRadius: BorderRadius.circular(23),
              width: 120,
            ),
          );
        },
      ),
    );
  }
}

class _AppChooseItemSmallState extends State<AppChooseItemSmall> {
  late List<int> selectedIds;

  @override
  void initState() {
    super.initState();
    selectedIds =
        List.from(widget.activeIds); // Menyalin activeIds ke selectedIds
  }

  void toggleItemById(int id) {
    setState(() {
      if (selectedIds.contains(id)) {
        selectedIds.remove(id); // Hapus ID jika sudah terpilih
      } else {
        selectedIds.add(id); // Tambahkan ID jika belum terpilih
      }

      if (widget.onChange != null) {
        widget.onChange!(id); // Mengirimkan daftar ID yang terpilih ke parent
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 0, // Jarak horizontal antar item
        runSpacing: 10, // Jarak vertikal antar item
        children: widget.item.map((item) {
          final isActive = selectedIds
              .contains(item['id']); // Menentukan apakah item terpilih

          return GestureDetector(
            onTap: () => toggleItemById(item['id']),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(
                  horizontal: 4), // Jarak antar elemen
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: isActive
                      ? const Color(0xFF4E4E4E)
                      : const Color(0xFFE8EAE9).withOpacity(0.08),
                ),
                child: Row(
                  mainAxisSize:
                      MainAxisSize.min, // Menyesuaikan ukuran dengan konten
                  children: [
                    if (item['icon'] != null) ...[
                      Image.asset(
                        'assets/${item['icon']}',
                        width: 20,
                        height: 20,
                        fit: BoxFit
                            .cover, // Menyesuaikan gambar dengan area yang tersedia
                      ),
                    ],
                    if (item['icon'] != null && isActive) ...[
                      const SizedBox(width: 8),
                    ],
                    if (isActive || item['icon'] == null) ...[
                      Text(
                        item['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              isActive ? Colors.white : const Color(0xFF8F8F8F),
                        ),
                      )
                    ],
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
