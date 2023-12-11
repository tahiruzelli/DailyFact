
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:daily/core/locator/service_locator.config.dart';

final GetIt locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(locator);