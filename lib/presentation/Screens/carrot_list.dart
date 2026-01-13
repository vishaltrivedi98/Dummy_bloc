import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/carrot_entity.dart';

class CarrotList extends StatelessWidget {
  final List<CarrotEntity> items;
  const CarrotList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Latest Transactions',
              style: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        }

        if (index == 1) {
          return const SizedBox(height: 4);
        }

        final item = items[index - 2];
        return _CarrotRow(item: item);
      },
    );
  }
}

class _CarrotRow extends StatelessWidget {
  final CarrotEntity item;
  const _CarrotRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "at illusion  ·  Sun, 5 Oct",
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/carrot_img.png',
                    width: 24,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item.value,
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w600,
                      color: item.positive ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
