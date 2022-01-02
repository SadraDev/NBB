import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nbb/const.dart';

class ClothScreen extends StatefulWidget {
  const ClothScreen({Key? key}) : super(key: key);

  @override
  _ClothScreenState createState() => _ClothScreenState();
}

class _ClothScreenState extends State<ClothScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50).copyWith(bottom: 20),
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    't-shirts',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'pants',
                    style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'sets',
                    style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'coats',
                    style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'skirts',
                    style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 196,
            width: MediaQuery.of(context).size.width,
            child: StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15).copyWith(bottom: 0),
                          child: const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.favorite_border_rounded),
                            alignment: Alignment.topRight,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 120,
                          width: 120,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/cloth.jpg',
                              ),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                          child: const Text(
                            'UltraBoost Shoes',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '799 T',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      showMaterialModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          double pageWidth = MediaQuery.of(context).size.width;
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Container(
                                      width: pageWidth,
                                      height: pageWidth,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/cloth.jpg'),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 50)
                                              .copyWith(bottom: 0),
                                          child: IconButton(
                                            onPressed: () => Navigator.pop(context),
                                            icon: const Icon(
                                              EvaIcons.close,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.favorite_border_rounded),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                                      .copyWith(bottom: 0),
                                  child: const Text(
                                    'HighHeels',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    '12 cm',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text(
                                        '799 T',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          const Text(
                                            'colors : ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(
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
                                              shape: const CircleBorder(),
                                              color: Colors.pink[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30)
                                      .copyWith(bottom: 10),
                                  child: const Text(
                                    'Select a size',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25)
                                      .copyWith(bottom: 10),
                                  child: Wrap(
                                    children: const <Widget>[
                                      SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: Card(
                                          shape: CircleBorder(
                                              side: BorderSide(color: blackColor, width: 1)),
                                          child: Center(child: Text('36')),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: Card(
                                          color: blackColor,
                                          shape: CircleBorder(
                                              side: BorderSide(color: blackColor, width: 1)),
                                          child: Center(
                                            child:
                                                Text('38', style: TextStyle(color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: Card(
                                          shape: CircleBorder(
                                              side: BorderSide(color: blackColor, width: 1)),
                                          child: Center(child: Text('40')),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: Card(
                                          shape: CircleBorder(
                                              side: BorderSide(color: blackColor, width: 1)),
                                          child: Center(child: Text('42')),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: Card(
                                          shape: CircleBorder(
                                              side: BorderSide(color: blackColor, width: 1)),
                                          child: Center(child: Text('44')),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: Card(
                                          shape: CircleBorder(
                                              side: BorderSide(color: blackColor, width: 1)),
                                          child: Center(child: Text('46')),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(indent: 20, endIndent: 20, color: greyColor),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'Some Description about the product',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                                      .copyWith(top: 30),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    margin: EdgeInsets.zero,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12))),
                                    color: blackColor,
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 15),
                                        child: Text(
                                          'Buy Now',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
