import 'package:auth_nodejs_backend/screens/auth/login.dart';
import 'package:auth_nodejs_backend/screens/auth/signup.dart';


class AppRoutes {
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static final routes = {
    loginRoute: (context) => const LoginScreen(),
    signupRoute: (context) => const SignUpScreen()
  };
}
