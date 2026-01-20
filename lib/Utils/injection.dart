// Data source
import 'package:dio/dio.dart';
import 'package:dummy/Data/carrot_remote_datasource.dart';
import 'package:dummy/Data/carrot_repository_impl.dart';
import 'package:dummy/domain/get_carrot_transactions.dart';

final dio = Dio();
final carrotRemoteDataSource = CarrotRemoteDataSourceImpl(dio);

// Repository
final carrotRepository = CarrotRepositoryImpl(carrotRemoteDataSource);

// Use case  ✅ THIS IS getCarrotTransactions
final getCarrotTransactions = GetCarrotTransactions(carrotRepository);
