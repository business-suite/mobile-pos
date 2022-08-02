import 'package:flutter/material.dart';

enum LoadingState { LOADING, DONE, ERROR, EMPTY }
enum SizeStyle { SMALL, NORMAL, LARGE, SUPER }

//Network Config
const int CONNECT_TIMEOUT = 3000;
const int WRITE_TIMEOUT = 3000;
const int READ_TIMEOUT = 3000;

//time navigate to sign_in page
const int DELAY_SPLASH_PAGE = 500;

const Locale locale = Locale('vi', 'VN');

//get image url
String getImageUrl(String path) => path;

//Date time
const String ddMMyyyy = 'dd/MM/yyyy';
const String MMddyyyy = 'MM/dd/yyyy';


//ACCOUNT
const String APP_NAME = 'Business Suite Pos';
const String BASE_URL = 'http://35.214.179.117:8069';
const String HOST = '35.214.179.117';
const int PORT = 8069;
const String ODOO_DB = 'businesssuite_pos';





// API
const String API_AUTHENTICATE = '/web/session/authenticate';
const String API_LOGIN_WEB = '/web/login';
const String API_TWO_FACTOR_AUTHENTICATE = '/web/login/totp?redirect=%2Fweb%3F';
const String API_CALL_KW = '/web/dataset/call_kw/';
const String API_CALL_BUTTON = '/web/dataset/call_button';
const String API_AUTH_OTP = '/web/login/totp';
const String API_DESTROY_SESSION = '/web/session/destroy';
//METHOD
const String SEARCH_READ = "search_read";
const String READ = "read";
const String WRITE = "write";
//const String WRITE = "write";
//MODEL
const String AUTH_TOTP = "auth_totp.wizard";
//get shops
const String SHOPS = "pos.config";
const int LIMIT_SHOP = 80;
const String POS_CATEGORY = "pos.category";
const String POS_PRODUCT = "product.product";




