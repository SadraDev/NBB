import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ShoeAndClothGridView extends StatelessWidget {
  const ShoeAndClothGridView({Key? key, required this.builder, this.count}) : super(key: key);
  final Widget Function(BuildContext, int) builder;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 196,
        width: MediaQuery.of(context).size.width,
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          physics: const BouncingScrollPhysics(),
          itemCount: count,
          itemBuilder: builder,
        ),
      ),
    );
  }
}

class ShoeAndClothGrid extends StatelessWidget {
  const ShoeAndClothGrid(
      {Key? key, this.name, this.price, this.image, this.onLiked, required this.modalBuilder})
      : super(key: key);
  final String? name;
  final String? price;
  final String? image;
  final void Function()? onLiked;
  final Widget Function(BuildContext) modalBuilder;

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(15).copyWith(bottom: 0),
              child: IconButton(
                onPressed: onLiked,
                icon: const Icon(Icons.favorite_border_rounded),
                alignment: Alignment.topRight,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(image!),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20).copyWith(bottom: 0),
              child: Text(
                name!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                price!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
