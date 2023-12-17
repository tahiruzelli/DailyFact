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
    as _i3;
import '../../features/suggest/presentation/logic_holder/suggest_fact_logic_holder.dart'
    as _i5;
import '../usecase/usecase_template.dart' as _i4;

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
  gh.factory<_i3.HomeLogicHolder>(() => _i3.HomeLogicHolder());
  gh.factory<_i4.NoParams>(() => _i4.NoParams());
  gh.factory<_i5.SuggestFactLogicHolder>(() => _i5.SuggestFactLogicHolder());
  return getIt;
}
