import 'package:dummy/domain/get_carrot_transactions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'carrot_event.dart';
import 'carrot_state.dart';

class CarrotBloc extends Bloc<CarrotEvent, CarrotState> {
  final GetCarrotTransactions getCarrotTransactions;

  CarrotBloc(this.getCarrotTransactions) : super(CarrotInitial()) {
    on<FetchCarrotTransactions>(_onFetch);
  }

  Future<void> _onFetch(
    FetchCarrotTransactions event,
    Emitter<CarrotState> emit,
  ) async {
    emit(CarrotLoading());

    try {
      final items = await getCarrotTransactions(event.userId);
      emit(CarrotLoaded(items));
    } catch (e) {
      emit(CarrotError(e.toString()));
    }
  }
}
