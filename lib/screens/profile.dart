import 'package:flutter/material.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/shared.dart';
import 'package:nbb/widgets/profile_widgets/profileBoughtProductBubble.dart';
import 'package:nbb/widgets/profile_widgets/profileCenterBubble.dart';
import 'package:nbb/widgets/profile_widgets/profileDynamicHeader.dart';
import 'package:nbb/widgets/profile_widgets/profileUsernameEditor.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? username;
  List<dynamic> boughtProducts = [];

  Future<void> getBoughtProducts() async {
    List<dynamic> boughtProducts = await Api.getBoughtProducts();
    setState(() {
      this.boughtProducts = boughtProducts;
    });
  }

  @override
  void initState() {
    super.initState();
    getBoughtProducts();
    username = Shared.getUserName() ?? '';
  }

  String? usernameChecker() {
    if (username == '' || username == 'USERNAME_NOT_GIVEN') return 'Your Name Here...';
    return username!;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      List<Widget> children = [
        const ProfileDynamicHeader(),
        ProfileScreenCenterBubble(count: boughtProducts.length.toString()),
        ProfileScreenUsernameEditor(
          username: usernameChecker(),
          onSubmitted: (value) async {
            Shared.setUserName(value!);
            await Api.updateUserName();
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 35),
          child: Text(
            'Bought products',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ];
      for (var product in boughtProducts) {
        var newProduct = ProfileScreenBoughtProductBubble(
          productName: product[9],
          purchaseDate: product[17],
          price: product[15],
          image: product[16],
          color: product[14],
        );
        children.add(newProduct);
      }
      return ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 90),
        children: children,
      );
    });
  }
}
