import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:question_hub/app/routes/app_route.dart';
import 'package:question_hub/core/constants/constants.dart';
import 'package:question_hub/features/course/presentation/providers/course_provider.dart';
import 'package:question_hub/features/settings/presentation/providers/theme_provider.dart';
import 'package:question_hub/flavor_config.dart';
import 'package:question_hub/theme/app_theme.dart';
import 'package:question_hub/theme/color_palette.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

ProviderContainer _globalContainer = ProviderContainer();
Directory? directory;

final flavorConfigProvider = Provider<FlavorConfig>(
  (ref) => throw UnimplementedError('flavor is not initialized yet'),
);

void mainCommon(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  directory = await getApplicationDocumentsDirectory();

  await dotenv.load();

  // initialize supabase
  await Supabase.initialize(
    url: SupabaseConstants.projectUrl,
    anonKey: SupabaseConstants.apiKey,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorPalette.primary,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(
    ProviderScope(
      overrides: [flavorConfigProvider.overrideWith((ref) => config)],
      child: const MyApp(),
    ),
  );
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // initialize some initial requirement providers
        ref.read(courseProvider);

        final isDarkMode = ref.watch(themeProvider).value ?? false;
        return MaterialApp.router(
          title: 'Flutter Demo',
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
