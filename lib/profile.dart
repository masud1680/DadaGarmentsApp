import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(color: Color(0xFFF5F5F5), height: 3.0),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              // profile pic & name
              SizedBox(
                height: 200,
                width: 200,
                child: Column(
                  spacing: 6,
                  children: [
                    // profile pic
                    CircleAvatar(
                        backgroundImage: AssetImage("assets/profile_pic_def.png"),
                      radius: 60,
                    ),
                    //profile name
                    Text(
                        "Md. Masud",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              //others details container
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFD4D4D4),
                      spreadRadius: 1,
                      blurRadius: 1
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)
                ),
                height: 400,
                width: double.infinity,
                child: Column(
                  spacing: 12,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFFEFAF6),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFFAFAFA),
                                spreadRadius: 1,
                                blurRadius: 1
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 60,
                      width: double.infinity,
                      child: ListTile(
                        leading: Image(
                            image: AssetImage("assets/profile_icon.png"),

                        ),
                        title: Text(
                          "My Profile",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Icon(Icons.navigate_next_rounded,color: Colors.grey,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFFEFAF6),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFFAFAFA),
                                spreadRadius: 1,
                                blurRadius: 1
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 60,
                      width: double.infinity,
                      child: ListTile(
                        leading: Image(
                          image: AssetImage("assets/myorder_icon.png"),

                        ),
                        title: Text(
                          "My Order",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Icon(Icons.navigate_next_rounded,color: Colors.grey,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFFEFAF6),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFFAFAFA),
                                spreadRadius: 1,
                                blurRadius: 1
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 60,
                      width: double.infinity,
                      child: ListTile(
                        leading: Image(
                          image: AssetImage("assets/offerorder_icon.png"),

                        ),
                        title: Text(
                          "Offer Order",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Icon(Icons.navigate_next_rounded,color: Colors.grey,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFFEFAF6),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFFAFAFA),
                                spreadRadius: 1,
                                blurRadius: 1
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 60,
                      width: double.infinity,
                      child: ListTile(
                        leading: Image(
                          image: AssetImage("assets/myreview_icon.png"),

                        ),
                        title: Text(
                          "My Review",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Icon(Icons.navigate_next_rounded,color: Colors.grey,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFFEFAF6),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFFAFAFA),
                                spreadRadius: 1,
                                blurRadius: 1
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 60,
                      width: double.infinity,
                      child: ListTile(
                        leading: Image(
                          image: AssetImage("assets/logout_icon.png"),

                        ),
                        title: Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
