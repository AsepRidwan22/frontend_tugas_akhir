import 'package:frontend_tugas_akhir/domain/entities/kesehatan.dart';
import 'package:frontend_tugas_akhir/domain/repositories/kesehatan_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';

class GetKesehatan {
  final KesehatanRepository repository;

  GetKesehatan(this.repository);

  Future<Either<Failure, Kesehatan>> execute() {
    return repository.getKesehatan();
  }
}
