// import 'package:ditonton/data/datasources/db/database_helper.dart';

// import 'package:ditonton/data/datasources/movie_local_data_source.dart';
import 'package:frontend_tugas_akhir/data/datasources/kesehatan_remote_data_source.dart';
import 'package:frontend_tugas_akhir/data/datasources/news_remote_data_source.dart';
import 'package:frontend_tugas_akhir/data/datasources/user_remote_data_source.dart';

import 'package:frontend_tugas_akhir/data/repositories/kesehatan_repository_impl.dart';
import 'package:frontend_tugas_akhir/data/repositories/news_repository_impl.dart';
import 'package:frontend_tugas_akhir/data/repositories/user_repository_impl.dart';

// import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:frontend_tugas_akhir/domain/repositories/kesehatan_repository.dart';
import 'package:frontend_tugas_akhir/domain/repositories/news_repository.dart';

// import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';
import 'package:frontend_tugas_akhir/domain/usecases/get_is_login.dart';
import 'package:frontend_tugas_akhir/domain/usecases/get_kesehatan.dart';
import 'package:frontend_tugas_akhir/domain/usecases/get_news.dart';
import 'package:frontend_tugas_akhir/domain/usecases/get_remember_me.dart';
import 'package:frontend_tugas_akhir/domain/usecases/is_dokter.dart';
import 'package:frontend_tugas_akhir/domain/usecases/is_have_profile.dart';

// import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:frontend_tugas_akhir/domain/usecases/login_user.dart';
import 'package:frontend_tugas_akhir/domain/usecases/register.dart';
import 'package:frontend_tugas_akhir/domain/usecases/save_is_login.dart';
import 'package:frontend_tugas_akhir/domain/usecases/set_remember_me.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/Dashboard/dashboard_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/Kesehatan/kesehatan_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/LoginPasien/login_pasien_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/RegisterPasien/register_pasien_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/provider/dokter_login_notifier.dart';

// import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
import 'package:frontend_tugas_akhir/presentation/provider/pasien_login_notifier.dart';
import 'package:frontend_tugas_akhir/presentation/provider/pasien_register_notifier.dart';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => PasienLoginNotifier(
      loginUsers: locator(),
      // role: locator(),
      // String: locator(),
    ),
  );

  locator.registerFactory(
    () => DokterLoginNotifier(
      loginDokters: locator(),
      // role: locator(),
      // String: locator(),
    ),
  );

  locator.registerFactory(
    () => UserRegisterNotifier(
      registerUsers: locator(),
    ),
  );

  locator.registerFactory(
    () => LoginPasienBloc(
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => DashboardBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => KesehatanBloc(
      // locator(),
      // locator(),
      // locator(),
      // locator(),
      // locator(),
      getKesehatan: locator(),
    ),
  );

  locator.registerFactory(
    () => RegisterPasienBloc(
      locator(),
    ),
  );

  // locator.registerFactory(
  //   () => NewsNotifier(
  //     getNews: locator(),
  //   ),
  // );
  // locator.registerFactory(
  //   () => UserProviderNotifier(
  //     registerUsers: locator(),
  //   ),
  // );

  // use case
  locator.registerLazySingleton(() => LoginUsers(locator()));
  locator.registerLazySingleton(() => LoginDokters(locator()));
  locator.registerLazySingleton(() => RegisterUsers(locator()));
  locator.registerLazySingleton(() => GetNews(locator()));
  locator.registerLazySingleton(() => SetRememberMe(locator()));
  locator.registerLazySingleton(() => GetRememberMe(locator()));
  locator.registerLazySingleton(() => GetIsLogIn(locator()));
  locator.registerLazySingleton(() => IsDokter(locator()));
  // locator.registerLazySingleton(() => IsDokter(locator()));
  locator.registerLazySingleton(() => IsHaveProfile(locator()));
  locator.registerLazySingleton(() => SaveIsLogIn(locator()));
  locator.registerFactory(() => GetKesehatan(locator()));

  // locator.registerLazySingleton(() => RegisterUseCase(locator()));

  // repository
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: locator(),
      // localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      remoteDataSource: locator(),
      // localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<KesehatanRepository>(
    () => KesehatanRepositoryImpl(
      remoteDataSource: locator<KesehatanRemoteDataSource>(),
    ),
  );

  // data sources
  locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton<NewsRemoteDataSourceImpl>(
      () => NewsRemoteDataSourceImpl());

  locator.registerLazySingleton<KesehatanRemoteDataSource>(
      () => KesehatanRemoteDataSourceImpl());

  // helper
  // locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
