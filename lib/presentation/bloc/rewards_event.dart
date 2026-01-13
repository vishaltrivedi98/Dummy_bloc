abstract class RewardsEvent {}

class LoadRewardsEvent extends RewardsEvent {}

class ChangeTabEvent extends RewardsEvent {
  final RewardTab tab;
  ChangeTabEvent(this.tab);
}

enum RewardTab { carrots, tulips, voucher }
