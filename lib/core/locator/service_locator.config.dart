// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/presentation/logic_holder/home_logic_holder.dart'
    as _i4;
import '../../features/suggest/presentation/logic_holder/suggest_fact_logic_holder.dart'
    as _i8;
import '../remote/dio_options.dart' as _i3;
import '../remote/interceptors.dart' as _i5;
import '../remote/remote_config.dart' as _i7;
import '../usecase/usecase_template.dart' as _i6;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.DioOptions>(_i3.DioOptions());
  gh.factory<_i4.HomeLogicHolder>(() => _i4.HomeLogicHolder());
  gh.singleton<_i5.MyDioInterceptor>(_i5.MyDioInterceptor());
  gh.factory<_i6.NoParams>(() => _i6.NoParams());
  gh.singleton<_i7.RemoteConfig>(_i7.RemoteConfig());
  gh.factory<_i8.SuggestFactLogicHolder>(() => _i8.SuggestFactLogicHolder());
  return getIt;
}
