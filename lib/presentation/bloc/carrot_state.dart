import 'package:dummy/domain/carrot_entity.dart';

abstract class CarrotState {}

class CarrotInitial extends CarrotState {}

class CarrotLoading extends CarrotState {}

class CarrotLoaded extends CarrotState {
  final List<CarrotEntity> items;
  CarrotLoaded(this.items);
}

class CarrotError extends CarrotState {
  final String message;
  CarrotError(this.message);
}
