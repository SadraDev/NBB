import 'package:flutter/material.dart';

class SubTypeSelector extends StatelessWidget {
  const SubTypeSelector({
    Key? key,
    this.subtype1Name,
    this.subtype2Name,
    this.subtype3Name,
    this.subtype4Name,
    this.subtype5Name,
    this.subtype6Name,
    this.subtype7Name,
    this.subtype8Name,
    this.subtype9Name,
    this.subtype1Color,
    this.subtype2Color,
    this.subtype3Color,
    this.subtype4Color,
    this.subtype5Color,
    this.subtype6Color,
    this.subtype7Color,
    this.subtype8Color,
    this.subtype9Color,
    this.onTapForSubtype1,
    this.onTapForSubtype2,
    this.onTapForSubtype3,
    this.onTapForSubtype4,
    this.onTapForSubtype5,
    this.onTapForSubtype6,
    this.onTapForSubtype7,
    this.onTapForSubtype8,
    this.onTapForSubtype9,
  }) : super(key: key);
  final String? subtype1Name;
  final String? subtype2Name;
  final String? subtype3Name;
  final String? subtype4Name;
  final String? subtype5Name;
  final String? subtype6Name;
  final String? subtype7Name;
  final String? subtype8Name;
  final String? subtype9Name;
  final Color? subtype1Color;
  final Color? subtype2Color;
  final Color? subtype3Color;
  final Color? subtype4Color;
  final Color? subtype5Color;
  final Color? subtype6Color;
  final Color? subtype7Color;
  final Color? subtype8Color;
  final Color? subtype9Color;
  final void Function()? onTapForSubtype1;
  final void Function()? onTapForSubtype2;
  final void Function()? onTapForSubtype3;
  final void Function()? onTapForSubtype4;
  final void Function()? onTapForSubtype5;
  final void Function()? onTapForSubtype6;
  final void Function()? onTapForSubtype7;
  final void Function()? onTapForSubtype8;
  final void Function()? onTapForSubtype9;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20).copyWith(bottom: 20),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Text(
                  subtype6Name!,
                  style: TextStyle(
                    color: subtype6Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: onTapForSubtype6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Text(
                  subtype7Name!,
                  style: TextStyle(
                    color: subtype7Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: onTapForSubtype7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Text(
                  subtype8Name!,
                  style: TextStyle(
                    color: subtype8Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: onTapForSubtype8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Text(
                  subtype9Name!,
                  style: TextStyle(
                    color: subtype9Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: onTapForSubtype9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
