import 'dart:ffi';

import 'package:dummy/presentation/Screens/choose_your_tickets.dart';
import 'package:dummy/presentation/Screens/thank_you_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TicketProvider>();

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 70,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 90,
                  decoration: BoxDecoration(color: Color(0xff7464E4)),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ThankYouScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 45,
                    width: 600,
                    decoration: BoxDecoration(color: Color(0xff7464E4)),
                    child: Center(
                        child: Text(
                      "₹${provider.totalAmount - 100 - 50 + 75} Pay Now",
                      style: GoogleFonts.lexend(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffE4E4E4),
      appBar: AppBar(
        backgroundColor: const Color(0xffE4E4E4),
        title:
            const Text("Order Summary", style: TextStyle(color: Colors.black)),
        leading: const BackButton(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          HeaderSection(),
          EventInfo(),
          SizedBox(
            height: 20,
          ),
          ...provider.selectedTickets.map((t) => Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 85,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(
                      top: 13, bottom: 13, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${t.name}",
                          style: GoogleFonts.lexend(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${t.quantity} Tickets",
                                style: GoogleFonts.lexend(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            Text("₹${t.price * t.quantity}",
                                style: GoogleFonts.lexend(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 34,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color(0xff1A00D2),
                  ),
                  child: Center(
                    child: Text(
                      "Add More Tickets",
                      style:
                          GoogleFonts.lexend(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(14),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// BOOKING AMOUNT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Booking Amount",
                          style: GoogleFonts.lexend(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("₹ 600",
                              style: GoogleFonts.lexend(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff7464E4))),
                          Text("₹ Balance Amount ${provider.totalAmount - 600}",
                              style: GoogleFonts.lexend(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff7464E4))),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// GRADIENT CTA
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [Color(0xff00C6FF), Color(0xff7BFFB0)],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Book Now - Pay Later!!!",
                        style: GoogleFonts.lexend(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// CARROT BALANCE BOX
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Available Carets balance : 🥕 500",
                          style: GoogleFonts.lexend(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),

                        const SizedBox(height: 8),

                        /// DASHED DIVIDER
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Row(
                              children: List.generate(
                                (constraints.maxWidth / 6).floor(),
                                (index) => Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    height: 1,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 10),

                        /// CHECKBOX ROW
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xffE6E6E6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pay Using Carrot Balance",
                                    style: GoogleFonts.lexend(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                Text("Usable Carets  🥕 50",
                                    style: GoogleFonts.lexend(
                                        fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// SAVINGS BANNER
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [Color(0xff00C6FF), Color(0xff7BFFB0)],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Great Choice! ₹150 Saved Instantly on This Booking!",
                        style: GoogleFonts.lexend(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// COUPON ROW
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Coupons",
                          style: GoogleFonts.lexend(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 700,
                            height: 54,
                            // width: double.infinity,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("View Coupon",
                                      style: GoogleFonts.lexend(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 38,
                                    width: 130,
                                    // padding: const EdgeInsets.symmetric(
                                    //     horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff6B63E6),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Apply Coupon",
                                        style: GoogleFonts.lexend(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// TOTALS
                  _amountRow(
                      "Booking Amount ( Advance )", provider.totalAmount),
                  _amountRow("Platform & Other Charges", 75),
                  _amountRow("Grand Total", provider.totalAmount + 75),
                  _amountRow("Used Carrots", -50, green: true),
                  _amountRow("Coupon Discount", -100, green: true),

                  const Divider(),

                  _amountRow(
                    "Amount Payable",
                    provider.totalAmount - 100 - 50 + 75,
                    bold: true,
                  ),
                ],
              ),
            ),
          ),

          // Container(
          //   padding: const EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Column(
          //     children: [
          //       _priceRow("Booking Amount", provider.totalAmount),
          //       _priceRow("Coupon Discount", -100),
          //       const Divider(),
          //       _priceRow("Amount Payable", provider.totalAmount - 100,
          //           bold: true),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: const Color(0xff1A00D2),
          //     padding: const EdgeInsets.all(14),
          //   ),
          //   onPressed: () {},
          //   child: Text("₹${provider.totalAmount - 100 - 50 + 75} Pay Now"),
          // )
        ],
      ),
    );
  }

  Widget _amountRow(String title, int amount,
      {bool bold = false, bool green = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.lexend(
                  fontSize: 13,
                  fontWeight: bold ? FontWeight.w600 : FontWeight.w400)),
          Text(
            "₹${amount.toString()}",
            style: GoogleFonts.lexend(
              fontSize: 13,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
              color: green ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String title, int amount, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontWeight: bold ? FontWeight.bold : null)),
        Text("₹$amount",
            style: TextStyle(fontWeight: bold ? FontWeight.bold : null)),
      ],
    );
  }
}
