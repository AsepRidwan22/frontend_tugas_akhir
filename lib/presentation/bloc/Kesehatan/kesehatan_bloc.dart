import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend_tugas_akhir/common/state_enum.dart';
import 'package:frontend_tugas_akhir/domain/entities/kesehatan.dart';
import 'package:frontend_tugas_akhir/domain/usecases/get_kesehatan.dart';
// import 'package:http/http.dart';
// import 'package:frontend_tugas_akhir/data/models/model_kesehatan.dart';

part 'kesehatan_event.dart';
part 'kesehatan_state.dart';

class KesehatanBloc extends Bloc<KesehatanEvent, KesehatanState> {
  final GetKesehatan getKesehatan;

  KesehatanBloc({
    required this.getKesehatan,
  }) : super(KesehatanState.initial()) {
    on<FetchKesehatan>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.loading));

      final result = await getKesehatan.execute();

      result.fold(
        (failure) {
          emit(state.copyWith(
            requestState: RequestState.error,
            message: failure.message,
          ));
        },
        (data) {
          emit(state.copyWith(
            requestState: RequestState.loaded,
            kesehatan: data,
          ));
        },
      );
    });
  }
}
