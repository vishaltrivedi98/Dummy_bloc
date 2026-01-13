import 'package:dummy/Data/reward_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rewards_event.dart';
import 'rewards_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  final RewardRepository repository = RewardRepository();

  RewardsBloc()
      : super(
          RewardsState(
            selectedTab: RewardTab.carrots,
            carrots: [],
            tulips: [],
            vouchers: [],
          ),
        ) {
    on<LoadRewardsEvent>((event, emit) {
      emit(state.copyWith(
        carrots: repository.getCarrots(),
        tulips: repository.getTulips(),
        vouchers: repository.getVouchers(),
      ));
    });

    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(selectedTab: event.tab));
    });
  }
}
