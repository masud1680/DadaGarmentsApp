import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

// working for choice division start
class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();

  late SingleValueDropDownController _cnt;


  @override
  void initState() {
    _cnt = SingleValueDropDownController();

    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();

    super.dispose();
  }
  // working for choice division end


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
                "Profile Information",
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
                          ),// when type focused border not working
                        ),
                        initialCountryCode: 'BD',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      )
                    ],
                  ),
                  // Select Division
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Division",
                        style: TextStyle(
                          color: Color(0XFF5B5B5B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      DropDownTextField(
                        controller: _cnt,
                        clearOption: true,
                        enableSearch: true,
                        clearIconProperty: IconProperty(color: Colors.green),
                        searchTextStyle: const TextStyle(color: Colors.red),
                        searchDecoration: const InputDecoration(
                            hintText: "Select your division"),
                        textFieldDecoration: InputDecoration(
                          hintText: "Uttara",
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

                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 5,
                        dropDownList: const [
                          DropDownValueModel(name: 'Rangpur', value: "value1"),
                          DropDownValueModel(
                              name: 'Dhaka',
                              value: "value2",
                              toolTipMsg:
                              "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                          DropDownValueModel(name: 'Khulna', value: "value3"),
                          DropDownValueModel(
                              name: 'Barishal',
                              value: "value4",
                              toolTipMsg:
                              "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                          DropDownValueModel(name: 'Rajshahi', value: "value5"),
                          DropDownValueModel(name: 'Sylhet', value: "value6"),
                          DropDownValueModel(name: 'Chittagong', value: "value7"),
                          DropDownValueModel(name: 'Mymensingh', value: "value8"),
                        ],
                        onChanged: (val) {},
                      ),
                    ],
                  ),
                  // Select District
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
                      DropDownTextField(
                        controller: _cnt,
                        clearOption: true,
                        enableSearch: true,
                        clearIconProperty: IconProperty(color: Colors.green),
                        searchTextStyle: const TextStyle(color: Colors.red),
                        searchDecoration: const InputDecoration(
                            hintText: "Select your district"),
                        textFieldDecoration: InputDecoration(
                          hintText: "Uttara",
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

                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 5,
                        dropDownList: const [
                          DropDownValueModel(name: 'Rangpur', value: "value1"),
                          DropDownValueModel(
                              name: 'Nilphamari',
                              value: "value2",
                              toolTipMsg:
                              "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                          DropDownValueModel(name: 'Panchagurh', value: "value3"),
                          DropDownValueModel(
                              name: 'Dinajpur',
                              value: "value4",
                              toolTipMsg:
                              "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                          DropDownValueModel(name: 'name5', value: "value5"),
                          DropDownValueModel(name: 'name6', value: "value6"),
                          DropDownValueModel(name: 'name7', value: "value7"),
                          DropDownValueModel(name: 'name8', value: "value8"),
                        ],
                        onChanged: (val) {},
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
                        minLines: 3,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Uttara",
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
                      "Save Changes",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }
}
