import 'package:flutter/material.dart';

//packages
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

//other files
import 'package:markus/Components/homeScreenItem.dart';
import 'package:markus/Components/offerItem.dart';
import 'package:markus/Components/sliverAppBar.dart';
import 'package:markus/Objects/itemclass.dart';
import 'package:markus/Screens/account.dart';
import 'package:markus/Screens/cart.dart';
import 'package:markus/Screens/loading.dart';
import 'package:markus/Screens/search.dart';
import 'package:markus/items.dart';
import 'package:markus/to_Database/dbMethods.dart';
import 'package:markus/values.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isnew = true;
  void wait() async {
    await Future.delayed(Duration(milliseconds: 7000));
    setState(() {
      isnew = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    wait();
  }

  @override
  Widget build(BuildContext context) {
    return isnew
        ? Loading()
        : Scaffold(
            bottomNavigationBar: GNav(
                selectedIndex: navval,
                onTabChange: (i) {
                  setState(() {
                    navval = i;
                  });
                },
                tabMargin: EdgeInsets.all(10),
                curve: Curves.easeOutExpo, // tab animation curves
                duration: Duration(milliseconds: 900), // tab animation duration
                gap: 8, // the tab button gap between icon and text
                color: Colors.grey[800], // unselected icon color
                activeColor: Colors.blue, // selected icon and text color
                iconSize: 24,
                backgroundColor:
                    Colors.blue.withOpacity(0.1), // tab button icon size
                tabBackgroundColor: Colors.blue
                    .withOpacity(0.2), // selected tab background color
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5), // navigation bar padding
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Icons.shopping_basket,
                    text: 'Cart',
                  ),
                  GButton(
                    icon: Icons.account_circle,
                    text: 'Profile',
                  )
                ]),
            // bottomNavigationBar: BottomNavigationBar(
            //   showUnselectedLabels: false,
            //   unselectedItemColor: Colors.grey,
            //   currentIndex: navval,
            //   onTap: (i) {
            //
            //   },
            //   items: [
            //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.shopping_cart), label: 'Cart'),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.account_circle), label: 'Account'),
            //   ],
            // ),
            backgroundColor: Colors.white,
            body: navval == 0
                ? MainScreen()
                : navval == 1
                    ? SearchScreen()
                    : navval == 2
                        ? CartScreen()
                        : Account(),
          );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomLeft,
              colors: [
            Colors.white,
            Colors.blue[300],
            Colors.blue[700],
            Colors.blue[700]
            // Colors.purple.withOpacity(0.5),
          ])),
      child: CustomScrollView(
        slivers: [
          MySliverAppBar(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Container(
                    height: 200,
                    child: Swiper(
                      itemCount: offers.length,
                      scrollDirection: Axis.horizontal,
                      autoplay: true,
                      autoplayDelay: 3000,
                      itemBuilder: (BuildContext context, int index) {
                        return OfferItem(items[offers[index]]);
                      },
                    )),
                // Container(
                //     // color: Color(0xff1c1c1c),
                //     height: 150,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: shops.length,
                //       itemBuilder: (context, index) {
                //         return CircleAvatar(
                //             maxRadius: 24,
                //             minRadius: 22,
                //             backgroundColor: Colors.white,
                //             child: Image.network(shops[index],
                //                 fit: BoxFit.contain));
                //       },
                //     )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended for you...',
                        style: TextStyle(fontSize: 18, color: colors[5]),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: TextStyle(color: colors[5]),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    // color: Color(0xff1c1c1c),
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommends.length,
                      itemBuilder: (context, index) {
                        return HomeScreenItem(items[recommends[index]]);
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most popular...',
                        style: TextStyle(fontSize: 18, color: colors[5]),
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Text('See All',
                              style: TextStyle(color: colors[5]))),
                    ],
                  ),
                ),
                Container(
                    // color: Color(0xff1c1c1c),
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popular.length,
                      itemBuilder: (context, index) {
                        return HomeScreenItem(items[popular[index]]);
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Based on your recent activity...',
                          style: TextStyle(fontSize: 18, color: colors[5]),
                        ),
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Text('See All',
                              style: TextStyle(color: colors[5]))),
                    ],
                  ),
                ),
                Container(
                    // color: Color(0xff1c1c1c),
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recent.length,
                      itemBuilder: (context, index) {
                        return HomeScreenItem(items[recent[index]]);
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest on market...',
                        style: TextStyle(fontSize: 18, color: colors[5]),
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Text('See All',
                              style: TextStyle(color: colors[5]))),
                    ],
                  ),
                ),
                Container(
                    // color: Color(0xff1c1c1c),
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: latest.length,
                      itemBuilder: (context, index) {
                        return HomeScreenItem(items[latest[index]]);
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discover something new...',
                        style: TextStyle(fontSize: 18, color: colors[5]),
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Text('See All',
                              style: TextStyle(color: colors[5]))),
                    ],
                  ),
                ),
                Container(
                    color: Color(0xff1c1c1c),
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: discover.length,
                      itemBuilder: (context, index) {
                        return HomeScreenItem(items[discover[index]]);
                      },
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
