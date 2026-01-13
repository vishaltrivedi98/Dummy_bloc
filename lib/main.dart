// import 'package:dummy/reward_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum RewardTab { carrots, tulips, voucher }

// final rewardTabProvider = StateProvider<RewardTab>((ref) => RewardTab.carrots);

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RewardsScreen(),
//     );
//   }
// }
import 'package:dummy/presentation/Screens/rewards_screen.dart';
import 'package:dummy/presentation/bloc/rewards_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/rewards_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RewardsBloc()..add(LoadRewardsEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RewardScreen(),
      ),
    );
  }
}
