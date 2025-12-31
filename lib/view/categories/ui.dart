
import 'dart:developer';

import 'package:dadaborkahouse/view/categories/widget/category_card.dart';
import 'package:flutter/material.dart';


import '../../controller/category.dart';
import '../cart/ui.dart';
import '../product/ui.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  bool isLoading = false;

  // fetch data from api


  List categoriesList = [];


  void fetchData() async {
    isLoading = true;
    setState(() {});


    categoriesList = await CategoryController().fetchCategories();

    // log("========${categoriesList}===========");

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
        centerTitle: true,
        title: Text(
          "Categories",
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
              focusColor: Colors.transparent ,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
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

      body: isLoading == true ? Center(
        child: CircularProgressIndicator(),
      ) : Container(
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
                // search box
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
            SizedBox(height: 20),
            //Category Card
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.8,
                ),
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen(whichPage: categoriesList[index]['name'], catId: categoriesList[index]['id'],),));
                    },
                      child: CategoryCards(categoryItem: categoriesList[index],),
                  );
                },
              ),
            ),
          ],
        ),
      ),




    );
  }
}


