import 'package:dio/dio.dart';
import 'package:dummy/Data/carrot_remote_datasource.dart';
import 'package:dummy/Data/carrot_repository_impl.dart';
import 'package:dummy/Utils/injection.dart';
import 'package:dummy/domain/get_carrot_transactions.dart';
import 'package:dummy/presentation/Screens/choose_your_tickets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/Screens/rewards_screen.dart';
import 'presentation/bloc/rewards_bloc.dart';
import 'presentation/bloc/rewards_event.dart';
import 'presentation/bloc/carrot_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  final dio = Dio();
  final remoteDataSource = CarrotRemoteDataSourceImpl(dio);
  final repository = CarrotRepositoryImpl(remoteDataSource);
  final getCarrotTransactions = GetCarrotTransactions(repository);

  runApp(MyApp(getCarrotTransactions));
}

class MyApp extends StatelessWidget {
  final GetCarrotTransactions getCarrotTransactions;
  const MyApp(this.getCarrotTransactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// ✅ PROVIDER (Tickets state)
        ChangeNotifierProvider(
          create: (_) => TicketProvider(),
        ),

        /// ✅ BLOCS
        BlocProvider(
          create: (_) => RewardsBloc()..add(LoadRewardsEvent()),
        ),
        BlocProvider(
          create: (_) => CarrotBloc(getCarrotTransactions),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChooseTicketsScreen(),
      ),
    );
  }
}
