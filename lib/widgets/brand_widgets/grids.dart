import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/shared.dart';
import '../../const.dart';

class BrandGridView extends StatelessWidget {
  const BrandGridView({Key? key, required this.builder, this.future}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<List<dynamic>>) builder;
  final Future<List<dynamic>>? future;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 142,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<dynamic>>(
        future: future,
        builder: builder,
      ),
    );
  }
}

class BrandGrid extends StatelessWidget {
  const BrandGrid({
    Key? key,
    this.product,
    this.onLiked,
    this.onDelete,
    required this.modalBuilder,
  }) : super(key: key);
  final Product? product;
  final void Function()? onLiked;
  final void Function()? onDelete;
  final Widget Function(BuildContext) modalBuilder;

  bool? adminChecker() {
    if (Shared.getUserPhone() == adminNumber) return true;
    if (Shared.getUserPhone() != adminNumber) return false;
    return false;
  }

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
        onDoubleTap: onLiked,
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
                alignment: Alignment.topRight,
                onPressed: onLiked,
                icon: product!.liked! ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_outline),
              ),
            ),
            CachedNetworkImage(
              imageUrl: '$imageURL/${product!.image}',
              imageBuilder: (context, imageProvider) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: imageProvider,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
              ),
              placeholder: (_, __) => const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(color: blackColor),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(8.0),
            //     child: Image.network(
            //       '$imageURL/${product!.image}',
            //       width: 120,
            //       height: 120,
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20).copyWith(bottom: 0),
              child: Text(
                product!.productName!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                product!.productSubtype!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "${product!.price} T",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        onLongPress: () async {
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
