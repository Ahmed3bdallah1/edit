import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/managers.dart';
import 'package:graduation_project/services/local/shared_preferences.dart';
import 'package:graduation_project/services/models/provider_models/jobs_services.dart';
import 'package:graduation_project/view/onboard/splash_screen.dart';
import 'package:graduation_project/view/user%20interface/profile/profile_screen/profile_screen_function.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  generalToken = CacheHelper.getData(key: "token") ?? "";
  generalID = CacheHelper.getData(key: "id") ?? 0;
  generalEmail = CacheHelper.getData(key: "email") ?? "";
  generalName = CacheHelper.getData(key: "name") ?? "";
  print(generalToken);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JobModels()),
      ],
      child: MaterialApp(
        title: 'graduation project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
