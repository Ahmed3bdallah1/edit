import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/apply_controllers/applied_cubit/applied_cubit.dart';
import 'package:graduation_project/core/controllers/apply_controllers/apply_job_cubit/apply_cubit.dart';
import 'package:graduation_project/core/controllers/jobs_cubit/jobs_cubit.dart';
import 'package:graduation_project/core/controllers/profile_controllers/change_email/change_email_cubit.dart';
import 'package:graduation_project/core/controllers/profile_controllers/change_mobile/change_mobile_cubit.dart';
import 'package:graduation_project/core/controllers/profile_controllers/change_password/change_password_cubit.dart';
import 'package:graduation_project/core/controllers/profile_controllers/edit_profile/edit_profile_cubit.dart';
import 'package:graduation_project/core/controllers/profile_controllers/profile_portfolio/portfolio_cubit.dart';
import 'package:graduation_project/core/remote/dio_helper.dart';
import 'package:graduation_project/screens/onboard/splash_screen.dart';
import 'package:provider/provider.dart';
import 'core/controllers/auth_controllers/login_cubit/login_cubit.dart';
import 'core/controllers/auth_controllers/register_cubit/register_cubit.dart';
import 'core/controllers/profile_controllers/profile_cubit/profile_cubit.dart';
import 'core/local/shared_preferences.dart';
import 'core/managers/managers.dart';
import 'firebase_options.dart';
import 'models/models/provider_models/jobs_services.dart';

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
        BlocProvider(
          create: (context) => RegisterCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..profileApi(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => AppliedCubit()..appliedJobsApi(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ChangeEmailCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ChangePasswordCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ChangeMobileCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => EditProfileCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..profileApi(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => PortfolioCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) {
            print("====bloc created=====");
            return JobsCubit()..getAllJobs();
          },
          lazy: false,
        ),
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
