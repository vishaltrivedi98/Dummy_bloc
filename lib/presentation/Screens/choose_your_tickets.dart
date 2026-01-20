import 'dart:ui';

import 'package:dummy/presentation/Screens/order_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseTicketsScreen extends StatelessWidget {
  const ChooseTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TicketProvider>();
    final tickets = provider.tickets;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${provider.totalTickets} Tickets • Only ₹${provider.totalAmount}",
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              // Text(
              //   "3 Tickets • Only ₹1800",
              //   style: GoogleFonts.lexend(
              //     color: Colors.black,
              //     fontWeight: FontWeight.w500,
              //     fontSize: 14,
              //   ),
              // ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderSummaryScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 30,
                  width: 170,
                  decoration: BoxDecoration(color: Color(0XFF1A00D2)),
                  child: Center(
                      child: Text(
                    'Procced to checkout',
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xffE4E4E4),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        backgroundColor: const Color(0xffE4E4E4),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "Choose Your Tickets",
          style: GoogleFonts.lexend(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: provider.tickets.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) return const HeaderSection();
          if (index == 1) return const EventInfo();

          final ticket = provider.tickets[index - 2];
          return TicketCard(ticket: ticket);
        },
      ),
    );
  }
}

class EventInfo extends StatelessWidget {
  const EventInfo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sitar Magic By Rishabh Rikhiram Sharma",
              style: GoogleFonts.lexend(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset('assets/Ellips.png'),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text(
                    "F-Bar",
                    style: GoogleFonts.lexend(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                SizedBox(width: 6),
                const Icon(Icons.star, color: Colors.amber, size: 14),
                const SizedBox(width: 2),
                Text("4.1",
                    style: GoogleFonts.lexend(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(width: 6),
                Text("Review (03)",
                    style: GoogleFonts.lexend(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 14),
                const SizedBox(width: 4),
                Text(
                  "DLP Phase 3, Gurugram",
                  style: GoogleFonts.lexend(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xffF1EDFF),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "1.2 Kms",
                    style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xff6B63E6)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.calendar_today, size: 14),
                        const SizedBox(width: 6),
                        Text("Date",
                            style: GoogleFonts.lexend(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff4F4F4F)))
                      ],
                    ),
                    const SizedBox(width: 6),
                    Text("April 14, 2025 Mon",
                        style: GoogleFonts.lexend(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.access_time, size: 14),
                        const SizedBox(width: 6),
                        Text("Time",
                            style: GoogleFonts.lexend(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff4F4F4F)))
                      ],
                    ),
                    const SizedBox(width: 6),
                    Text("10:00 PM Onwards",
                        style: GoogleFonts.lexend(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 260,
            width: double.infinity,
            child: Image.asset(
              'assets/party.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Blur overlay
          // Positioned.fill(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 12, sigmaY: 11),
          //     child: Container(color: Colors.black.withOpacity(0.2)),
          //   ),
          // ),

          // // Main Poster
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 20),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(10),
          //       child: Image.asset(
          //         'assets/party.jpg',
          //         height: 200,
          //         width: 140,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),

          // Icons
          Positioned(
            right: 16,
            top: 16,
            child: Row(
              children: const [
                _CircleIcon(icon: Icons.favorite_border),
                SizedBox(width: 10),
                _CircleIcon(icon: Icons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final IconData icon;
  const _CircleIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 18,
      child: Icon(icon, size: 18, color: Colors.black),
    );
  }
}

// class TicketModel {
//   final String title;
//   final String description;
//   final int price;

//   TicketModel({
//     required this.title,
//     required this.description,
//     required this.price,
//   });
// }

// final List<TicketModel> ticketList = [
//   TicketModel(
//     title: "General Pass (Domestic Liquor & Food) || Single",
//     description:
//         "includes: Unlimited starters, main course & premium domestic liquor. (Valid for 3 hours from the entry time)",
//     price: 800,
//   ),
//   TicketModel(
//     title: "General Pass (Domestic Liquor & Food) || Single",
//     description:
//         "includes: Unlimited starters, main course & premium domestic liquor. (Valid for 3 hours from the entry time)",
//     price: 600,
//   ),
//   TicketModel(
//     title: "General Pass (Domestic Liquor & Food) || Single",
//     description:
//         "includes: Unlimited starters, main course & premium domestic liquor. (Valid for 3 hours from the entry time)",
//     price: 400,
//   ),
// ];

class TicketCard extends StatelessWidget {
  final TicketModel ticket;
  TicketCard({super.key, required this.ticket});
  bool expanded = false;
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TicketProvider>();

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Text(
            ticket.name,
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 6),

          /// DESCRIPTION
          Text(
            "includes: Unlimited starters, main course & premium domestic liquor.",
            maxLines: ticket.expanded ? null : 2,
            overflow:
                ticket.expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          ),

          /// VIEW MORE
          GestureDetector(
            onTap: () => provider.toggleExpand(ticket),
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                expanded ? "View Less" : "View More",
                style: GoogleFonts.lexend(
                  fontSize: 12,
                  color: const Color(0xff6B63E6),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// QUANTITY ROW
          Row(
            children: [
              _QtyButton(
                icon: Icons.remove,
                onTap: () => provider.decrement(ticket),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                ticket.quantity.toString().padLeft(2, '0'),
                style: GoogleFonts.lexend(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              _QtyButton(
                icon: Icons.add,
                onTap: () => provider.increment(ticket),
              ),
              // const Spacer(),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quantity",
                    style: GoogleFonts.lexend(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "₹${ticket.price}/ person",
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: const Color(0xffEFEFF4),
        child: Icon(icon, size: 16, color: Colors.black),
      ),
    );
  }
}

class TicketProvider extends ChangeNotifier {
  List<TicketModel> tickets = [
    TicketModel(
        id: "1", name: "General Pass (Domestic Liquor & Food)", price: 800),
    TicketModel(
        id: "2", name: "General Pass (Domestic Liquor & Food)", price: 600),
    TicketModel(
        id: "3", name: "General Pass (Domestic Liquor & Food)", price: 400),
  ];

  void increment(TicketModel ticket) {
    ticket.quantity++;
    notifyListeners();
  }

  void decrement(TicketModel ticket) {
    if (ticket.quantity > 0) {
      ticket.quantity--;
      notifyListeners();
    }
  }

  void toggleExpand(TicketModel ticket) {
    ticket.expanded = !ticket.expanded;
    notifyListeners();
  }

  int get totalTickets => tickets.fold(0, (sum, t) => sum + t.quantity);

  int get totalAmount =>
      tickets.fold(0, (sum, t) => sum + (t.quantity * t.price));

  List<TicketModel> get selectedTickets =>
      tickets.where((t) => t.quantity > 0).toList();
}

class TicketModel {
  final String id;
  final String name;
  final int price;
  int quantity;
  bool expanded;

  TicketModel({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 0,
    this.expanded = false,
  });
}
