abstract class CarrotEvent {}

class FetchCarrotTransactions extends CarrotEvent {
  final String userId;
  FetchCarrotTransactions(this.userId);
}
// background: linear-gradient(90deg, #FFDA58 5.21%, #F7EF8A 35.04%, #FEC537 71.51%, #EDC968 96.13%);
