import 'package:dummy/Data/carrot_remote_datasource.dart';
import 'package:dummy/domain/carrot_entity.dart';
import 'package:dummy/domain/carrot_repository.dart';
import 'package:flutter/material.dart';

class CarrotRepositoryImpl implements CarrotRepository {
  final CarrotRemoteDataSource remote;

  CarrotRepositoryImpl(this.remote);

  @override
  Future<List<CarrotEntity>> getCarrotTransactions(String userId) async {
    final models = await remote.getCarrotTransactions(userId);

    return models;
  }
}
