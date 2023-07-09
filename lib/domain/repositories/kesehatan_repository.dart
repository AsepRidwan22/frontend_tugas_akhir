import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';
import '../entities/kesehatan.dart';

abstract class KesehatanRepository {
  // Future<Kesehatan> getKesehatan(String bearerToken);
  Future<Either<Failure, Kesehatan>> getKesehatan();
}
