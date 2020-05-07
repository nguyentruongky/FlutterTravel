import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/widgets/destination_carousel.dart';
import 'package:travel/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;
  var _currentTab = 0;

  var _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildTabItem(IconData icon) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          size: 30,
        ),
        title: SizedBox.shrink());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: Text(
                "What would you like to find? ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map((map) => _buildIcon(map.key))
                    .toList()),
            SizedBox(
              height: 20,
            ),
            DestinationCarousel(),
            SizedBox(
              height: 20,
            ),
            HotelCarousel()
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(
            onTap: (int value) { 
              setState(() {
                _currentTab = value;
              });
            },
            currentIndex: _currentTab, items: [
        _buildTabItem(Icons.search),
        _buildTabItem(FontAwesomeIcons.shoppingBag),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  "https://znews-photo.zadn.vn/w1024/Uploaded/ohunuai/2019_11_25/TAF_zing503.jpg"),
            ),
            title: SizedBox.shrink())
      ]),
    );
  }
}
