import 'package:flutter/material.dart';

class SubTypeSelector extends StatelessWidget {
  const SubTypeSelector({
    Key? key,
    this.subtype1Name,
    this.subtype2Name,
    this.subtype3Name,
    this.subtype4Name,
    this.subtype5Name,
    this.subtype1Color,
    this.subtype2Color,
    this.subtype3Color,
    this.subtype4Color,
    this.subtype5Color,
    this.onTapForSubtype1,
    this.onTapForSubtype2,
    this.onTapForSubtype3,
    this.onTapForSubtype4,
    this.onTapForSubtype5,
  }) : super(key: key);
  final String? subtype1Name;
  final String? subtype2Name;
  final String? subtype3Name;
  final String? subtype4Name;
  final String? subtype5Name;
  final Color? subtype1Color;
  final Color? subtype2Color;
  final Color? subtype3Color;
  final Color? subtype4Color;
  final Color? subtype5Color;
  final void Function()? onTapForSubtype1;
  final void Function()? onTapForSubtype2;
  final void Function()? onTapForSubtype3;
  final void Function()? onTapForSubtype4;
  final void Function()? onTapForSubtype5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50).copyWith(bottom: 20),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Text(
                  subtype1Name!,
                  style: TextStyle(
                    color: subtype1Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: onTapForSubtype1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Text(
                  subtype2Name!,
                  style: TextStyle(
                    color: subtype2Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: onTapForSubtype2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Text(
                  subtype3Name!,
                  style: TextStyle(
                    color: subtype3Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: onTapForSubtype3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Text(
                  subtype4Name!,
                  style: TextStyle(
                    color: subtype4Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: onTapForSubtype4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Text(
                  subtype5Name!,
                  style: TextStyle(
                    color: subtype5Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: onTapForSubtype5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
