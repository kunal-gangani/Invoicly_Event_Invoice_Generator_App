import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_generator/Globals/event_details.dart';
import 'package:invoice_generator/Views/HomePage/utils/carousel_container.dart';
import 'package:invoice_generator/Views/HomePage/utils/event_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text(
          "EventMingle",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 175.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CarouselSlider(
                  items: eventDetailsList
                      .map(
                        (e) => CarouselContainer(
                          context: context,
                          imageUrl: e,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayInterval: const Duration(
                      seconds: 2,
                    ),
                    autoPlay: true,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Types of Events",
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ...typesOfEvents.map(
                (e) => widgetDetails(
                  e: e,
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
