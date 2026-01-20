import 'package:dummy/domain/tulip_entity.dart';
import 'package:dummy/presentation/Screens/tulip_history.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TulipList extends StatelessWidget {
  final List<TulipEntity> items;
  const TulipList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _TulipCard(item: items[index]);
      },
    );
  }
}

class _TulipCard extends StatelessWidget {
  final TulipEntity item;
  const _TulipCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final bool isGreen = item.green;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isGreen ? const Color(0xffE2F0D9) : const Color(0xffEFEFF4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGE
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/Image.png',
                    width: 38,
                    height: 38,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),

                // CONTENT
                Container(
                  width: 680,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            item.title,
                            style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xff070707)),
                          ),
                          Text(
                            item.location,
                            style: GoogleFonts.lexend(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),

                          // TITLE + HISTORY

                          const SizedBox(height: 2),

                          // LOCATION

                          const SizedBox(height: 6),

                          // EARNED + BALANCE
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           'Earned ${item.earned} Tulips',
                          //           style: GoogleFonts.lexend(
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //         const SizedBox(height: 2),
                          //         Text(
                          //           item.time,
                          //           style: GoogleFonts.lexend(
                          //             fontSize: 11,
                          //             color: Colors.black54,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.end,
                          //       children: [
                          //         Text(
                          //           '${item.balance} Tulips',
                          //           style: GoogleFonts.lexend(
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          //         ),
                          //         const SizedBox(height: 2),
                          //         const Text(
                          //           'Balance',
                          //           style: TextStyle(
                          //             fontSize: 11,
                          //             color: Colors.black54,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const TulipsHistorySheet(),
                          );
                        },
                        child: Image.asset(
                          "assets/history.png",
                          height: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earned ${item.earned} Tulips',
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.time,
                      style: GoogleFonts.lexend(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${item.balance} Tulips',
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // ACTION BAR
            SizedBox(
              height: 15,
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                    isGreen ? const Color(0xff38C757) : const Color(0xff6B63E6),
              ),
              alignment: Alignment.center,
              child: Text(
                item.action,
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
