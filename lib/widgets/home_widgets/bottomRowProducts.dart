import 'package:cached_network_image/cached_network_image.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
  const BottomRowProductsContainer({Key? key, this.image, required this.modalBuilder}) : super(key: key);
  final String? image;
  final Widget Function(BuildContext) modalBuilder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      }, //TODO
      child: CachedNetworkImage(
        imageUrl: '$imageURL/$image',
        imageBuilder: (context, imageProvider) => Container(
          margin: const EdgeInsets.fromLTRB(15, 20, 15, 30),
          width: MediaQuery.of(context).size.width * 0.215,
          height: MediaQuery.of(context).size.width * 0.215,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: imageProvider,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
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
    );
  }
}

//Container(
//         margin: const EdgeInsets.fromLTRB(15, 20, 15, 30),
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//               color: Colors.grey,
//               blurRadius: 20,
//               offset: Offset(0, 10),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(8.0),
//           child: Image.network(
//             '$imageURL/$image',
//             width: MediaQuery.of(context).size.width * 0.215,
//             height: MediaQuery.of(context).size.width * 0.215,
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
