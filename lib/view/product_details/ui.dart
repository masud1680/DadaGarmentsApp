import 'dart:developer';

import 'package:dadaborkahouse/controller/base_url.dart';
import 'package:dadaborkahouse/controller/cart.dart';
import 'package:dadaborkahouse/controller/product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:readmore/readmore.dart';

import '../auth/login/ui.dart';
import '../cart/ui.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});
  final int productId;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isLoading = true;
  Map productData = {};

  void fetchData() async {
    isLoading = true;
    setState(() {});

    productData = await ProductController().fetchSingleProductDetails(
      productId: widget.productId,
    );
    // log('========$productData====');
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState

    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Color(0xFFF6F6F6),
              radius: 2,
              child: Image(
                image: AssetImage("assets/mask_group.png"),
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Product Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: InkWell(
              focusColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFF5F5F5),
                    child: Image(image: AssetImage("assets/cart_icon.png")),
                  ),
                  Positioned(
                    top: 6,
                    right: 3,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Color(0xFFF4A758),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(color: Color(0xFFF5F5F5), height: 3.0),
        ),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15,
                  children: [
                    // Product image card
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F2ED),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFF5F5F5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 400,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   // image: FadeInImage(placeholder: NetworkImage(url), image: AssetImage("assets/product_details.png")) ,
                              //
                              //   fit: BoxFit.fill,
                              // ),
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 223,
                            height: 293,

                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/loading_img/noImage.jpg',
                              image:
                                  '${GetBaseUrl.imgBaseUrl}/${productData['image']}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 71,
                            width: 223,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: productData['gallery'].length,
                              itemBuilder: (context, index) {
                                // print("choice color index : ${index}");
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),

                                    // color: Colors.green,
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/loading_img/noImage.jpg',
                                    image:
                                        '${GetBaseUrl.imgBaseUrl}/${productData['gallery'][index]}',
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //product name price favorite
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "${productData['title']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),

                            CircleAvatar(
                              backgroundColor: Color(0xFFF6F6F6),
                              radius: 20,
                              child: Icon(
                                Icons.favorite,
                                color: Color(0xFFF99B2B),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${productData['brand']}",
                          style: TextStyle(
                            color: Color(0xFF757575),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        // price
                        Row(
                          spacing: 7,
                          children: [
                            Text(
                              "${productData['price']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "${productData['old_price']}",
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // color choice
                    Column(
                      children: [
                        // color title
                        Row(
                          spacing: 10,
                          children: [
                            Text(
                              "Color :",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Black",
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        // color circle
                        Row(
                          spacing: 10,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFFF99B2B),
                                  width: 2,
                                ),
                              ),
                              width: 30,
                              height: 30,
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFFF99B2B),
                                  width: 2,
                                ),
                              ),
                              width: 30,
                              height: 30,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFFF99B2B),
                                  width: 2,
                                ),
                              ),
                              width: 30,
                              height: 30,
                              child: CircleAvatar(backgroundColor: Colors.red),
                            ),
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFFF99B2B),
                                  width: 2,
                                ),
                              ),
                              width: 30,
                              height: 30,
                              child: CircleAvatar(
                                backgroundColor: Colors.brown,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFFF99B2B),
                                  width: 2,
                                ),
                              ),
                              width: 30,
                              height: 30,
                              child: CircleAvatar(backgroundColor: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Size
                    Column(
                      spacing: 5,
                      children: [
                        // color title
                        Row(
                          spacing: 10,
                          children: [
                            Text(
                              "Size :",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "38",
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        // color circle
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            spacing: 5,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFD6D3D1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                width: 50,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "36",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF4A758),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFD6D3D1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                width: 50,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "38",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFD6D3D1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                width: 50,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "40",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFD6D3D1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                width: 50,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "42",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFD6D3D1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                width: 50,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "44",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // stock
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // size
                        Row(
                          spacing: 10,
                          children: [
                            Text(
                              "Stocks :",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${productData['stock']}",
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        // category
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Row(
                            spacing: 10,
                            children: [
                              Text(
                                "Category :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${productData['category']}",
                                style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              color: Colors.grey,
                              height: 2,
                              width: 100,
                            ),
                          ],
                        ),

                        ReadMoreText(
                          "${productData['description']}",
                          style: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          trimMode: TrimMode.Line,
                          trimLines: 4,
                          colorClickableText: Colors.pink,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: 'Hide less',
                          moreStyle: TextStyle(
                            color: Color(0xFF737373),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // buttons add to card & bye now
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        bottom: 20,
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          Flexible(
                            child: InkWell(
                              onTap: () async {
                                // print("Add To Cart clicked...");
                                int statusCode = await CartController()
                                    .addToCat(
                                      productId: productData['id'],
                                      quantity: 1,
                                    );
                                if (statusCode == 200) {
                                  fetchData();
                                  EasyLoading.showSuccess(
                                    "Product Add Successful",
                                  );
                                } else if (statusCode == 401) {
                                  EasyLoading.showError('Unauthorized');
                                  final storage = FlutterSecureStorage();
                                  storage.deleteAll();

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFD4D4D4),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "Add To Cart",
                                    style: TextStyle(
                                      color: Color(0xFFA1A1A1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                print("Buy Now clicked...");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF4A758),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFD4D4D4),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "Buy Now",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
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
    );
  }
}
