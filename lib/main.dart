import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:question_hub/app/routes/app_route.dart';
import 'package:question_hub/core/constants/constants.dart';
import 'package:question_hub/features/course/presentation/providers/course_provider.dart';
import 'package:question_hub/features/settings/presentation/providers/theme_provider.dart';
import 'package:question_hub/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

ProviderContainer _globalContainer = ProviderContainer();
Directory? directory;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  directory = await getApplicationDocumentsDirectory();

  // initialize supabase
  await Supabase.initialize(
    url: SupabaseConstants.projectUrl,
    anonKey: SupabaseConstants.apiKey,
  );

  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        // for theme
        builder: (context, ref, child) {
          // initialize some required providers
          ref.read(courseProvider);

          final isDarkMode = ref.watch(themeProvider).value ?? false;
          return MaterialApp.router(
            title: 'Flutter Demo',
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
            theme: isDarkMode
                ? AppTheme.darkTheme(context)
                : AppTheme.theme(context),
            // theme: AppTheme.darkTheme(context),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
