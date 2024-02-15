import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => GetStorage());
  getIt.registerLazySingleton(() => TextEditingController());
 

}