// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nbb/const.dart';
import 'package:nbb/models/productModel.dart';

class Buyer extends StatelessWidget {
  const Buyer({
    Key? key,
    this.onDoneEditingReceiverName,
    this.onDoneEditingReceiverPhone,
    this.onDoneEditingReceiverAddress,
    this.onDoneEditingReceiverPostalCode,
    this.onDoneEditingComment,
    this.size,
    this.color,
    this.product,
    this.onBuy,
  }) : super(key: key);
  final void Function(String)? onDoneEditingReceiverName;
  final void Function(String)? onDoneEditingReceiverPhone;
  final void Function(String)? onDoneEditingReceiverAddress;
  final void Function(String)? onDoneEditingReceiverPostalCode;
  final void Function(String)? onDoneEditingComment;
  final void Function()? onBuy;
  final int? size;
  final String? color;
  final Product? product;

  getColorName() {
    if (color == 'black') return 'مشکی';
    if (color == 'maroon') return 'زرشکی';
    if (color == 'candyApple') return 'قرمز';
    if (color == 'orange') return 'نارنجی';
    if (color == 'pink') return 'صورتی';
    if (color == 'green') return 'سبز';
    if (color == 'navy') return 'سرمه‌ای';
    if (color == 'blue') return 'آبی';
    if (color == 'babyBlue') return 'آبی آسمانی';
    if (color == 'white') return 'سفید';
    if (color == 'brown') return 'قهوه‌ای';
    if (color == 'cream') return 'کرمی';
    if (color == 'yellow') return 'زرد';
    if (color == 'NO_COLOR_SELECTED') return 'رنگ انتخاب نشده';
  }

  getColor() {
    if (color == 'black') return Colors.black87;
    if (color == 'maroon') return const Color(0xff800000);
    if (color == 'candyApple') return const Color(0xffff0800);
    if (color == 'orange') return Colors.deepOrange;
    if (color == 'pink') return Colors.pink[200];
    if (color == 'green') return Colors.green;
    if (color == 'navy') return const Color(0xff000080);
    if (color == 'blue') return Colors.blue;
    if (color == 'babyBlue') return const Color(0xff89cfef);
    if (color == 'white') return Colors.white60;
    if (color == 'brown') return Colors.brown[700];
    if (color == 'cream') return const Color(0xff997950);
    if (color == 'yellow') return const Color(0xfffce205);
    if (color == 'NO_COLOR_SELECTED') return Colors.transparent;
  }

  getType() {
    if (product!.productType == 'Shoe') return 'کفش';
    if (product!.productType == 'Cloth') return 'لباس';
  }

  getPrice() {
    String? price = product!.price;
    if (price!.length == 4) price = '${price[0]},${price[1]}${price[2]}${price[3]}';
    return '$price,000 تومان';
  }

  brand() {
    if (product!.brand == 'NOT_BRAND') return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                cursorColor: blackColor,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: blackColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: greyColor, width: 1)),
                  hintText: 'نام و نام خانوادگی تحویل گیرنده',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  floatingLabelStyle: TextStyle(color: blackColor),
                ),
                onChanged: onDoneEditingReceiverName,
                onSubmitted: onDoneEditingReceiverName,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: blackColor,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: blackColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: greyColor, width: 1)),
                  hintText: 'شماره‌ی همراه تحویل گیرنده',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'phone number',
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  floatingLabelStyle: TextStyle(color: blackColor),
                ),
                onChanged: onDoneEditingReceiverPhone,
                onSubmitted: onDoneEditingReceiverPhone,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                maxLines: 3,
                cursorColor: blackColor,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: blackColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: greyColor, width: 1)),
                  hintText: 'آدرس محل تحویل گیرنده',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'address',
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  floatingLabelStyle: TextStyle(color: blackColor),
                ),
                onChanged: onDoneEditingReceiverAddress,
                onSubmitted: onDoneEditingReceiverAddress,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: blackColor,
                maxLength: 10,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: blackColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: greyColor, width: 1)),
                  hintText: 'کدپستی محل تحویل گیرنده',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'postal code',
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  floatingLabelStyle: TextStyle(color: blackColor),
                ),
                onChanged: onDoneEditingReceiverPostalCode,
                onSubmitted: onDoneEditingReceiverPostalCode,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                maxLines: 3,
                cursorColor: blackColor,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: blackColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: greyColor, width: 1)),
                  hintText: 'اگر توضیحات یا درخواست ویژه‌ای دارید اینجا بنویسید',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'let us know',
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  floatingLabelStyle: TextStyle(color: blackColor),
                ),
                onChanged: onDoneEditingComment,
                onSubmitted: onDoneEditingComment,
              ),
            ),
            Card(
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'اطلاعات محصول',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      leading: Text('نام محصول :'),
                      title: Text('${product!.productName}'),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      leading: Text('رنگ انتخابی :'),
                      title: Row(
                        children: [
                          Text(getColorName()),
                          Visibility(
                            visible: getColor() != Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Card(
                                  shape: CircleBorder(),
                                  color: getColor(),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      leading: Text('سایز انتخابی :'),
                      title: Text('$size'),
                    ),
                  ),
                  Visibility(
                    visible: brand(),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        leading: Text('برند :'),
                        title: Text('${product!.brand}'),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      leading: Text('تایپ محصول :'),
                      title: Text(getType()),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      leading: Text('کتگوری محصول :'),
                      title: Text('${product!.productSubtype}'),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      leading: Text('قیمت محصول :'),
                      title: Text(getPrice()),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                color: blackColor,
                child: InkWell(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'خرید',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: onBuy!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
