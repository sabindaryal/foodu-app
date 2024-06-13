import 'package:ecommerce/view_modal/category_view_modal.dart';
import 'package:ecommerce/view_modal/discount_offer_view_modal.dart';
import 'package:ecommerce/view_modal/popular_view_modal.dart';
import 'package:ecommerce/view_modal/slider_view_modal.dart';
import 'package:ecommerce/view_modal/top_rated_product_view_modal.dart';
import 'package:ecommerce/views/navbar/cart.dart';
import 'package:ecommerce/views/navbar/home.dart';
import 'package:ecommerce/views/navbar/orders.dart';
import 'package:ecommerce/views/navbar/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoryViewModal>(context, listen: false).fetchCategoryList();
    Provider.of<SliderViewModal>(context, listen: false).fetchSliderApi();
    Provider.of<DiscountOfferViewModal>(context, listen: false)
        .fetchDiscountApi();
    Provider.of<PopularProductViewModal>(context, listen: false)
        .fetchPopularApi();
    Provider.of<TopRatedProductViewModel>(context, listen: false)
        .fetchTopRatedApi();
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Orderpage(),
    CartPage(),
    Profilepage(),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Products',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.green,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
