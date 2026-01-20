import 'package:dummy/presentation/Screens/choose_your_tickets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final pageCount = (promoList.length / 2).ceil();
    return Scaffold(
      backgroundColor: const Color(0xffE4E4E4),
      appBar: AppBar(
        backgroundColor: const Color(0xffE4E4E4),
        elevation: 0,
        title: Row(
          children: [
            Image.asset("assets/Vector.png", height: 28), // optional
            const SizedBox(width: 6),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      "Vasant Kunj",
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                Text(
                  "asant Kunj comes under ..",
                  style: GoogleFonts.lexend(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )
              ],
            ),
          ],
        ),
        actions: [
          Container(
              height: 40,
              width: 40,
              color: Colors.grey[200],
              child: Center(child: Icon(Icons.search, color: Colors.black))),
          SizedBox(width: 12),
          Container(
              height: 40,
              width: 40,
              color: Colors.grey[200],
              child: Icon(Icons.notifications_none, color: Colors.black)),
          SizedBox(width: 12),
          Container(
              height: 40,
              width: 40,
              color: Colors.grey[200],
              child: Icon(Icons.add, color: Colors.black)),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // padding: const EdgeInsets.all(16),
          children: [
            /// THANK YOU CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Image.asset('assets/FRAME.png'),
                  // Container(
                  //   height: 40,
                  //   width: 40,
                  //   decoration: const BoxDecoration(
                  //     color: Color(0xffE8F5E9),
                  //     shape: BoxShape.circle,
                  //   ),
                  //   child:
                  //       const Icon(Icons.check, color: Colors.green, size: 24),
                  // ),

                  const SizedBox(height: 12),
                  Text(
                    "Thank you",
                    style: GoogleFonts.lexend(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Thank you for booking with\nPartyWitty!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Your pass is confirmed. Now, let's make your\nnight even better.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            /// EVENT CARD
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// IMAGE
                  HeaderSection(),
                  EventInfo(),
                ],
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              height: 120,
              child: PageView.builder(
                itemCount: pageCount,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                itemBuilder: (context, pageIndex) {
                  final firstIndex = pageIndex * 2;
                  final secondIndex = firstIndex + 1;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(child: _PromoCard(promoList[firstIndex])),
                        const SizedBox(width: 10),
                        if (secondIndex < promoList.length)
                          Expanded(child: _PromoCard(promoList[secondIndex]))
                        else
                          const Expanded(child: SizedBox()),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            /// DOT INDICATOR
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pageCount,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: currentPage == index ? 18 : 6,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? const Color(0xff6B63E6)
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            /// BOTTOM ACTIONS
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     _bottomCard("Use Tulips To Make Payment", "Earn 25 Tulips"),
            //     _bottomCard("Upto 50% Off", "On Food & Beverages Bill"),
            //   ],
            // ),

            const SizedBox(height: 12),

            Row(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                Icon(
                  Icons.share,
                ),
                const SizedBox(width: 15),
                Text(
                  "Share with a Friends",
                  style: GoogleFonts.lexend(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 15),
                Icon(
                  Icons.copy,
                ),
                const SizedBox(width: 15),
                Text(
                  "Posted on a Feed",
                  style: GoogleFonts.lexend(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// SMALL ICON
class _CircleIcon extends StatelessWidget {
  final IconData icon;
  const _CircleIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.white,
      child: Icon(icon, size: 18, color: Colors.black),
    );
  }
}

/// BOTTOM CARDS
Widget _bottomCard(String title, String sub) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title,
              textAlign: TextAlign.center,
              style: GoogleFonts.lexend(fontSize: 12)),
          const SizedBox(height: 4),
          Text(sub,
              style: GoogleFonts.lexend(fontSize: 11, color: Colors.grey)),
        ],
      ),
    ),
  );
}

class _PromoCard extends StatelessWidget {
  final PromoCardModel item;
  const _PromoCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: item.gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Stack(
          children: [
            /// TEXT PART
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.lexend(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: GoogleFonts.lexend(fontSize: 12),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item.buttonText,
                      style: GoogleFonts.lexend(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),

            /// IMAGE
            Positioned(
              right: 8,
              bottom: 8,
              child: Image.asset(
                item.image,
                height: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoCardModel {
  final String title;
  final String subtitle;
  final String buttonText;
  final String image;
  final List<Color> gradient;

  PromoCardModel({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.image,
    required this.gradient,
  });
}

final promoList = [
  PromoCardModel(
    title: "Use Tulips To Make Payment",
    subtitle: "Earn 25 Tulips",
    buttonText: "Watch & Earn",
    image: "assets/glass.png", // 🍸 glass image
    gradient: [Color(0xffF7F5C7), Color(0xffE6F2A2)],
  ),
  PromoCardModel(
    title: "Upto 50% Off",
    subtitle: "On Food & Beverages Bill",
    buttonText: "Pre-Booking",
    image: "assets/Group.png", // 👨‍👩‍👧 people image
    gradient: [Color(0xffFFF1C1), Color(0xffFFE6A6)],
  ),
  PromoCardModel(
    title: "Upto 50% Off",
    subtitle: "On Food & Beverages Bill",
    buttonText: "Pre-Booking",
    image: "assets/Group.png", // 👨‍👩‍👧 people image
    gradient: [Color(0xffFFF1C1), Color(0xffFFE6A6)],
  ),
  PromoCardModel(
    title: "Upto 50% Off",
    subtitle: "On Food & Beverages Bill",
    buttonText: "Pre-Booking",
    image: "assets/Group.png", // 👨‍👩‍👧 people image
    gradient: [Color(0xffFFF1C1), Color(0xffFFE6A6)],
  ),
];
