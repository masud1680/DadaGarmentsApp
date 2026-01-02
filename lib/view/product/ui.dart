import 'package:dadaborkahouse/controller/category.dart';
import 'package:dadaborkahouse/controller/home.dart';
import 'package:dadaborkahouse/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../controller/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.whichPage,  this.catId, this.cardKeyName, });
  final String whichPage;
  final int? catId;
  final String? cardKeyName;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isLoading = false;
  List productList = [];

  void getAllProducts() async {
    isLoading = true;
    setState(() {});



    if(widget.catId != null){

      int? catId = widget.catId ?? 0;
      productList = await CategoryController().fetchSingleCategoryProducts(catId: catId);
    }else{

      if(widget.cardKeyName != null){
        productList = await CategoryController().fetchSingleKeyCategoryProducts(catNameKey: widget.cardKeyName ?? 'hot-selling');
        
      }else{
        productList = await ProductController().fetchAllProducts();
      }

    }





    isLoading = false;
    setState(() {});
    // print('=====${productList}=========');
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllProducts();

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
            onTap:  () {
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
          widget.whichPage ?? 'Product',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(color: Color(0xFFF5F5F5), height: 3.0),
        ),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 20),
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

                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 4,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.62,
                      ),
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        //single card
                        return ProductCard(product: productList[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
