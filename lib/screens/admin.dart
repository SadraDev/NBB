import 'package:nbb/widgets/admin_widgets/HomeProductsOrNotSelector.dart';
import 'package:nbb/widgets/admin_widgets/productBrandSelector.dart';
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
              subType1: '3cm',
              subType2: '4cm',
              subType3: '5cm',
              subType4: '7cm',
              subType5: '9cm',
              subType6: '10cm',
              subType7: '12cm',
              subType8: 'babet',
            ),
          ),
          Visibility(
            visible: isSwitched,
            child: const ProductSubTypeSelector(
              subType1: 'dress',
              subType2: 'sets',
              subType3: 'coats',
              subType4: 'skirts',
              subType5: 'pants',
              subType6: 't-shirts',
              subType7: '',
              subType8: '',
            ),
          ),
          const ProductBrandSelector(
            brand1: 'zara',
            brand2: 'mango',
            brand3: 'bershka',
            brand4: 'kotton',
            brand5: 'stradivarius',
            brand6: 'H&M',
            brand7: 'nike',
            brand8: 'adidas',
            brand9: 'rebook',
            brand10: 'new balance',
            brand11: 'LV',
            brand12: 'GUCCI',
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
              String brand = getBrand();
              if (isHomeProduct == true) homeProduct = '1';
              if (image != null) setState(() => loading = true);
              bool inserted = await Api.insertNewProduct(productName, productType, productSubType,
                  price, minSize, maxSize, colors, image!, description, brand, homeProduct);
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
    if (productSubType == 'first') return isSwitched ? 'dress' : '3cm';
    if (productSubType == 'second') return isSwitched ? 'sets' : '4cm';
    if (productSubType == 'third') return isSwitched ? 'coats' : '5cm';
    if (productSubType == 'forth') return isSwitched ? 'skirts' : '7cm';
    if (productSubType == 'fifth') return isSwitched ? 'pants' : '9cm';
    if (productSubType == 'sixth') return isSwitched ? 't-shirts' : '10cm';
    if (productSubType == 'seventh') return isSwitched ? 'NUN' : '12cm';
    if (productSubType == 'eighth') return isSwitched ? 'NUN' : 'babet';
  }

  getBrand() {
    String productBrand = GetBrand.brand();
    if (productBrand == 'NOT_BRAND') return 'NOT_BRAND';
    if (productBrand == 'first') return 'zara';
    if (productBrand == 'second') return 'mango';
    if (productBrand == 'third') return 'bershka';
    if (productBrand == 'forth') return 'kotton';
    if (productBrand == 'fifth') return 'stradivarius';
    if (productBrand == 'sixth') return 'H&M';
    if (productBrand == 'seventh') return 'nike';
    if (productBrand == 'eighth') return 'adidas';
    if (productBrand == 'ninth') return 'rebook';
    if (productBrand == 'tenth') return 'new balance';
    if (productBrand == 'eleventh') return 'LV';
    if (productBrand == 'twelfth') return 'GUCCI';
  }
}
