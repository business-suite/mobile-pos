// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:business_suite_mobile_pos/app/module/res/dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/network/response/product_info_response.dart';
import '../../../module/network/response/products_response.dart';
import '../../../module/network/response/shops_response.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/style.dart';

void prductInfoBottomSheet(
    {VoidCallback? onCloseClick,
    double statusBarHeight = 0.0,
    required ProductInfo productInfo, required Product product}) {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(size_20_w))),
    context: context,
    backgroundColor: transparent,
    isScrollControlled: true,
    builder: (BuildContext builderContext) {
      return ProductInfoBottomSheet(
        statusBarHeight: statusBarHeight,
        productInfo: productInfo,
        product: product,
      );
    },
  );
}

class ProductInfoBottomSheet extends StatefulWidget {
  //final PercentageViewModel _percentageViewModel;
  double statusBarHeight = 0.0;
  ProductInfo productInfo;
  Product product;

  ProductInfoBottomSheet(
      {this.statusBarHeight = 0.0, required this.productInfo,  required this.product});

  @override
  State<ProductInfoBottomSheet> createState() => _ProductInfoBottomSheetState();
}

class _ProductInfoBottomSheetState extends State<ProductInfoBottomSheet> {
  //PercentageViewModel get percentageViewModel => widget._percentageViewModel;
  ProductInfo get productInfo => widget.productInfo;
  Product get product => widget.product;
  double get margin => productInfo.all_prices?.price_without_tax - product.standard_price;
  Shop? shop;
  var orderPriceWithoutTax;
  var orderCost;
  var orderMargin;
  var orderMarginPercent;

  @override
  void initState() {
    shop = getIt<UserSharePref>().getShop();
    info();
    super.initState();
  }

  void info(){
     orderPriceWithoutTax = product.getTotalPrice();
     orderCost = product.getTotalCost();
     orderMargin = orderPriceWithoutTax - orderCost;
     orderMarginPercent = orderPriceWithoutTax == 0 ? 0 : (orderMargin/orderPriceWithoutTax * 10000).round() * 0.01;
  }

  String joinStringValue(List<Values> values){
    StringBuffer buffer = StringBuffer();
    buffer.writeAll(values.map<String>((element) => element.name).toList(), ', ');
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    var paddingTop = widget.statusBarHeight == 0.0
        ? appBarSize * 2
        : appBarSize + widget.statusBarHeight;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: paddingTop),
        color: kColorf0eeee,
        child: Column(
          children: [
            Container(
              color: kWhite.withOpacity(0.5),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: size_20_w, bottom: size_20_w),
                  child: Text(
                    LocaleKeys.product_information.tr(),
                    style: TextStyle(fontSize: size_18_w, color: kColor555555),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(overscroll: false),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: size_10_w,
                            right: size_10_w,
                            top: size_10_w,
                            bottom: size_80_w),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                product.display_name?.replaceAll('[${product.default_code}]', '').trim() ?? '',
                                style: TextStyle(
                                    fontSize: size_30_w, color: kColor555555),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                product.default_code,
                                style: TextStyle(
                                    fontSize: size_15_w, color: kColor555555),
                              ),
                            ),
                            SizedBox(
                              height: size_10_h,
                            ),
                            Text(
                              LocaleKeys.product_price.tr(namedArgs: {
                                'money': product.lst_price?.toStringAsFixed(2) ?? '0.0',
                                'currency': NumberFormat()
                                    .simpleCurrencySymbol(shop?.currencyId?[1])
                              }),
                              style: TextStyle(
                                  fontSize: size_30_w, color: kColor555555),
                            ),
                            SizedBox(
                              height: size_20_w,
                            ),

