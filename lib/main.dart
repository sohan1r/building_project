import 'package:building_project/OrderItemsPages/orderItems.dart';
import 'package:building_project/Screens/placeOrderPage.dart';
import 'package:building_project/Screens/searchPage.dart';
import 'package:building_project/bottom_nav_screen/AccountSection/addAdress.dart';
import 'package:building_project/bottom_nav_screen/AccountSection/myOrder.dart';
import 'package:building_project/bottom_nav_screen/cart.dart';
import 'package:building_project/bottom_nav_screen/home.dart';
import 'package:building_project/bottom_nav_screen/materialPage.dart';
import 'package:building_project/bottom_nav_screen/account.dart';
import 'package:building_project/menuSection/postRequirement.dart';
import 'package:building_project/orderView.dart';
import 'package:flutter/material.dart';
import 'package:building_project/auth_screen/log_in.dart';
import 'package:building_project/auth_screen/register.dart';
import 'package:building_project/auth_screen/reset_password.dart';
import 'package:building_project/Screens/dashboard.dart';
import 'package:building_project/drawerItems/drawerWidget.dart';
import 'package:building_project/Sellers/seller_registration.dart';
import 'package:building_project/Sellers/seller_type.dart';
import 'package:building_project/auth_screen/userProfile.dart';
import 'package:building_project/bottom_nav_screen/AccountSection/userAddress.dart';
import 'package:building_project/menuSection/hotDeals.dart';
import 'package:building_project/menuSection/favorite.dart';
import 'package:building_project/menuSection/InteriorPages/interiorDesign.dart';
import 'package:building_project/menuSection/InteriorPages/interiorDesignItems.dart';
import 'package:building_project/menuSection/serviceTabScreens/buildingServices.dart';
import 'package:building_project/menuSection/serviceTabScreens/consultingServices.dart';
import 'package:building_project/menuSection/serviceTabScreens/contractingServices.dart';
import 'package:building_project/menuSection/services.dart';
import 'package:building_project/menuSection/sellersNearby.dart';
import 'package:building_project/menuSection/postRequirement.dart';
import 'package:building_project/bottom_nav_screen/AccountSection/location.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyLogin(),
      routes: {
        'orderItem': (context) => OrderItem(),
        'AddAdress': (context) => AddAddress(),
        'placeOrder': (context) => PlaceOrderPage(),
        'myOrder': (context) => MyOrder(),
        'locaton': (context) => const Location(),
        'postRequirement': (context) => const PostRequirement(),
        'sellersNearby': (context) => SellersNearby(),
        'services': (context) => Services(),
        'InteriorPageItems': (context) => InteriorDesignItems(),
        'consultingServices': (context) => ConsultingServices(),
        'buildingServices': (context) => BuildingServices(),
        'contractingServices': (context) => ContractingServices(),
        'interiorDesign': (context) => InteriorDesign(),
        'favoritePage': (context) => const favoritePage(),
        'hotDeals': (context) => HotDeals(),
        'userAddress': (context) => const userAddress(),
        'register': (context) => const MyRegister(),
        'login': (context) => const MyLogin(),
        'resetPassword': (context) => const ResetPassword(),
        'profile': (context) => const MyProfile(),
        'dashboard': (context) => const Dashboard(),
        'homePage': (context) => const HomePage(),
        'cartPage': (context) => const CartPage(),
        'materialPage': (context) => const MaterialCategory(),
        'menuPage': (context) => const AccountPage(),
        'drawerWidget': (context) => const DrawerPage(),
        'searchPage': (context) => const SearchPage(),
        'sellerType': (context) => SellerType(),
        'sellerRegistration': (context) => const SellerRegistration(),
      }));
}
