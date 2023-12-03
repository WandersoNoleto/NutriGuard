import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard/colors/colors.dart';
import 'package:nutri_guard/screens/homePage.dart'; 
import 'package:nutri_guard/screens/foodsPage.dart'; 
import 'package:nutri_guard/screens/profile.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.primaryGreen,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavItem(
            iconPath: 'assets/pacientsNavbar.svg',
            iconSize: screenWidth * 0.08,
            onTap: () {
              // Navegar para a HomePage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          NavItem(
            iconPath: 'assets/profileNavbar.svg',
            iconSize: screenWidth * 0.08,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          NavItem(
            iconPath: 'assets/foodsNavbar.svg',
            iconSize: screenWidth * 0.08,
            onTap: () {
              // Navegar para a FoodHistoryPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodInfoPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String iconPath;
  final double iconSize;
  final VoidCallback onTap;

  const NavItem({Key? key, required this.iconPath, required this.iconSize, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Usando a função fornecida
      child: Container(
        padding: EdgeInsets.all(iconSize * 0.2),
        child: SvgPicture.asset(
          iconPath,
          width: iconSize * 1.2,
          height: iconSize * 1.2,
        ),
      ),
    );
  }
}
