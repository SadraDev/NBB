import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nbb/const.dart';
import 'package:nbb/utils/shared.dart';

class MainRowProducts extends StatelessWidget {
  const MainRowProducts({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Builder(builder: builder),
      ),
    );
  }
}

class MainRowProductsContainer extends StatelessWidget {
  const MainRowProductsContainer({
    Key? key,
    required this.modalBuilder,
    this.onLiked,
    this.image,
    this.productName,
    this.productSubtype,
    this.price,
    this.colors,
    this.liked,
    this.onDelete,
  }) : super(key: key);
  final void Function()? onLiked;
  final Widget Function(BuildContext) modalBuilder;
  final void Function()? onDelete;
  final String? image;
  final String? productName;
  final String? productSubtype;
  final String? price;
  final Map<String, dynamic>? colors;
  final bool? liked;

  bool? adminChecker() {
    if (Shared.getUserPhone() == adminNumber) return true;
    if (Shared.getUserPhone() != adminNumber) return false;
    return false;
  }

  getColorsLength() {
    int length = 0;
    if (colors!['black'] == true) length++;
    if (colors!['maroon'] == true) length++;
    if (colors!['candyApple'] == true) length++;
    if (colors!['red'] == true) length++;
    if (colors!['pink'] == true) length++;
    if (colors!['green'] == true) length++;
    if (colors!['navy'] == true) length++;
    if (colors!['blue'] == true) length++;
    if (colors!['babyBlue'] == true) length++;
    if (colors!['white'] == true) length++;
    if (colors!['brown'] == true) length++;
    if (colors!['cream'] == true) length++;
    if (colors!['yellow'] == true) length++;
    return length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            spreadRadius: 4,
            offset: Offset(2, 15),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 50, left: 30, top: 50),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(15).copyWith(bottom: 0),
              child: IconButton(
                onPressed: onLiked,
                icon:
                    liked! ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_rounded),
                alignment: Alignment.topRight,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    '$imageURL/$image',
                  ),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20).copyWith(bottom: 0),
              child: Text(
                productName!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                productSubtype!,
                style: const TextStyle(
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
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      "$price T",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  getColorsLength() > 4
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'colors : ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                getColorsLength() > 5
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Visibility(
                                                visible: colors!['black'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['maroon'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Color(0xff800000),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['candyApple'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Color(0xffff0800),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['red'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['pink'] ?? false,
                                                child: SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: const CircleBorder(),
                                                    color: Colors.pink[600],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Visibility(
                                                visible: colors!['green'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['navy'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Color(0xff000080),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['blue'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['babyBlue'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Color(0xff89cfef),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['white'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Visibility(
                                                visible: colors!['brown'] ?? false,
                                                child: SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: const CircleBorder(),
                                                    color: Colors.brown[700],
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['cream'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Color(0xff997950),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: colors!['yellow'] ?? false,
                                                child: const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    color: Color(0xfffce205),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Visibility(
                                            visible: colors!['black'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['maroon'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Color(0xff800000),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['candyApple'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Color(0xffff0800),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['red'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['pink'] ?? false,
                                            child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: const CircleBorder(),
                                                color: Colors.pink[600],
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['green'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['navy'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Color(0xff000080),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['blue'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['babyBlue'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Color(0xff89cfef),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['white'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Colors.white60,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['brown'] ?? false,
                                            child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: const CircleBorder(),
                                                color: Colors.brown[700],
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['cream'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                  shape: CircleBorder(), color: Color(0xff997950)),
                                            ),
                                          ),
                                          Visibility(
                                            visible: colors!['yellow'] ?? false,
                                            child: const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Card(
                                                shape: CircleBorder(),
                                                color: Color(0xfffce205),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                              ],
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'colors : ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Visibility(
                                  visible: colors!['black'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['maroon'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Color(0xff800000),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['candyApple'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Color(0xffff0800),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['red'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['pink'] ?? false,
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: const CircleBorder(),
                                      color: Colors.pink[600],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['green'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['navy'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Color(0xff000080),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['blue'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['babyBlue'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Color(0xff89cfef),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['white'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['brown'] ?? false,
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: const CircleBorder(),
                                      color: Colors.brown[700],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['cream'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(shape: CircleBorder(), color: Color(0xff997950)),
                                  ),
                                ),
                                Visibility(
                                  visible: colors!['yellow'] ?? false,
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Card(
                                      shape: CircleBorder(),
                                      color: Color(0xfffce205),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                ],
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
            builder: modalBuilder,
          );
        },
        onDoubleTap: onLiked,
        onLongPress: () {
          if (adminChecker()!) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text(
                  'You are about to delete this product. Are you sure?',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    child: const Text(
                      'no',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'delete',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: onDelete,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
