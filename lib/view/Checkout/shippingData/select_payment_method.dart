//
// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// import '../../widgets/long_button.dart';
//
// void inputShippingInformationBottomSheetBar(BuildContext context, ) {
//   showModalBottomSheet(
//
//     context: context,
//     builder: (context) {
//       return Container(
//         padding: EdgeInsets.all(20),
//         // height: 700,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               //Simple Title
//               Text(
//                 "Profile Information",
//                 style: TextStyle(
//                   color: Color(0XFF5B5B5B),
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 25),
//               //Your name
//               Column(
//                 spacing: 15,
//                 children: [
//                   // Name
//                   Column(
//                     crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                     spacing: 6,
//                     children: [
//                       Text(
//                         "Name",
//                         style: TextStyle(
//                           color: Color(0XFF5B5B5B),
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       TextField(
//                         // controller: userName,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           hintText: "Your name",
//                           hintStyle: TextStyle(
//                             color: Color(0xFFD4D4D4),
//                           ),
//                           enabledBorder:
//                           OutlineInputBorder(
//                             borderRadius:
//                             BorderRadius.circular(
//                               12,
//                             ),
//                             borderSide: BorderSide(
//                               color: Color(
//                                 0xFFCCCCCC,
//                               ),
//                               width: 2,
//                             ),
//                           ),
//                           focusedBorder:
//                           OutlineInputBorder(
//                             borderRadius:
//                             BorderRadius.circular(
//                               12,
//                             ),
//                             borderSide: BorderSide(
//                               color: Color(
//                                 0xFFCCCCCC,
//                               ),
//                               width: 2,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Phone Number
//                   Column(
//                     crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                     spacing: 6,
//                     children: [
//                       Text(
//                         "Phone Number",
//                         style: TextStyle(
//                           color: Color(0XFF5B5B5B),
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       IntlPhoneField(
//                         // controller: userPhone,
//                         decoration: InputDecoration(
//                           enabledBorder:
//                           OutlineInputBorder(
//                             borderRadius:
//                             BorderRadius.circular(
//                               12,
//                             ),
//                             borderSide: BorderSide(
//                               color: Color(
//                                 0xFFCCCCCC,
//                               ),
//                               width: 2,
//                             ),
//                           ),
//
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius:
//                             BorderRadius.circular(12),
//                             borderSide: BorderSide(
//                               color: Color(0xFFCCCCCC),
//                               width: 2,
//                             ),
//                           ), // when type focused border not working
//                         ),
//                         initialCountryCode: 'BD',
//                         onChanged: (phone) {
//                           print(phone.completeNumber);
//                         },
//                       ),
//                     ],
//                   ),
//                   // Select Division
//                   // Column(
//                   //   crossAxisAlignment: CrossAxisAlignment.start,
//                   //   spacing: 6,
//                   //   children: [
//                   //     Text(
//                   //       "Division",
//                   //       style: TextStyle(
//                   //         color: Color(0XFF5B5B5B),
//                   //         fontSize: 15,
//                   //         fontWeight: FontWeight.w600,
//                   //       ),
//                   //     ),
//                   //     DropDownTextField(
//                   //       controller: _cnt,
//                   //       clearOption: true,
//                   //       enableSearch: true,
//                   //       clearIconProperty: IconProperty(color: Colors.green),
//                   //       searchTextStyle: const TextStyle(color: Colors.red),
//                   //       searchDecoration: const InputDecoration(
//                   //           hintText: "Select your division"),
//                   //       textFieldDecoration: InputDecoration(
//                   //         hintText: "Uttara",
//                   //         hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
//                   //         enabledBorder: OutlineInputBorder(
//                   //           borderRadius: BorderRadius.circular(12),
//                   //           borderSide: BorderSide(
//                   //             color: Color(0xFFCCCCCC),
//                   //             width: 2,
//                   //           ),
//                   //         ),
//                   //         focusedBorder: OutlineInputBorder(
//                   //           borderRadius: BorderRadius.circular(12),
//                   //           borderSide: BorderSide(
//                   //             color: Color(0xFFCCCCCC),
//                   //             width: 2,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //
//                   //       validator: (value) {
//                   //         if (value == null) {
//                   //           return "Required field";
//                   //         } else {
//                   //           return null;
//                   //         }
//                   //       },
//                   //       dropDownItemCount: 5,
//                   //       dropDownList: const [
//                   //         DropDownValueModel(name: 'Rangpur', value: "value1"),
//                   //         DropDownValueModel(
//                   //             name: 'Dhaka',
//                   //             value: "value2",
//                   //             toolTipMsg:
//                   //             "DropDownButton is a widgets that we can use to select one unique value from a set of values"),
//                   //         DropDownValueModel(name: 'Khulna', value: "value3"),
//                   //         DropDownValueModel(
//                   //             name: 'Barishal',
//                   //             value: "value4",
//                   //             toolTipMsg:
//                   //             "DropDownButton is a widgets that we can use to select one unique value from a set of values"),
//                   //         DropDownValueModel(name: 'Rajshahi', value: "value5"),
//                   //         DropDownValueModel(name: 'Sylhet', value: "value6"),
//                   //         DropDownValueModel(name: 'Chittagong', value: "value7"),
//                   //         DropDownValueModel(name: 'Mymensingh', value: "value8"),
//                   //       ],
//                   //       onChanged: (val) {},
//                   //     ),
//                   //   ],
//                   // ),
//                   // Select District
//                   // Column(
//                   //   crossAxisAlignment: CrossAxisAlignment.start,
//                   //   spacing: 6,
//                   //   children: [
//                   //     Text(
//                   //       "District",
//                   //       style: TextStyle(
//                   //         color: Color(0XFF5B5B5B),
//                   //         fontSize: 15,
//                   //         fontWeight: FontWeight.w600,
//                   //       ),
//                   //     ),
//                   //     DropDownTextField(
//                   //       controller: _cnt,
//                   //       clearOption: true,
//                   //       enableSearch: true,
//                   //       clearIconProperty: IconProperty(color: Colors.green),
//                   //       searchTextStyle: const TextStyle(color: Colors.red),
//                   //       searchDecoration: const InputDecoration(
//                   //           hintText: "Select your district"),
//                   //       textFieldDecoration: InputDecoration(
//                   //         hintText: "Uttara",
//                   //         hintStyle: TextStyle(color: Color(0xFFD4D4D4)),
//                   //         enabledBorder: OutlineInputBorder(
//                   //           borderRadius: BorderRadius.circular(12),
//                   //           borderSide: BorderSide(
//                   //             color: Color(0xFFCCCCCC),
//                   //             width: 2,
//                   //           ),
//                   //         ),
//                   //         focusedBorder: OutlineInputBorder(
//                   //           borderRadius: BorderRadius.circular(12),
//                   //           borderSide: BorderSide(
//                   //             color: Color(0xFFCCCCCC),
//                   //             width: 2,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //
//                   //       validator: (value) {
//                   //         if (value == null) {
//                   //           return "Required field";
//                   //         } else {
//                   //           return null;
//                   //         }
//                   //       },
//                   //       dropDownItemCount: 5,
//                   //       dropDownList: const [
//                   //         DropDownValueModel(name: 'Rangpur', value: "value1"),
//                   //         DropDownValueModel(
//                   //             name: 'Nilphamari',
//                   //             value: "value2",
//                   //             toolTipMsg:
//                   //             "DropDownButton is a widgets that we can use to select one unique value from a set of values"),
//                   //         DropDownValueModel(name: 'Panchagurh', value: "value3"),
//                   //         DropDownValueModel(
//                   //             name: 'Dinajpur',
//                   //             value: "value4",
//                   //             toolTipMsg:
//                   //             "DropDownButton is a widgets that we can use to select one unique value from a set of values"),
//                   //         DropDownValueModel(name: 'name5', value: "value5"),
//                   //         DropDownValueModel(name: 'name6', value: "value6"),
//                   //         DropDownValueModel(name: 'name7', value: "value7"),
//                   //         DropDownValueModel(name: 'name8', value: "value8"),
//                   //       ],
//                   //       onChanged: (val) {},
//                   //     ),
//                   //   ],
//                   // ),
//                   // Address
//                   Column(
//                     crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                     spacing: 6,
//                     children: [
//                       Text(
//                         "Address",
//                         style: TextStyle(
//                           color: Color(0XFF5B5B5B),
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       TextFormField(
//                         // controller: userAddress,
//                         minLines: 3,
//                         maxLines: 3,
//                         keyboardType:
//                         TextInputType.multiline,
//                         decoration: InputDecoration(
//                           hintText: "Uttara",
//                           hintStyle: TextStyle(
//                             color: Color(0xFFD4D4D4),
//                           ),
//                           enabledBorder:
//                           OutlineInputBorder(
//                             borderRadius:
//                             BorderRadius.circular(
//                               12,
//                             ),
//                             borderSide: BorderSide(
//                               color: Color(
//                                 0xFFCCCCCC,
//                               ),
//                               width: 2,
//                             ),
//                           ),
//                           focusedBorder:
//                           OutlineInputBorder(
//                             borderRadius:
//                             BorderRadius.circular(
//                               12,
//                             ),
//                             borderSide: BorderSide(
//                               color: Color(
//                                 0xFFCCCCCC,
//                               ),
//                               width: 2,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   // save changes buttons
//                   InkWell(
//                     // onTap: () {
//                     //   // print("Save Changes clicked...");
//                     //   var shippingUserInformation = {
//                     //     'customer_name' : userName,
//                     //     'customer_phone' : userPhone,
//                     //     'address' : userAddress
//                     //
//                     //   };
//                     //   log("======$shippingUserInformation=============");
//                     //   FlutterSecureStorage storage = FlutterSecureStorage();
//                     //   storage.write(key: 'shippingUserInformation', value: jsonEncode(shippingUserInformation));
//                     //   Navigator.pop(context);
//                     // },
//                     child: LongButton(
//                       btnName: "Save Changes",
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//
//
//
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }