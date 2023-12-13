import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/auth/auth.provider.dart';
import 'package:njha_bird_detect/app/screens/explore/explore.provider.dart';
import 'package:njha_bird_detect/app/screens/home/home.provider.dart';
import 'package:njha_bird_detect/app/screens/layout.provider.dart';
import 'package:njha_bird_detect/app/screens/prediction/predict.provider.dart';
import 'package:njha_bird_detect/routes/router.dart';
import 'package:provider/provider.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => LayoutProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => ExploreProvider()),
          ChangeNotifierProvider(create: (_) => PredictProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(fontFamily: 'Inter'),
          darkTheme: ThemeData.dark(),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: '/intro',
        ));
  }
}
