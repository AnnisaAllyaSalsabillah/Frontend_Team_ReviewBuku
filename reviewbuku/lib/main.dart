import 'package:flutter/material.dart';
import 'package:booklist/screens/Home.dart';
import 'package:booklist/screens/Favorite.dart';
import 'package:booklist/screens/Profile.dart';
import 'package:booklist/screens/SignIn.dart';
import 'package:booklist/screens/SignUp.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlutterSplashScreen.fadeIn(
        backgroundColor: const Color.fromRGBO(255, 248, 242, 1),
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset("images/Logo MDP.jpeg"),
        ),
        nextScreen: const SignInScreen(),
      ),
      initialRoute: '/',
      routes: {
        '/mainscreen': (context) => const MainScreen(),
        '/homescreen': (context) => const HomeScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController controller = PageController();

  final List<Widget> _pages = const [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          controller.jumpToPage(index);
        },
        selectedItemColor: Color.fromRGBO(101, 85, 143, 1.0),
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color.fromRGBO(240, 238, 225, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages,
      ),
    );
  }
}
