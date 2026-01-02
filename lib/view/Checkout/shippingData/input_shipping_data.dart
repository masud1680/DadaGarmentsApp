import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../widgets/long_button.dart';

class InputShippingData extends StatefulWidget {
  const InputShippingData({super.key, required this.whichBtn});
  final String whichBtn;
  @override
  State<InputShippingData> createState() => _InputShippingDataState();
}

class _InputShippingDataState extends State<InputShippingData> {
  TextEditingController userName = TextEditingController();
String userCompletePhoneNumber  = "";
  TextEditingController userPhone = TextEditingController();

  TextEditingController userAddress = TextEditingController();
  TextEditingController userDistrict = TextEditingController();
  TextEditingController userUpazila = TextEditingController();
  TextEditingController userStreet = TextEditingController();

  bool isLoading = false;
  Map userShippingInformation = {};

  void fetchData() async {
    isLoading = true;
    setState(() {});

    FlutterSecureStorage storage = FlutterSecureStorage();
    var sui = await storage.read(key: 'shippingUserInformation');
    if (sui != null) {
      userShippingInformation = jsonDecode(sui);
      // log('=============$userShippingInformation==========');
      userName.text = userShippingInformation['customer_name'];
      userPhone.text = userShippingInformation['customer_phone'];

      userDistrict.text = userShippingInformation['district'];

      userUpazila.text = userShippingInformation['upazila'];

      userStreet.text = userShippingInformation['street'];
      userAddress.text = userShippingInformation['address'];
    }
    isLoading = false;
    // setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.whichBtn == 'change') {
      fetchData();
    }
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
        title: Image(image: AssetImage("assets/image_logo_dada.png")),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(color: Color(0xFFF5F5F5), height: 3.0),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              //Simple Title
              Text(
                "Shipping Information",
                style: TextStyle(
                  color: Color(0XFF5B5B5B),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 25),
              //Your name
              Column(
                spacing: 15,
                children: [
                  // Name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: userName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Your name",
                          hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Phone Number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IntlPhoneField(
controller: userPhone,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ), // when type focused border not working
                        ),
                        initialCountryCode: 'BD',
                        onChanged: (phone) {
                          log("==============${phone.completeNumber}==========");
                           userCompletePhoneNumber = phone.completeNumber ;

                        },
                      ),
                    ],
                  ),
                  // district
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "District",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: userDistrict,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Your district",
                          hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // upazila
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Upazila",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: userUpazila,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Your upazila",
                          hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // street
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Street",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: userStreet,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Your street",
                          hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Address
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextFormField(
                        controller: userAddress,
                        minLines: 3,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Detail address",
                          hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60),
              // save changes buttons
              InkWell(
                onTap: () {
                  print("Save Changes clicked...");
                  var shippingUserInformation = {
                    'customer_name': userName.text,
                    // 'customer_phone': userPhone.text,
                    'customer_phone': userCompletePhoneNumber,
                    'district' : userDistrict.text,
                    'upazila' : userUpazila.text,
                    'street' : userStreet.text,
                    'address': userAddress.text,
                  };
                  log("======$shippingUserInformation=============");
                  FlutterSecureStorage storage = FlutterSecureStorage();
                  storage.write(
                    key: 'shippingUserInformation',
                    value: jsonEncode(shippingUserInformation),
                  );
                  Navigator.pop(context);
                },

                child: LongButton(btnName: "Save Changes"),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