                            //financials
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        LocaleKeys.financials.tr(),
                                        style: TextStyle(
                                            fontSize: size_20_w,
                                            color: kColor555555,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        height: size_2_w,
                                        color: kColor808080,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size_15_w,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size_10_w,
                                ),
                                if (productInfo.all_prices != null)
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              LocaleKeys.price_excl_vat.tr(),
                                              style: TextStyle(
                                                  fontSize: size_15_w,
                                                  color: kColor555555),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              LocaleKeys.product_price.tr(namedArgs: {
                                                'money': productInfo.all_prices?.price_without_tax.toStringAsFixed(2),
                                                'currency':
                                                NumberFormat().simpleCurrencySymbol(shop?.currencyId?[1])
                                              }),
                                              style: TextStyle(
                                                  fontSize: size_15_w,
                                                  color: kColor555555),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              LocaleKeys.cost.tr(),
                                              style: TextStyle(
                                                  fontSize: size_15_w,
                                                  color: kColor555555),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Text(
                                                LocaleKeys.product_price.tr(namedArgs: {
                                                  'money': product.standard_price?.toStringAsFixed(2) ?? '0.0',
                                                  'currency':
                                                  NumberFormat().simpleCurrencySymbol(shop?.currencyId?[1])
                                                }),
                                                style: TextStyle(
                                                    fontSize: size_15_w,
                                                    color: kColor555555),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              LocaleKeys.margin.tr(),
                                              style: TextStyle(
                                                  fontSize: size_15_w,
                                                  color: kColor555555),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Text(
                                                LocaleKeys.product_price.tr(namedArgs: {
                                                  'money': margin.toStringAsFixed(2),
                                                  'currency': NumberFormat().simpleCurrencySymbol(shop?.currencyId?[1]),
                                                  'percent': productInfo.all_prices?.getMarginPercent(margin).toStringAsFixed(2) ?? '0',
                                                }),
                                                style: TextStyle(
                                                    fontSize: size_15_w,
                                                    color: kColor555555),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                if (productInfo.pricelists?.isNotEmpty == true)
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: productInfo.pricelists?.length,
                                    itemBuilder: (context, index) =>
                                        buildItemPricelists(
                                            productInfo.pricelists![index]),
                                  ),
                                SizedBox(
                                  height: size_20_w,
                                ),
                              ],
                            ),

                            //Inventory (as of opening)
                            if (productInfo.warehouses?.isNotEmpty == true)
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          LocaleKeys.inventory_as_of_opening
                                              .tr(),
                                          style: TextStyle(
                                              fontSize: size_20_w,
                                              color: kColor555555,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: size_2_w,
                                          color: kColor808080,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size_15_w,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size_10_w,
                                  ),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: productInfo.warehouses?.length,
                                    itemBuilder: (context, index) =>
                                        buildItemWarehouses(
                                            productInfo.warehouses![index]),
                                  ),
                                  SizedBox(
                                    height: size_20_w,
                                  ),
                                ],
                              ),

                            //Replenishment
                            if (productInfo.suppliers?.isNotEmpty == true)
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          LocaleKeys.replenishment.tr(),
                                          style: TextStyle(
                                              fontSize: size_20_w,
                                              color: kColor555555,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: size_2_w,
                                          color: kColor808080,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size_15_w,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size_10_w,
                                  ),
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: productInfo.suppliers?.length,
                                      itemBuilder: (context, index) =>
                                          buildItemSuppliers(
                                              productInfo.suppliers![index])),
                                  SizedBox(
                                    height: size_20_w,
                                  ),
                                ],
                              ),

                            //Attributes
                            if (productInfo.variants?.isNotEmpty == true)
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          LocaleKeys.attributes.tr(),
                                          style: TextStyle(
                                              fontSize: size_20_w,
                                              color: kColor555555,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: size_2_w,
                                          color: kColor808080,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size_15_w,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size_10_w,
                                  ),
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: productInfo.variants?.length,
                                      itemBuilder: (context, index) =>
                                          buildItemVariants(
                                              productInfo.variants![index])),
                                  SizedBox(
                                    height: size_20_w,
                                  ),
                                ],
                              ),

                            //ORDER
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    LocaleKeys.financials.tr(),
                                    style: TextStyle(
                                        fontSize: size_20_w,
                                        color: kColor555555,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    height: size_2_w,
                                    color: kColor808080,
                                  ),
                                ),
                                SizedBox(
                                  width: size_15_w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: size_10_w,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    LocaleKeys.total_price_excl_vat.tr(),
                                    style: TextStyle(
                                        fontSize: size_15_w,
                                        color: kColor555555),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Text(
                                      LocaleKeys.product_price.tr(namedArgs: {
                                        'money': orderPriceWithoutTax.toStringAsFixed(2),
                                        'currency': NumberFormat()
                                            .simpleCurrencySymbol(shop?.currencyId?[1])
                                      }),
                                      style: TextStyle(
                                          fontSize: size_15_w,
                                          color: kColor555555),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    LocaleKeys.total_cost.tr(),
                                    style: TextStyle(
                                        fontSize: size_15_w,
                                        color: kColor555555),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Text(
                                      LocaleKeys.product_price.tr(namedArgs: {
                                        'money': orderCost.toStringAsFixed(2),
                                        'currency': NumberFormat()
                                            .simpleCurrencySymbol(shop?.currencyId?[1])
                                      }),
                                      style: TextStyle(
                                          fontSize: size_15_w,
                                          color: kColor555555),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    LocaleKeys.total_margin.tr(),
                                    style: TextStyle(
                                        fontSize: size_15_w,
                                        color: kColor555555),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Text(
                                      LocaleKeys.product_price.tr(namedArgs: {
                                        'money': orderMargin.toStringAsFixed(2),
                                        'currency': NumberFormat().simpleCurrencySymbol(shop?.currencyId?[1]),
                                        'percent': orderMarginPercent.toStringAsFixed(2) ?? '0',
                                      }),
                                      style: TextStyle(
                                          fontSize: size_15_w,
                                          color: kColor555555),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Wrap(
                      children: [
                        Container(
                          height: size_1_w,
                          color: kColorCACACA,
                        ),
                        Container(
                          color: kColorf0eeee,
                          width: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: size_100_w,
                                height: size_60_w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size_10_w, vertical: size_10_w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: size_1_w,
                                      color: kColorBFBFBF,
                                    ),
                                  ),
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(),
                                    color: Colors.black.withOpacity(0.05),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      LocaleKeys.close.tr(),
                                      style: TextStyle(
                                          fontSize: text_12,
                                          color: kColor555555,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemSuppliers(Suppliers suppliers) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            LocaleKeys.supplier_name.tr(namedArgs: {
              'name': suppliers.name,
            }),
            style: TextStyle(fontSize: size_15_w, color: kColor555555),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: size_20_w),
              child: Text(
                LocaleKeys.supplier_day.tr(namedArgs: {
                  'day': suppliers.delay.toString(),
                }),
                style: TextStyle(fontSize: size_15_w, color: kColor555555),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size_40_w),
              child: Text(
                LocaleKeys.product_price.tr(namedArgs: {
                  'money': suppliers.price.toStringAsFixed(2),
                  'currency': NumberFormat()
                      .simpleCurrencySymbol(shop?.currencyId?[1])
                }),
                style: TextStyle(fontSize: size_15_w, color: kColor555555),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildItemWarehouses(Warehouses warehouses) {
    return Visibility(
      visible: !(warehouses.available_quantity == 0 && warehouses.forecasted_quantity == 0) ,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              LocaleKeys.supplier_name.tr(namedArgs: {
                'name': warehouses.name,
              }),
              style: TextStyle(fontSize: size_15_w, color: kColor555555),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: size_20_w),
            alignment: Alignment.topLeft,
            child: Text(
              LocaleKeys.warehouses_unit.tr(namedArgs: {
                'quantity': warehouses.available_quantity.toInt().toString(),
                'uom':  warehouses.uom.toString(),
              }),
              style: TextStyle(fontSize: size_15_w, color: kColor555555),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: size_20_w),
            alignment: Alignment.topLeft,
            child: Text(
              LocaleKeys.warehouses_forecasted.tr(namedArgs: {
                'quantity': warehouses.forecasted_quantity.toInt().toString() ,
              }),
              style: TextStyle(fontSize: size_15_w, color: kColor555555),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemVariants(Variants variants) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            LocaleKeys.supplier_name.tr(namedArgs: {
              'name': variants.name,
            }),
            style: TextStyle(fontSize: size_15_w, color: kColor555555),
          ),
        ),
        if(variants.values?.isNotEmpty == true)
        Container(
          padding: EdgeInsets.only(left: size_20_w),
          alignment: Alignment.topLeft,
          child: Text(
            joinStringValue(variants.values ?? []),
            style: TextStyle(fontSize: size_15_w, color: kColor555555),
          ),
        ),
      ],
    );
  }

  Widget buildItemPricelists(Pricelists pricelists) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            pricelists.name,
            style: TextStyle(fontSize: size_15_w, color: kColor555555),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              LocaleKeys.product_price.tr(namedArgs: {
                'money': pricelists.price.toStringAsFixed(2),
                'currency':
                    NumberFormat().simpleCurrencySymbol(shop?.currencyId?[1])
              }),
              style: TextStyle(fontSize: size_15_w, color: kColor555555),
            ),
          ),
        ),
      ],
    );
  }
}
