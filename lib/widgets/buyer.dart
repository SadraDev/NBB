import 'package:flutter/material.dart';
import 'package:nbb/const.dart';
import 'package:nbb/models/productModel.dart';

class Buyer extends StatefulWidget {
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
    this.formKey,
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
  final GlobalKey<FormState>? formKey;

  @override
  State<Buyer> createState() => _BuyerState();
}

class _BuyerState extends State<Buyer> {
  getColorName() {
    if (widget.color == 'black') return 'مشکی';
    if (widget.color == 'maroon') return 'زرشکی';
    if (widget.color == 'candyApple') return 'قرمز';
    if (widget.color == 'orange') return 'نارنجی';
    if (widget.color == 'pink') return 'صورتی';
    if (widget.color == 'green') return 'سبز';
    if (widget.color == 'navy') return 'سرمه‌ای';
    if (widget.color == 'blue') return 'آبی';
    if (widget.color == 'babyBlue') return 'آبی آسمانی';
    if (widget.color == 'white') return 'سفید';
    if (widget.color == 'brown') return 'قهوه‌ای';
    if (widget.color == 'cream') return 'کرمی';
    if (widget.color == 'yellow') return 'زرد';
    if (widget.color == 'NO_COLOR_SELECTED') return 'رنگ انتخاب نشده';
  }

  getColor() {
    if (widget.color == 'black') return Colors.black87;
    if (widget.color == 'maroon') return const Color(0xff800000);
    if (widget.color == 'candyApple') return const Color(0xffff0800);
    if (widget.color == 'orange') return Colors.deepOrange;
    if (widget.color == 'pink') return Colors.pink[200];
    if (widget.color == 'green') return Colors.green;
    if (widget.color == 'navy') return const Color(0xff000080);
    if (widget.color == 'blue') return Colors.blue;
    if (widget.color == 'babyBlue') return const Color(0xff89cfef);
    if (widget.color == 'white') return Colors.white60;
    if (widget.color == 'brown') return Colors.brown[700];
    if (widget.color == 'cream') return const Color(0xff997950);
    if (widget.color == 'yellow') return const Color(0xfffce205);
    if (widget.color == 'NO_COLOR_SELECTED') return Colors.transparent;
  }

  getType() {
    if (widget.product!.productType == 'Shoe') return 'کفش';
    if (widget.product!.productType == 'Cloth') return 'لباس';
  }

  getPrice() {
    String? price = widget.product!.price;
    if (price!.length == 4) price = '${price[0]},${price[1]}${price[2]}${price[3]}';
    return '$price,000 تومان';
  }

  brand() {
    if (widget.product!.brand == 'NOT_BRAND') return false;
    return true;
  }

  // final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Center(
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  cursorColor: blackColor,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: blackColor, width: 1)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: greyColor, width: 1)),
                    hintText: 'نام و نام خانوادگی خریدار',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    floatingLabelStyle: const TextStyle(color: blackColor),
                  ),
                  onChanged: widget.onDoneEditingReceiverName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'لطفا نام خریدار را وارد کنید';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: blackColor,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: blackColor, width: 1)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: greyColor, width: 1)),
                    hintText: 'شماره‌ی همراه خریدار',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'phone number',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    floatingLabelStyle: const TextStyle(color: blackColor),
                  ),
                  onChanged: widget.onDoneEditingReceiverPhone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'لطفا شماره‌ی تلفن خریدار را وارد کنید';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  maxLines: 3,
                  cursorColor: blackColor,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: blackColor, width: 1)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: greyColor, width: 1)),
                    hintText: 'آدرس محل خریدار',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'address',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    floatingLabelStyle: const TextStyle(color: blackColor),
                  ),
                  onChanged: widget.onDoneEditingReceiverAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'لطفا آدرس محل خریدار را وارد کنید';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: blackColor,
                  maxLength: 10,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: blackColor, width: 1)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: greyColor, width: 1)),
                    hintText: 'کدپستی محل خریدار',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'postal code',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    floatingLabelStyle: const TextStyle(color: blackColor),
                  ),
                  onChanged: widget.onDoneEditingReceiverPostalCode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'لطفا کدپستی محل خریدار را وارد کنید';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  maxLines: 3,
                  cursorColor: blackColor,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: blackColor, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: greyColor, width: 1)),
                    hintText: 'اگر توضیحات یا درخواست ویژه‌ای دارید اینجا بنویسید',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'let us know',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    floatingLabelStyle: const TextStyle(color: blackColor),
                  ),
                  onChanged: widget.onDoneEditingComment,
                  onSubmitted: widget.onDoneEditingComment,
                ),
              ),
              Card(
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'اطلاعات محصول',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        leading: const Text('نام محصول :'),
                        title: Text('${widget.product!.productName}'),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        leading: const Text('رنگ انتخابی :'),
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
                                    shape: const CircleBorder(),
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
                        leading: const Text('سایز انتخابی :'),
                        title: Text('${widget.size}'),
                      ),
                    ),
                    Visibility(
                      visible: brand(),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListTile(
                          leading: const Text('برند :'),
                          title: Text('${widget.product!.brand}'),
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        leading: const Text('تایپ محصول :'),
                        title: Text(getType()),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        leading: const Text('کتگوری محصول :'),
                        title: Text('${widget.product!.productSubtype}'),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        leading: const Text('قیمت محصول :'),
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
                      onTap: widget.onBuy),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
