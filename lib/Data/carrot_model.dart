import 'package:dummy/domain/carrot_entity.dart';

class CarrotModel extends CarrotEntity {
  CarrotModel({
    required super.title,
    required super.value,
    required super.positive,
  });

  factory CarrotModel.fromJson(Map<String, dynamic> json) {
    final amount = json['amount'];
    final type = json['type'];

    return CarrotModel(
      title: json['remarks'],
      value: type == 'debit' ? '-$amount' : '+$amount',
      positive: type == 'credit',
    );
  }
}
