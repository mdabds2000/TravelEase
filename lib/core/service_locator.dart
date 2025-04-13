import 'package:get_it/get_it.dart';

import '../services/api_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ApiService>(ApiService());
}