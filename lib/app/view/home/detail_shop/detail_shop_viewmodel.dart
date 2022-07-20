import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/review_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/pay/pay_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../di/injection.dart';
import '../../../model/bill.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/network/response/category_product_response.dart';
import '../../../module/network/response/detail_shop_response.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';

class DetailShopViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  GlobalKey<SliderDrawerState> keySlider = GlobalKey<SliderDrawerState>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";
  ScrollController scrollController = ScrollController();

  bool isHome = false;
  int lastIndexMenu = 0;
  List<Product> products = [];
  List<Product> allProducts = [];
  List<Category> categoryProducts = [];

  dynamic categoryProductResponse = {
    "jsonrpc": "2.0",
    "id": 20,
    "result": [
      {
        "id": 3,
        "name": "Chairs",
        "parent_id": false,
        "child_id": [],
        "write_date": "2022-06-20 14:34:07"
      },
      {
        "id": 2,
        "name": "Desks",
        "parent_id": false,
        "child_id": [],
        "write_date": "2022-06-20 14:34:07"
      },
      {
        "id": 1,
        "name": "Miscellaneous",
        "parent_id": false,
        "child_id": [],
        "write_date": "2022-06-20 14:34:07"
      }
    ]
  };

  dynamic detailShopResponse = {
    "jsonrpc": "2.0",
    "id": 21,
    "result": [
      {
        "id": 57,
        "display_name": "Whiteboard Pen",
        "lst_price": 1.2,
        "standard_price": 0.0,
        "categ_id": [9, "All / Consumable"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [1],
        "barcode": false,
        "default_code": "CONS_0001",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [47, "[CONS_0001] Whiteboard Pen"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "consu"
      },
      {
        "id": 15,
        "display_name": "Customizable Desk (Aluminium, Black)",
        "lst_price": 800.4,
        "standard_price": 500.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "DESK0004",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": "160x80cm, with large legs.",
        "description": false,
        "product_tmpl_id": [9, "Customizable Desk"],
        "tracking": "none",
        "write_date": "2022-06-20 14:22:12",
        "available_in_pos": true,
        "attribute_line_ids": [1, 2],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 37,
        "display_name": "Customizable Desk (Custom, White)",
        "lst_price": 750.0,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "DESK0005",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": "160x80cm, with large legs.",
        "description": false,
        "product_tmpl_id": [9, "Customizable Desk"],
        "tracking": "none",
        "write_date": "2022-06-20 14:22:12",
        "available_in_pos": true,
        "attribute_line_ids": [1, 2],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 38,
        "display_name": "Customizable Desk (Custom, Black)",
        "lst_price": 750.0,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "DESK0006",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": "160x80cm, with large legs.",
        "description": false,
        "product_tmpl_id": [9, "Customizable Desk"],
        "tracking": "none",
        "write_date": "2022-06-20 14:22:12",
        "available_in_pos": true,
        "attribute_line_ids": [1, 2],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 16,
        "display_name": "Corner Desk Right Sit",
        "lst_price": 147.0,
        "standard_price": 600.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "E-COM06",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [10, "[E-COM06] Corner Desk Right Sit"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 17,
        "display_name": "Large Cabinet",
        "lst_price": 320.0,
        "standard_price": 800.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "E-COM07",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [11, "[E-COM07] Large Cabinet"],
        "tracking": "none",
        "write_date": "2022-06-20 14:44:08",
        "available_in_pos": true,
        "attribute_line_ids": [7, 8, 9],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 18,
        "display_name": "Storage Box",
        "lst_price": 15.8,
        "standard_price": 14.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "E-COM08",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [12, "[E-COM08] Storage Box"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 19,
        "display_name": "Large Desk",
        "lst_price": 1799.0,
        "standard_price": 1299.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "E-COM09",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [13, "[E-COM09] Large Desk"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 20,
        "display_name": "Pedal Bin",
        "lst_price": 47.0,
        "standard_price": 10.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "E-COM10",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [14, "[E-COM10] Pedal Bin"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 21,
        "display_name": "Cabinet with Doors",
        "lst_price": 140.0,
        "standard_price": 120.5,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "E-COM11",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [15, "[E-COM11] Cabinet with Doors"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 23,
        "display_name": "Conference Chair (Steel)",
        "lst_price": 33.0,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [3, "Chairs"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "E-COM12",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [16, "Conference Chair"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [3],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 24,
        "display_name": "Conference Chair (Aluminium)",
        "lst_price": 39.4,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [3, "Chairs"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "E-COM13",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [16, "Conference Chair"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [3],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 50,
        "display_name": "Desk Organizer",
        "lst_price": 5.1000000000000005,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": "2300001000008",
        "default_code": "FURN_0001",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [40, "[FURN_0001] Desk Organizer"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [4, 5],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 53,
        "display_name": "Desk Pad",
        "lst_price": 1.98,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [1],
        "barcode": false,
        "default_code": "FURN_0002",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [43, "[FURN_0002] Desk Pad"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 55,
        "display_name": "LED Lamp",
        "lst_price": 0.9,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [1],
        "barcode": false,
        "default_code": "FURN_0003",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [45, "[FURN_0003] LED Lamp"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 49,
        "display_name": "Letter Tray",
        "lst_price": 4.8,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [1],
        "barcode": false,
        "default_code": "FURN_0004",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [39, "[FURN_0004] Letter Tray"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 51,
        "display_name": "Magnetic Board",
        "lst_price": 1.98,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [1],
        "barcode": "2301000000006",
        "default_code": "FURN_0005",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [41, "[FURN_0005] Magnetic Board"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 52,
        "display_name": "Monitor Stand",
        "lst_price": 3.19,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [1],
        "barcode": false,
        "default_code": "FURN_0006",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [42, "[FURN_0006] Monitor Stand"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 56,
        "display_name": "Newspaper Rack",
        "lst_price": 1.28,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [1],
        "barcode": "2100001000004",
        "default_code": "FURN_0007",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [46, "[FURN_0007] Newspaper Rack"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 48,
        "display_name": "Small Shelf",
        "lst_price": 2.83,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_0008",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [38, "[FURN_0008] Small Shelf"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 47,
        "display_name": "Wall Shelf Unit",
        "lst_price": 1.98,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": "2100002000003",
        "default_code": "FURN_0009",
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [37, "[FURN_0009] Wall Shelf Unit"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 12,
        "display_name": "Customizable Desk (Steel, White)",
        "lst_price": 750.0,
        "standard_price": 500.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_0096",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": "160x80cm, with large legs.",
        "description": false,
        "product_tmpl_id": [9, "Customizable Desk"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [1, 2],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 13,
        "display_name": "Customizable Desk (Steel, Black)",
        "lst_price": 750.0,
        "standard_price": 500.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_0097",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": "160x80cm, with large legs.",
        "description": false,
        "product_tmpl_id": [9, "Customizable Desk"],
        "tracking": "none",
        "write_date": "2022-06-20 14:22:12",
        "available_in_pos": true,
        "attribute_line_ids": [1, 2],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 14,
        "display_name": "Customizable Desk (Aluminium, White)",
        "lst_price": 800.4,
        "standard_price": 500.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_0098",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": "160x80cm, with large legs.",
        "description": false,
        "product_tmpl_id": [9, "Customizable Desk"],
        "tracking": "none",
        "write_date": "2022-06-20 14:22:12",
        "available_in_pos": true,
        "attribute_line_ids": [1, 2],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 25,
        "display_name": "Office Chair Black",
        "lst_price": 120.5,
        "standard_price": 180.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [3, "Chairs"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_0269",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [17, "[FURN_0269] Office Chair Black"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 30,
        "display_name": "Individual Workplace",
        "lst_price": 885.0,
        "standard_price": 876.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_0789",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [22, "[FURN_0789] Individual Workplace"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 26,
        "display_name": "Corner Desk Left Sit",
        "lst_price": 85.0,
        "standard_price": 78.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_1118",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [18, "[FURN_1118] Corner Desk Left Sit"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 31,
        "display_name": "Acoustic Bloc Screens",
        "lst_price": 295.0,
        "standard_price": 287.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_6666",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [23, "[FURN_6666] Acoustic Bloc Screens"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 34,
        "display_name": "Large Meeting Table",
        "lst_price": 4000.0,
        "standard_price": 4500.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_6741",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": "Conference room table",
        "description": false,
        "product_tmpl_id": [26, "[FURN_6741] Large Meeting Table"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 5,
        "display_name": "Office Chair",
        "lst_price": 70.0,
        "standard_price": 55.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [3, "Chairs"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_7777",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [5, "[FURN_7777] Office Chair"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 8,
        "display_name": "Desk Combination",
        "lst_price": 450.0,
        "standard_price": 300.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_7800",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale":
            "Desk combination, black-brown: chair + desk + drawer.",
        "description": false,
        "product_tmpl_id": [8, "[FURN_7800] Desk Combination"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 29,
        "display_name": "Desk Stand with Screen",
        "lst_price": 2100.0,
        "standard_price": 2010.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_7888",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [21, "[FURN_7888] Desk Stand with Screen"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 33,
        "display_name": "Four Person Desk",
        "lst_price": 2350.0,
        "standard_price": 2500.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [2, "Desks"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_8220",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": "Four person modern office workstation",
        "description": false,
        "product_tmpl_id": [25, "[FURN_8220] Four Person Desk"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 32,
        "display_name": "Drawer",
        "lst_price": 110.5,
        "standard_price": 100.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_8855",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": "<p>Drawer with two routing possiblities.</p>",
        "product_tmpl_id": [24, "[FURN_8855] Drawer"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 6,
        "display_name": "Office Lamp",
        "lst_price": 40.0,
        "standard_price": 35.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_8888",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [6, "[FURN_8888] Office Lamp"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 27,
        "display_name": "Drawer Black",
        "lst_price": 25.0,
        "standard_price": 20.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_8900",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [19, "[FURN_8900] Drawer Black"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 35,
        "display_name": "Three-Seat Sofa",
        "lst_price": 1500.0,
        "standard_price": 1000.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_8999",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale":
            "Three Seater Sofa with Lounger in Steel Grey Colour",
        "description": false,
        "product_tmpl_id": [27, "[FURN_8999] Three-Seat Sofa"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 28,
        "display_name": "Flipover",
        "lst_price": 1950.0,
        "standard_price": 1700.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_9001",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [20, "[FURN_9001] Flipover"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "product"
      },
      {
        "id": 7,
        "display_name": "Office Design Software",
        "lst_price": 280.0,
        "standard_price": 235.0,
        "categ_id": [7, "All / Saleable / Software"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": "FURN_9999",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [7, "[FURN_9999] Office Design Software"],
        "tracking": "none",
        "write_date": "2022-06-20 14:43:10",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      },
      {
        "id": 64,
        "display_name": "Weekly Subscription",
        "lst_price": 1.0,
        "standard_price": 500.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": false,
        "taxes_id": [1],
        "barcode": false,
        "default_code": "Sub2",
        "to_weight": false,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [52, "[Sub2] Weekly Subscription"],
        "tracking": "none",
        "write_date": "2022-07-14 11:07:59",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "service"
      },
      {
        "id": 4,
        "display_name": "Virtual Home Staging",
        "lst_price": 38.25,
        "standard_price": 25.5,
        "categ_id": [5, "All / Saleable / Services"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": false,
        "to_weight": false,
        "uom_id": [4, "Hours"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [4, "Virtual Home Staging"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "service"
      },
      {
        "id": 3,
        "display_name": "Virtual Interior Design",
        "lst_price": 30.75,
        "standard_price": 20.5,
        "categ_id": [5, "All / Saleable / Services"],
        "pos_categ_id": [1, "Miscellaneous"],
        "taxes_id": [],
        "barcode": false,
        "default_code": false,
        "to_weight": false,
        "uom_id": [4, "Hours"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [3, "Virtual Interior Design"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "delivery",
        "type": "service"
      },
      {
        "id": 54,
        "display_name": "Whiteboard",
        "lst_price": 1.7,
        "standard_price": 0.0,
        "categ_id": [8, "All / Saleable / Office Furniture"],
        "pos_categ_id": false,
        "taxes_id": [1],
        "barcode": false,
        "default_code": false,
        "to_weight": true,
        "uom_id": [1, "Units"],
        "description_sale": false,
        "description": false,
        "product_tmpl_id": [44, "Whiteboard"],
        "tracking": "none",
        "write_date": "2022-06-20 14:34:07",
        "available_in_pos": true,
        "attribute_line_ids": [],
        "active": true,
        "invoice_policy": "order",
        "type": "product"
      }
    ]
  };

  final List<Bill> bills = [
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
  ];

  DetailShopViewModel(this._repo);

  getProducts() {
    allProducts = DetailShopResponse.fromJson(detailShopResponse).result ?? [];
    changeMenu(lastIndexMenu);
    notifyListeners();
  }

  getCategoryProducts() {
    categoryProducts =
        CategoryProductResponse.fromJson(categoryProductResponse).result ?? [];
    notifyListeners();
  }

  String get response => _response;

  set response(String response) {
    _response = response;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  homeMenu() {
    isHome = true;
    notifyListeners();
  }

  changeMenu(int index) {
    lastIndexMenu = index;
    isHome = false;
    products = allProducts
        .where((element) =>
            element.pos_categ_id is List<dynamic> &&
            element.pos_categ_id[0] == categoryProducts[lastIndexMenu].id)
        .toList();
    scrollToTop();
    notifyListeners();
  }

  scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 0),
        curve: Curves.ease,
      );
    }
  }

  void openPayPage() {
    _navigationService.pushEnterFadeExitDown(PayPage());
  }

  void openReviewPage() {
    _navigationService.pushEnterFadeExitDown(ReviewPage());
  }

  deleteBillItem(index) {
    bills.removeAt(index);
    notifyListeners();
  }
}
