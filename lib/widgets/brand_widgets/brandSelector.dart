import 'package:flutter/material.dart';

class BrandSelector extends StatelessWidget {
  const BrandSelector({
    Key? key,
    this.brand1Name,
    this.brand2Name,
    this.brand3Name,
    this.brand4Name,
    this.brand5Name,
    this.brand6Name,
    this.brand7Name,
    this.brand8Name,
    this.brand9Name,
    this.brand10Name,
    this.brand11Name,
    this.brand12Name,
    this.brand1Color,
    this.brand2Color,
    this.brand3Color,
    this.brand4Color,
    this.brand5Color,
    this.brand6Color,
    this.brand7Color,
    this.brand8Color,
    this.brand9Color,
    this.brand10Color,
    this.brand11Color,
    this.brand12Color,
    this.onTapForBrand1,
    this.onTapForBrand2,
    this.onTapForBrand3,
    this.onTapForBrand4,
    this.onTapForBrand5,
    this.onTapForBrand6,
    this.onTapForBrand7,
    this.onTapForBrand8,
    this.onTapForBrand9,
    this.onTapForBrand10,
    this.onTapForBrand11,
    this.onTapForBrand12,
  }) : super(key: key);
  final String? brand1Name;
  final String? brand2Name;
  final String? brand3Name;
  final String? brand4Name;
  final String? brand5Name;
  final String? brand6Name;
  final String? brand7Name;
  final String? brand8Name;
  final String? brand9Name;
  final String? brand10Name;
  final String? brand11Name;
  final String? brand12Name;
  final Color? brand1Color;
  final Color? brand2Color;
  final Color? brand3Color;
  final Color? brand4Color;
  final Color? brand5Color;
  final Color? brand6Color;
  final Color? brand7Color;
  final Color? brand8Color;
  final Color? brand9Color;
  final Color? brand10Color;
  final Color? brand11Color;
  final Color? brand12Color;
  final void Function()? onTapForBrand1;
  final void Function()? onTapForBrand2;
  final void Function()? onTapForBrand3;
  final void Function()? onTapForBrand4;
  final void Function()? onTapForBrand5;
  final void Function()? onTapForBrand6;
  final void Function()? onTapForBrand7;
  final void Function()? onTapForBrand8;
  final void Function()? onTapForBrand9;
  final void Function()? onTapForBrand10;
  final void Function()? onTapForBrand11;
  final void Function()? onTapForBrand12;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20).copyWith(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand1Name!,
                      style: TextStyle(
                        color: brand1Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand2Name!,
                      style: TextStyle(
                        color: brand2Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand3Name!,
                      style: TextStyle(
                        color: brand3Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand4Name!,
                      style: TextStyle(
                        color: brand4Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand5Name!,
                      style: TextStyle(
                        color: brand5Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand6Name!,
                      style: TextStyle(
                        color: brand6Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand6,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand7Name!,
                      style: TextStyle(
                        color: brand7Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand7,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand8Name!,
                      style: TextStyle(
                        color: brand8Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand9Name!,
                      style: TextStyle(
                        color: brand9Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand10Name!,
                      style: TextStyle(
                        color: brand10Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand11Name!,
                      style: TextStyle(
                        color: brand11Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand11,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    child: Text(
                      brand12Name!,
                      style: TextStyle(
                        color: brand12Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    onTap: onTapForBrand12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
