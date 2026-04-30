import 'package:copado26/core/constants/app_colors.dart';
import 'package:copado26/core/di/injection.dart';
import 'package:copado26/data/datasources/album_seeder.dart';
import 'package:copado26/presentation/blocs/album/album_bloc.dart';
import 'package:copado26/presentation/blocs/scanner/scanner_bloc.dart';
import 'package:copado26/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await sl<AlbumSeeder>().seedIfEmpty();
  runApp(const Copado26App());
}

class Copado26App extends StatelessWidget {
  const Copado26App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AlbumBloc>()..add(const AlbumLoaded())),
        BlocProvider(create: (_) => sl<ScannerBloc>()),
      ],
      child: MaterialApp(
        title: 'Copado 26',
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(),
        home: const HomeScreen(),
      ),
    );
  }

  ThemeData _buildTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          secondary: AppColors.secondary,
          error: AppColors.accent,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: AppColors.primary.withOpacity(0.15),
        ),
        cardTheme: CardThemeData(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
}
