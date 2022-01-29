import 'package:nbb/widgets/admin_widgets/HomeProductsOrNotSelector.dart';
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
  bool isHomeProduct = false;
  File? image;
  String productName = '';
  String productType = 'Shoe';
  String price = '';
  String minSize = '';
  String maxSize = '';
  String description = '';
  String homeProduct = '0';
  bool loading = false;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final onHandImage = File(image.path);
    setState(() => this.image = onHandImage);
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
              subType1: 'all',
              subType2: '3cm',
              subType3: '4cm',
              subType4: '5cm',
              subType5: '7cm',
              subType6: '9cm',
              subType7: '10cm',
              subType8: '12cm',
              subType9: 'babet',
            ),
          ),
          Visibility(
            visible: isSwitched,
            child: const ProductSubTypeSelector(
              subType1: 'all',
              subType2: 'dress',
              subType3: 'sets',
              subType4: 'coats',
              subType5: 'skirts',
              subType6: 'pants',
              subType7: 't-shirts',
              subType8: '',
              subType9: '',
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
          HomeProductsOrNotSelector(
            isHomeProduct: isHomeProduct,
            homeProductSwitcher: (_) => setState(() => isHomeProduct = !isHomeProduct),
            sameHomeProductSwitcher: () => setState(() => isHomeProduct = !isHomeProduct),
          ),
          ProductDescriptionTextField(
            onDoneEditing: (value) => description = value,
          ),
          SubmitButton(
            loading: loading,
            onTap: () async {
              String colors = json.encode(GetColors.colors());
              String productSubType = getSubtype();
              if (isHomeProduct == true) homeProduct = '1';
              if (image != null) setState(() => loading = true);
              bool inserted = await Api.insertNewProduct(productName, productType, productSubType,
                  price, minSize, maxSize, colors, image!, description, homeProduct);
              setState(() => loading = false);
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
    if (productSubType == 'first') return isSwitched ? 'all' : 'all';
    if (productSubType == 'second') return isSwitched ? 'dress' : '3cm';
    if (productSubType == 'third') return isSwitched ? 'sets' : '4cm';
    if (productSubType == 'forth') return isSwitched ? 'coats' : '5cm';
    if (productSubType == 'fifth') return isSwitched ? 'skirts' : '7cm';
    if (productSubType == 'sixth') return isSwitched ? 'pants' : '9cm';
    if (productSubType == 'seventh') return isSwitched ? 't-shirts' : '10cm';
    if (productSubType == 'eighth') return isSwitched ? 'NUN' : '12cm';
    if (productSubType == 'ninth') return isSwitched ? 'NUN' : 'babet';
  }
}
