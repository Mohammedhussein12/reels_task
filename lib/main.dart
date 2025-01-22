import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels_task/features/reels/presentation/screens/reels_screen.dart';

import 'core/app_bloc_observer.dart';
import 'core/di/service_locator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const ReelsApp());
}

class ReelsApp extends StatelessWidget {
  const ReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ReelsScreen.routeName: (context) => const ReelsScreen(),
        },
        initialRoute: ReelsScreen.routeName,
      ),
    );
  }
}
