// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nbb/const.dart';

class HomeFlow extends StatefulWidget {
  const HomeFlow({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  _HomeFlowState createState() => _HomeFlowState();
}

class _HomeFlowState extends State<HomeFlow> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  _screenOptions(int index) {
    if (index == 0) {
      return HomeScreen();
    } else if (index == 1) {
      return Container();
    } else if (index == 2) {
      return Container();
    } else if (index == 3) {
      return Container();
    } else if (index == 4) {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: SizedBox(
          height: 90,
          child: Card(
            margin: const EdgeInsets.all(20).copyWith(top: 0),
            elevation: 5,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: blackColor,
              selectedIconTheme: const IconThemeData(color: whiteColor),
              unselectedIconTheme: const IconThemeData(color: greyColor),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: selectedIndex,
              onTap: onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/house.png')),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ankle-boot.png'),
                    size: 27,
                  ),
                  label: 'shoe',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/dress.png'),
                    size: 30,
                  ),
                  label: 'clothing',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/heart.png')),
                  label: 'favorite',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/account.png'),
                    size: 27,
                  ),
                  label: 'profile',
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      color: Color(0xff111015),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(),
                  flex: 5,
                ),
              ],
            ),
            _screenOptions(selectedIndex),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 35).copyWith(bottom: 0),
          child: Text(
            'NBB',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      spreadRadius: 4,
                      //offset: Offset(0, 0),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 50, left: 30, top: 50),
                child: InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15).copyWith(bottom: 0),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.favorite_border_rounded),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://scontent-lga3-2.cdninstagram.com/v/t51.2885-15/e35/270105433_119179337099484_7430127682550644890_n.jpg?_nc_ht=scontent-lga3-2.cdninstagram.com&_nc_cat=100&_nc_ohc=6_5nmVFff4EAX-Fiz_g&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT92tLi2f23jkkE8slb2RsRwctFcPzebiIL9i8i_VYJEHg&oe=61D4D521&_nc_sid=83d603',
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                        child: Text(
                          'UltraBoost Shoes',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          '10 cm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '799 T',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'colors : ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    shape: CircleBorder(),
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    shape: CircleBorder(),
                                    color: Colors.pink[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      spreadRadius: 4,
                      //offset: Offset(0, 0),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 50, left: 30, top: 50),
                child: InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15).copyWith(bottom: 0),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.favorite_border_rounded),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://scontent-lga3-2.cdninstagram.com/v/t51.2885-15/e35/270105433_119179337099484_7430127682550644890_n.jpg?_nc_ht=scontent-lga3-2.cdninstagram.com&_nc_cat=100&_nc_ohc=6_5nmVFff4EAX-Fiz_g&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT92tLi2f23jkkE8slb2RsRwctFcPzebiIL9i8i_VYJEHg&oe=61D4D521&_nc_sid=83d603',
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                        child: Text(
                          'UltraBoost Shoes',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          '10 cm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '799 T',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'colors : ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    shape: CircleBorder(),
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    shape: CircleBorder(),
                                    color: Colors.pink[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      spreadRadius: 4,
                      //offset: Offset(0, 0),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 50, left: 30, top: 50),
                child: InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15).copyWith(bottom: 0),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.favorite_border_rounded),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://scontent-lga3-2.cdninstagram.com/v/t51.2885-15/e35/270105433_119179337099484_7430127682550644890_n.jpg?_nc_ht=scontent-lga3-2.cdninstagram.com&_nc_cat=100&_nc_ohc=6_5nmVFff4EAX-Fiz_g&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT92tLi2f23jkkE8slb2RsRwctFcPzebiIL9i8i_VYJEHg&oe=61D4D521&_nc_sid=83d603',
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                        child: Text(
                          'UltraBoost Shoes',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          '10 cm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '799 T',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'colors : ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    shape: CircleBorder(),
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    shape: CircleBorder(),
                                    color: Colors.pink[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      spreadRadius: 4,
                      //offset: Offset(0, 0),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 50, left: 30, top: 50),
                child: InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15).copyWith(bottom: 0),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.favorite_border_rounded),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://scontent-lga3-2.cdninstagram.com/v/t51.2885-15/e35/270105433_119179337099484_7430127682550644890_n.jpg?_nc_ht=scontent-lga3-2.cdninstagram.com&_nc_cat=100&_nc_ohc=6_5nmVFff4EAX-Fiz_g&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT92tLi2f23jkkE8slb2RsRwctFcPzebiIL9i8i_VYJEHg&oe=61D4D521&_nc_sid=83d603',
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                        child: Text(
                          'UltraBoost Shoes',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          '10 cm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '799 T',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'colors : ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    shape: CircleBorder(),
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    shape: CircleBorder(),
                                    color: Colors.pink[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Latest products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'show all',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Icon(EvaIcons.arrowIosForwardOutline),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.215,
                  height: MediaQuery.of(context).size.width * 0.215,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20).copyWith(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://scontent-lga3-2.cdninstagram.com/v/t51.2885-15/e35/270105433_119179337099484_7430127682550644890_n.jpg?_nc_ht=scontent-lga3-2.cdninstagram.com&_nc_cat=100&_nc_ohc=6_5nmVFff4EAX-Fiz_g&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT92tLi2f23jkkE8slb2RsRwctFcPzebiIL9i8i_VYJEHg&oe=61D4D521&_nc_sid=83d603',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.215,
                  height: MediaQuery.of(context).size.width * 0.215,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20).copyWith(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://scontent-lga3-2.cdninstagram.com/v/t51.2885-15/e35/270105433_119179337099484_7430127682550644890_n.jpg?_nc_ht=scontent-lga3-2.cdninstagram.com&_nc_cat=100&_nc_ohc=6_5nmVFff4EAX-Fiz_g&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT92tLi2f23jkkE8slb2RsRwctFcPzebiIL9i8i_VYJEHg&oe=61D4D521&_nc_sid=83d603',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.215,
                  height: MediaQuery.of(context).size.width * 0.215,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20).copyWith(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://scontent-lga3-2.cdninstagram.com/v/t51.2885-15/e35/270105433_119179337099484_7430127682550644890_n.jpg?_nc_ht=scontent-lga3-2.cdninstagram.com&_nc_cat=100&_nc_ohc=6_5nmVFff4EAX-Fiz_g&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT92tLi2f23jkkE8slb2RsRwctFcPzebiIL9i8i_VYJEHg&oe=61D4D521&_nc_sid=83d603',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.215,
                  height: MediaQuery.of(context).size.width * 0.215,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20).copyWith(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://scontent-lga3-2.cdninstagram.com/v/t51.2885-15/e35/270105433_119179337099484_7430127682550644890_n.jpg?_nc_ht=scontent-lga3-2.cdninstagram.com&_nc_cat=100&_nc_ohc=6_5nmVFff4EAX-Fiz_g&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT92tLi2f23jkkE8slb2RsRwctFcPzebiIL9i8i_VYJEHg&oe=61D4D521&_nc_sid=83d603',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.215,
                  height: MediaQuery.of(context).size.width * 0.215,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20).copyWith(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://scontent-lga3-2.cdninstagram.com/v/t51.2885-15/e35/270105433_119179337099484_7430127682550644890_n.jpg?_nc_ht=scontent-lga3-2.cdninstagram.com&_nc_cat=100&_nc_ohc=6_5nmVFff4EAX-Fiz_g&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT92tLi2f23jkkE8slb2RsRwctFcPzebiIL9i8i_VYJEHg&oe=61D4D521&_nc_sid=83d603',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//     children: <Widget>[
//       Padding(
//         padding: const EdgeInsets.only(right: 40, left: 40),
//         child: Text(
//           '10 cm',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(right: 40),
//         child: Text(
//           '12 cm',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(right: 40),
//         child: Text(
//           'short',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(right: 40),
//         child: Text(
//           'boots',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(right: 40),
//         child: Text(
//           'sports',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
