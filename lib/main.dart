import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/extensions/color_print_extension.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/movie_player/utils/orientation_service.dart';
import 'package:movies_booking_app/util/di/di.dart';
import 'package:movies_booking_app/util/router/router.dart';

// [ Navigator key for routing ]
final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Remote Config
  try {
    configureDependencies();
    // Initialize PersistenceHelper if used
  } catch (e, stack) {
    'Remote config error: $e\n$stack'.printBoldRed();
  }

  // Lock the orientation to portrait mode
  OrientationService.setPortrait();
  //  Status Bar Color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Make it transparent
      statusBarIconBrightness: Brightness.dark, // Dark icons (for light bg)
      statusBarBrightness: Brightness.light, // Light status bar (for Android)
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const ProviderApp();
      },
    );
  }
}

class ProviderApp extends StatefulWidget {
  const ProviderApp({super.key});

  @override
  State<ProviderApp> createState() => _ProviderAppState();
}

class _ProviderAppState extends State<ProviderApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setPadding(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        key: navigatorKey,
        debugShowCheckedModeBanner: false,
        color: Colors.purple,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
          useMaterial3: false,
        ),
        localeResolutionCallback: (locale, supportedLocales) {
          return locale;
        },
        routerConfig: router,
      ),
    );
  }
}

/// [Commands]
/// dart run build_runner watch --delete-conflicting-outputs
///rm -rf ios/Pods; rm ios/Podfile.lock; rm -rf ios/.symlinks; rm pubspec.lock; rm -rf build
/// rm -rf ios/Pods; rm ios/Podfile.lock; rm -rf ios/.symlinks; rm pubspec.lock; rm -rf build; flutter clean; flutter pub get; cd ios; pod install --repo-update; cd ..
/// flutter clean;rm -rf ios/Pods; rm ios/Podfile.lock; rm -rf ios/.symlinks; rm pubspec.lock; rm -rf build; cd ios; pod install --repo-update; cd ..
/// dart run build_runner watch --delete-conflicting-outputs
/// flutter clean; flutter pub get; cd ios; pod install --repo-update; cd ..
/// flutter clean; flutter pub get;dart run build_runner watch --delete-conflicting-outputs
/// flutter gen-l10n
/// dart run artisan make:model user on auth
/// dart run artisan make:usecase login on auth --remote
/// dart run artisan make:usecase save_token on auth --local
/// dart run artisan assets
/// using below command to update the plugins
/// cd plugins/here_sdk; flutter clean; flutter pub get; cd .. ; cd ..; flutter clean; flutter pub get; cd ios; pod install --repo-update; cd ..
/// mkdir -p lib/features/feature_name/{data,domain,presentation/{providers,views,widgets}}
