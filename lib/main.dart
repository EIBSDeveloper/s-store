import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/firebase_options.dart';

import 'app.dart';
import 'data/repositories/authendication/authendication_repository.dart';

Future<void> main() async {

  //Todo: widget bindings
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Todo: Init the Local Storage
  await GetStorage.init();

  //Todo: await splash untill other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Todo: Intialize the Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthendicationRepository()));
  runApp(const App());
}
