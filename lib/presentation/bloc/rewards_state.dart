import 'package:dummy/domain/carrot_entity.dart';
import 'package:dummy/domain/tulip_entity.dart';
import 'package:dummy/domain/voucher_entity.dart';
import 'package:dummy/presentation/bloc/rewards_event.dart';

class RewardsState {
  final RewardTab selectedTab;
  final List<CarrotEntity> carrots;
  final List<TulipEntity> tulips;
  final List<VoucherEntity> vouchers;

  RewardsState({
    required this.selectedTab,
    required this.carrots,
    required this.tulips,
    required this.vouchers,
  });

  RewardsState copyWith({
    RewardTab? selectedTab,
    List<CarrotEntity>? carrots,
    List<TulipEntity>? tulips,
    List<VoucherEntity>? vouchers,
  }) {
    return RewardsState(
      selectedTab: selectedTab ?? this.selectedTab,
      carrots: carrots ?? this.carrots,
      tulips: tulips ?? this.tulips,
      vouchers: vouchers ?? this.vouchers,
    );
  }
}
