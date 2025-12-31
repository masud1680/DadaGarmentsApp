import 'dart:developer';

import 'package:dadaborkahouse/controller/category.dart';
import 'package:dadaborkahouse/controller/home.dart';
import 'package:dadaborkahouse/view/home/widget/categories_card.dart';
import 'package:dadaborkahouse/view/home/widget/product_showcase_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../controller/base_url.dart';
import '../product/ui.dart';
import '../profile/ui.dart';

// final List<String> imgList = [
//   'https://i.ibb.co.com/KjX0XdPD/image-8.png',
//   'https://i.ibb.co.com/BVKvsQ3C/image-14.png',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://photosly.in/wp-content/uploads/2024/08/cute-girl-pic55.jpg',
// ];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  // fetch data from api
  // slider data
  List sliderImgList = [];
  List categoriesList = [];
  Map homeProductsList = {};

  void fetchData() async {
    isLoading = true;
    setState(() {});

    sliderImgList = await HomeController().fetchSliders();
    categoriesList = await CategoryController().fetchCategories();
    homeProductsList = await HomeController().fetchHomeProducts();
    // log("========${homeProductsList}===========");

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();

    super.initState();
  }

  // fast carousel slider start
  // int _current = 0;
  // final CarouselSliderController _controller = CarouselSliderController();
  //
  // late final List<Widget> imageSliders = sliderImgList
  //     .map(
  //       (item) => Container(
  //     margin: EdgeInsets.all(0.0),
  //
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //       child: Image.network(
  //         item,
  //         fit: BoxFit.cover,
  //         width: double.infinity,
  //       ),
  //     ),
  //   ),
  // )
  //     .toList();

  // fast carousel slider start end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image(
            image: AssetImage("assets/openNavbar_icon.png"),
            width: 20,
            height: 20,
          ),
        ),
        centerTitle: true,
        title: Image(image: AssetImage("assets/image_logo_dada.png")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
              child: Image(image: AssetImage("assets/person_icon.png")),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(color: Color(0xFFF5F5F5), height: 3.0),
        ),
      ),

      body: isLoading == true ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            spacing: 10,
            children: [
              SizedBox(height: 10),
              //Search box
              Row(
                children: [
                  //input search box
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.search,
                            color: Color(0xFFB3B3B3),
                            size: 30,
                          ),
                        ),
                        hintText: "Search Products",
                        hintStyle: TextStyle(color: Color(0xFFB3B3B3)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFF4A758),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage("assets/search_ditels_icon.png"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // slider
              Column(
                children: [
                  Stack(
                    children: [
                      // CarouselSlider(
                      //   items: imageSliders,
                      //   carouselController: _controller,
                      //   options: CarouselOptions(
                      //     viewportFraction: 1,
                      //     scrollDirection: Axis.horizontal,
                      //     autoPlay: true,
                      //     enlargeCenterPage: true,
                      //     aspectRatio: 2.5,
                      //     onPageChanged: (index, reason) {
                      //       setState(() {
                      //         _current = index;
                      //       });
                      //     },
                      //   ),
                      // ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150.0,
                          autoPlay: true,
                          viewportFraction: .9,
                        ),
                        items: sliderImgList.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      "${GetBaseUrl.imgBaseUrl}/${i['image']}",
                                    ),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffE4E4E7),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),

                      // Positioned(
                      //   bottom: 4,
                      //   left: 120,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: sliderImgList.asMap().entries.map((entry) {
                      //       return GestureDetector(
                      //         onTap: () => _controller.animateToPage(entry.key),
                      //         child: Container(
                      //           width: 8.0,
                      //           height: 8.0,
                      //           margin: EdgeInsets.symmetric(
                      //             vertical: 8.0,
                      //             horizontal: 4.0,
                      //           ),
                      //           decoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             color:
                      //                 (Theme.of(context).brightness ==
                      //                             Brightness.dark
                      //                         ? Colors.white
                      //                         : Color(0xFFF99B2B))
                      //                     .withOpacity(
                      //                       _current == entry.key ? 0.9 : 0.4,
                      //                     ),
                      //           ),
                      //         ),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Categories
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      color: Color(0xFF5B5B5B),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesList.length,
                      itemBuilder: (context, index) {
                        // print("choice color index : ${index}");
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen(whichPage: categoriesList[index]['name'], catId: categoriesList[index]['id'],),));
                          },
                          child: CategoriesCard(categories: categoriesList[index],),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),


              // showcase trading products
              // Hot Selling
              ProductShowCase( productList: homeProductsList['hot-selling'], cardName: 'Hot Selling', cardKeyName: 'hot-selling', reloadData: fetchData,),

              SizedBox(height: 20),
              // Top Selling
              ProductShowCase( productList: homeProductsList['top-selling'], cardName: 'Top Selling',cardKeyName: 'top-selling',reloadData: fetchData,),

              SizedBox(height: 20),
              // New Product
              ProductShowCase( productList: homeProductsList['new-product'], cardName: 'New Product',cardKeyName: 'new-product',reloadData: fetchData,),

              SizedBox(height: 20),

              //Party Abaya banner & cards
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFCE9D8),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 470,
                width: double.infinity,
                child: Column(
                  children: [
                    //Banner
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/PartyAbayaBanner_image.png",
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 140,
                          width: double.infinity,
                        ),

                        Positioned(
                          bottom: 10,
                          left: 115,
                          child: Column(
                            children: [
                              Text(
                                "Party Abaya",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              // View all Button
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFBB9563),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: 80,
                                height: 26,
                                child: Center(
                                  child: Text(
                                    "View all",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //cards
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 25,
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFD4D4D4),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 280,
                              width: 170,
                              child: Column(
                                spacing: 10,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/yellowBorkhaImage.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    child: Column(
                                      spacing: 12,
                                      children: [
                                        //product name & price
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Name
                                              Text(
                                                "Party Borkha Abaya Koliza",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              // price
                                              Row(
                                                spacing: 7,
                                                children: [
                                                  Text(
                                                    "2880",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    "3200",
                                                    style: TextStyle(
                                                      color: Color(0xFFB3B3B3),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1),
                                        // Add To Cart Button
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFFE5E5E5),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                              ),
                                            ],
                                          ),
                                          width: 110,
                                          height: 35,
                                          child: Center(
                                            child: Text(
                                              "Add To Cart",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
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
                          ),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFD4D4D4),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 280,
                              width: 170,
                              child: Column(
                                spacing: 10,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/redBorkhaImage.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    child: Column(
                                      spacing: 12,
                                      children: [
                                        //product name & price
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Name
                                              Text(
                                                "Party Borkha Abaya Koliza",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              // price
                                              Row(
                                                spacing: 7,
                                                children: [
                                                  Text(
                                                    "2880",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    "3200",
                                                    style: TextStyle(
                                                      color: Color(0xFFB3B3B3),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1),
                                        // Add To Cart Button
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFFE5E5E5),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                              ),
                                            ],
                                          ),
                                          width: 110,
                                          height: 35,
                                          child: Center(
                                            child: Text(
                                              "Add To Cart",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              //Embroidery Abaya banner & cards
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFCE9D8),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 470,
                width: double.infinity,
                child: Column(
                  children: [
                    //Banner
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/ambroideryBanner_image.png",
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 140,
                          width: double.infinity,
                        ),

                        Positioned(
                          bottom: 10,
                          left: 80,
                          child: Column(
                            children: [
                              Text(
                                "Ambroidery Abaya",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              // View all Button
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFBB9563),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: 80,
                                height: 26,
                                child: Center(
                                  child: Text(
                                    "View all",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //cards
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 25,
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFD4D4D4),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 280,
                              width: 170,
                              child: Column(
                                spacing: 10,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/yellowBorkhaImage.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    child: Column(
                                      spacing: 12,
                                      children: [
                                        //product name & price
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Name
                                              Text(
                                                "Party Borkha Abaya Koliza",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              // price
                                              Row(
                                                spacing: 7,
                                                children: [
                                                  Text(
                                                    "2880",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    "3200",
                                                    style: TextStyle(
                                                      color: Color(0xFFB3B3B3),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1),
                                        // Add To Cart Button
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFFE5E5E5),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                              ),
                                            ],
                                          ),
                                          width: 110,
                                          height: 35,
                                          child: Center(
                                            child: Text(
                                              "Add To Cart",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
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
                          ),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFD4D4D4),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 280,
                              width: 170,
                              child: Column(
                                spacing: 10,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/redBorkhaImage.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    child: Column(
                                      spacing: 12,
                                      children: [
                                        //product name & price
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Name
                                              Text(
                                                "Party Borkha Abaya Koliza",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              // price
                                              Row(
                                                spacing: 7,
                                                children: [
                                                  Text(
                                                    "2880",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    "3200",
                                                    style: TextStyle(
                                                      color: Color(0xFFB3B3B3),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1),
                                        // Add To Cart Button
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFFE5E5E5),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                              ),
                                            ],
                                          ),
                                          width: 110,
                                          height: 35,
                                          child: Center(
                                            child: Text(
                                              "Add To Cart",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}




