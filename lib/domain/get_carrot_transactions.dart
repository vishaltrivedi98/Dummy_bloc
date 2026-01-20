import 'package:dummy/domain/carrot_entity.dart';
import 'package:dummy/domain/carrot_repository.dart';

class GetCarrotTransactions {
  final CarrotRepository repository;

  GetCarrotTransactions(this.repository);

  Future<List<CarrotEntity>> call(String userId) {
    return repository.getCarrotTransactions(userId);
  }
}
