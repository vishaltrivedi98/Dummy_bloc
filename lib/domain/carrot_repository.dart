import 'package:dummy/domain/carrot_entity.dart';

abstract class CarrotRepository {
  Future<List<CarrotEntity>> getCarrotTransactions(String userId);
}
