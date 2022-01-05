import 'package:nbb/widgets/admin_widgets/productDescriptionTextField.dart';
import 'package:nbb/widgets/admin_widgets/productColorsSelector.dart';
import 'package:nbb/widgets/admin_widgets/productSubTypeSelector.dart';
import 'package:nbb/widgets/admin_widgets/productPriceTextField.dart';
import 'package:nbb/widgets/admin_widgets/productSizeTextFields.dart';
import 'package:nbb/widgets/admin_widgets/productNameTextField.dart';
import 'package:nbb/widgets/admin_widgets/productTypeSelector.dart';
import 'package:nbb/widgets/admin_widgets/imageSelector.dart';
import 'package:nbb/widgets/admin_widgets/productImage.dart';
import 'package:nbb/widgets/admin_widgets/submitButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/const.dart';
import 'dart:convert';
import 'dart:io';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);
  static const String id = 'admin_screen';

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool isSwitched = false;
  File? image;
  String productName = '';
  String productType = 'Shoe';
  String price = '';
  String minSize = '';
  String maxSize = '';
  String imageURL = '';
  String description = '';

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final onHandImage = File(image.path);
    setState(() => this.image = onHandImage);
    imageURL = image.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          image != null
              ? ProductImage(
                  image: image!,
                  onTap: () => pickImage(),
                )
              : ImageSelector(
                  onTap: () => pickImage(),
                ),
          ProductNameTextField(
            onDoneEditing: (value) => productName = value,
          ),
          ProductTypeSelector(
            isSwitched: isSwitched,
            switcher: () {
              setState(() => isSwitched = !isSwitched);
              if (isSwitched) productType = 'Cloth';
              if (!isSwitched) productType = 'Shoe';
            },
            sameSwitcher: (value) {
              setState(() => isSwitched = !isSwitched);
              if (isSwitched) productType = 'Cloth';
              if (!isSwitched) productType = 'Shoe';
            },
            shoeColor: isSwitched ? Colors.grey : blackColor,
            clothColor: isSwitched ? blackColor : Colors.grey,
          ),
          Visibility(
            visible: !isSwitched,
            child: const ProductSubTypeSelector(
              subType1: '10 cm',
              subType2: '12 cm',
              subType3: 'boots',
              subType4: 'sport',
              subType5: 'highHeels',
            ),
          ),
          Visibility(
            visible: isSwitched,
            child: const ProductSubTypeSelector(
              subType1: 't-shirts',
              subType2: 'pants',
              subType3: 'sets',
              subType4: 'coats',
              subType5: 'skirts',
            ),
          ),
          ProductPriceTextField(
            onDoneEditing: (value) => price = value!,
          ),
          ProductSizeTextFields(
            minSize: (value) => minSize = value!,
            maxSize: (value) => maxSize = value!,
          ),
          const ProductColorsSelector(),
          ProductDescriptionTextField(
            onDoneEditing: (value) => description = value,
          ),
          SubmitButton(
            onTap: () async {
              String colors = json.encode(GetColors.colors());
              String productSubType = getSubtype();
              bool inserted = await Api.insert(productName, productType, productSubType, price,
                  minSize, maxSize, colors, imageURL, description);
              if (inserted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  'product uploaded',
                  textAlign: TextAlign.center,
                )));
              }
              if (!inserted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  'upload failed',
                  textAlign: TextAlign.center,
                )));
              }
            },
          )
        ],
      ),
    );
  }

  getSubtype() {
    String productSubType = GetSubtype.subtype();
    if (productSubType == 'first') return isSwitched ? 't-shirt' : '10 cm';
    if (productSubType == 'second') return isSwitched ? 'pants' : '12 cm';
    if (productSubType == 'third') return isSwitched ? 'sets' : 'boots';
    if (productSubType == 'forth') return isSwitched ? 'coats' : 'sport';
    if (productSubType == 'fifth') return isSwitched ? 'skirts' : 'highHeels';
  }
}
