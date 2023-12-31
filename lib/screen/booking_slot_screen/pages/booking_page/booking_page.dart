import 'package:carparking/screen/booking_slot_screen/controller/parking_controller.dart';
import 'package:carparking/screen/booking_slot_screen/payment_screen/upiPaymentExampleHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../config/colors.dart';

class BookingPage extends StatelessWidget {
  final String slotName;
  final String slotId;
  const BookingPage({super.key, required this.slotId, required this.slotName});

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade200,
        title: const Text(
          "BOOK SLOT",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animation/running_car.json',
                    width: 300,
                    height: 200,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Book Now 😊",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: balckColor,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Enter your name ",
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: lightBg,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: balckColor,
                        ),
                        hintText: "Enter name",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Choose Slot Time (in Minuits)",
                  )
                ],
              ),
              SizedBox(height: 10),
              Obx(
                () => Slider(
                  thumbColor: balckColor,
                  activeColor: balckColor,
                  inactiveColor: lightBg,
                  label: parkingController.parkingHours.value.toString(),
                  value: parkingController.parkingHours.value,
                  onChanged: (v) {
                    parkingController.parkingHours.value = v;
                    parkingController.amountCalculator();
                  },
                  divisions: 5,
                  min: 10,
                  max: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("10"),
                    Text("20"),
                    Text("30"),
                    Text("40"),
                    Text("50"),
                    Text("60"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Your Slot Name",
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: balckColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        slotName,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Amount to Be Pay"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            size: 30,
                            color: balckColor,
                          ),
                          Obx(
                            () => Text(
                              parkingController.amountPay.value.toString(),
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: balckColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => UpiPaymentExampleHomePage(
                            slotId: slotId,
                            paymentId: parkingController.amountPay.value.toDouble(),
                          )));
                      parkingController.updateData(slotId);

                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                      decoration: BoxDecoration(
                        color: balckColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "PAY NOW",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
