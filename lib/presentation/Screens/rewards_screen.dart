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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      _headerImage(state.selectedTab),
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 200,
                    ),
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
        return CarrotList(items: state.carrots);
      case RewardTab.tulips:
        return TulipList(items: state.tulips);
      case RewardTab.voucher:
        return VoucherList(items: state.vouchers);
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
