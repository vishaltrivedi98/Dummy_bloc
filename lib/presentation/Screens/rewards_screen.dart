import 'package:dummy/presentation/Screens/termand_condistion_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/rewards_bloc.dart';
import '../bloc/rewards_event.dart';
import '../bloc/rewards_state.dart';

import 'carrot_list.dart';
import 'tulip_list.dart';
import 'vouchar_list.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4E4E4),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TermsAndConditionsScreen(),
            ),
          );
        },
        child: Container(
          height: 80,
          color: const Color(0xffE4E4E4),
          child: Center(
            child: Text(
              "Terms & Conditions",
              style: GoogleFonts.lexend(
                decoration: TextDecoration.underline,
                color: const Color(0xff7464E4),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<RewardsBloc, RewardsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        'Back',
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: RewardHeader(tab: state.selectedTab),

                    // Image.asset(
                    //   _headerImage(state.selectedTab),
                    //   fit: BoxFit.fill,
                    //   width: double.infinity,
                    //   height: 200,
                    // ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: RewardTab.values.map((tab) {
                      final selected = tab == state.selectedTab;
                      return GestureDetector(
                        onTap: () {
                          context.read<RewardsBloc>().add(ChangeTabEvent(tab));
                        },
                        child: Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xff4A5AEF)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              _tabText(tab),
                              style: GoogleFonts.lexend(
                                color: selected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(child: _buildTab(state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTab(RewardsState state) {
    switch (state.selectedTab) {
      case RewardTab.carrots:
        return const CarrotScreen(); // ✅ API + Bloc
      case RewardTab.tulips:
        return TulipList(items: state.tulips); // ✅ STATIC
      case RewardTab.voucher:
        return VoucherList(items: state.vouchers); // ✅ STATIC
    }
  }

  String _tabText(RewardTab tab) {
    switch (tab) {
      case RewardTab.carrots:
        return 'Carrots';
      case RewardTab.tulips:
        return 'Tulips';
      case RewardTab.voucher:
        return 'Voucher';
    }
  }

  String _headerImage(RewardTab tab) {
    switch (tab) {
      case RewardTab.carrots:
        return 'assets/carrots_header.png';
      case RewardTab.tulips:
        return 'assets/tulips_header.png';
      case RewardTab.voucher:
        return 'assets/vouchers_header.png';
    }
  }
}

class RewardHeader extends StatelessWidget {
  final RewardTab tab;

  const RewardHeader({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: _gradient(tab),
          ),
          child: _content(tab),
        ),
      ),
    );
  }

  // 🎨 GRADIENTS
  LinearGradient _gradient(RewardTab tab) {
    switch (tab) {
      case RewardTab.carrots:
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFFFDA58),
            Color(0xFFF7EF8A),
            Color(0xFFFEC537),
            Color(0xFFEDC968),
          ],
        );

      case RewardTab.tulips:
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFF56158),
            Color(0xFFFB8D66),
          ],
        );

      case RewardTab.voucher:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFC67AFF),
            Color(0xFFFD7AA9),
            Color(0xFFFFB173),
          ],
        );
    }
  }

  // 🧩 CONTENT
  Widget _content(RewardTab tab) {
    switch (tab) {
      case RewardTab.carrots:
        return _carrotContent();

      case RewardTab.tulips:
        return _tulipContent();

      case RewardTab.voucher:
        return _voucherContent();
    }
  }
}

Widget _carrotContent() {
  return Padding(
    padding: const EdgeInsets.only(top: 22, bottom: 17, right: 35, left: 22),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              "Carrots Available",
              style: GoogleFonts.lexend(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff070707)),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                Image.asset("assets/carrot_img.png"),
                const SizedBox(width: 2),
                Text(
                  "300",
                  style: GoogleFonts.lexend(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Get Rs from XY Carrots",
              style: GoogleFonts.lexend(
                  fontSize: 14,
                  color: Color(0xffB16835),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              "• Minimum 3000 XY carrots are required \n  to redeem coins",
              style: GoogleFonts.lexend(
                  fontSize: 11, color: Colors.red, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Image.asset(
          'assets/carrotts.png', // bunny image
          height: 165,
          width: 115,
        ),
      ],
    ),
  );
}

Widget _tulipContent() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _ActionIcon(title: "Watch\nTeaser", icon: Icons.play_circle),
        _ActionIcon(title: "Earn\nTulips", icon: Icons.local_florist),
        _ActionIcon(title: "Redeem\nAt Venue", icon: Icons.store),
      ],
    ),
  );
}

class _ActionIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ActionIcon({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.white.withOpacity(0.2),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.lexend(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

Widget _voucherContent() {
  return Padding(
    padding: const EdgeInsets.only(top: 16, right: 30, left: 30),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vouchers Available",
                  style: GoogleFonts.lexend(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "12",
                  style: GoogleFonts.lexend(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Get discounts using vouchers",
                  style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                // const SizedBox(height: 12),
              ],
            ),
            Image.asset(
              'assets/voucchaar.png',
              height: 120,
              width: 140,
              fit: BoxFit.fill,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "1 Voucher ₹200 OFF",
          style: GoogleFonts.lexend(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),

        // Image.asset(
        //   'assets/voucchaar.png',
        //   height: 100,
        // ),
      ],
    ),
  );
}
