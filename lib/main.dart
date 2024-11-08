import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_stream/core/data/repository/movie_repository.dart';
import 'package:movie_stream/core/global_component/colors.dart';
import 'features/home/views/home.dart';
import 'features/favorites/views/favorites.dart';
import 'features/profile/views/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Stream',
      theme: ThemeData(
        primaryColor: ColorConstants.mainColor,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: ColorConstants.mainColor,
          onPrimary: ColorConstants.primaryText,
          secondary: ColorConstants.secondaryColor,
          onSecondary: ColorConstants.secondaryText,
          error: ColorConstants.errorColor,
          onError: ColorConstants.onErrorColor,
          surface: ColorConstants.surfaceColor,
          onSurface: ColorConstants.secondaryColor,
        )
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(movieRepository: MovieRepository()),
    const ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mainColor,
        title: Center(
          child: Text(
            _currentIndex == 0
                ? 'Home'
                : _currentIndex == 1
                    ? 'My Favorites'
                    : 'My Profile',
            style: GoogleFonts.gugi(color: ColorConstants.secondaryColor),
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
