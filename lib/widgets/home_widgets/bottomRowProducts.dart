import 'package:flutter/material.dart';
import 'package:nbb/const.dart';

class BottomRowProducts extends StatelessWidget {
  const BottomRowProducts({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext) builder;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Builder(
          builder: builder,
        ),
      ),
    );
  }
}

class BottomRowProductsContainer extends StatelessWidget {
  const BottomRowProductsContainer({Key? key, this.image}) : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.215,
      height: MediaQuery.of(context).size.width * 0.215,
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            '$imageURL/$image',
          ),
        ),
      ),
    );
  }
}
