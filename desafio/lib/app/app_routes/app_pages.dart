import 'package:desafio/app/app_routes/app_routes.dart';
import 'package:desafio/app/ui/home_page/home_bindings.dart';
import 'package:desafio/app/ui/home_page/home_page.dart';
import 'package:desafio/app/ui/splash_page/splash_bindings.dart';
import 'package:desafio/app/ui/splash_page/splash_page.dart';
import 'package:get/get.dart';

class AppPages {
  List<GetPage> get routes => [
        GetPage(
          name: Routes.splash,
          page: () => const SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Routes.home,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
      ];
}
