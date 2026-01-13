import 'package:dummy/domain/voucher_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VoucherList extends StatelessWidget {
  final List<VoucherEntity> items;
  const VoucherList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _VoucherCard(item: item);
      },
    );
  }
}

class _VoucherCard extends StatelessWidget {
  final VoucherEntity item;
  const _VoucherCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffEFEFF4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          item.title,
                          style:
                              GoogleFonts.lexend(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.info_outline,
                            size: 14, color: Colors.black45),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.value,
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff4A5AEF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 42,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4A5AEF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Text(
                    'Claim',
                    style:
                        GoogleFonts.lexend(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: GoogleFonts.lexend(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            'Coupon Details  >',
            style: GoogleFonts.lexend(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: const Color(0xff4A5AEF),
            ),
          ),
        ],
      ),
    );
  }
}
