import 'dart:convert';
import 'package:dummy/Data/carrot_model.dart';
import 'package:dummy/domain/carrot_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

abstract class CarrotRemoteDataSource {
  Future<List<CarrotModel>> getCarrotTransactions(String userId);
}

class CarrotRemoteDataSourceImpl implements CarrotRemoteDataSource {
  final Dio dio;

  CarrotRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CarrotModel>> getCarrotTransactions(String userId) async {
    final response = await dio.post(
      'https://node.partywitty.com/carrot/carrotTransaction',
      data: {"user_id": userId},
    );

    final List list = response.data['data']['carrot_transaction_history'];

    return list.map((e) => CarrotModel.fromJson(e)).toList();
  }
}
