// ignore_for_file: sort_child_properties_last

import 'package:fitness_app/models/catergery_model.dart';
import 'package:fitness_app/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //set catergory model in the list
  List<CatergoryModel> catergories = [];
  //GET catergory list
  void _getCatergories() {
    catergories = CatergoryModel.getCatergories();
  }

  //set diet moden in the list
  List<DietModel> diets = [];

  //GET diets list
  void _getDiets() {
    diets = DietModel.getDiets();
  }

  //get information
  void _getInfo() {
    catergories = CatergoryModel.getCatergories();
    diets = DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getDiets();
    _getCatergories();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      //search bar
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          _catergoriesSection(),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Recomandation\nfor Diets.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _dietSection(),
            ],
          )
        ],
      ),
    );
  }

  Container _dietSection() {
    return Container(
      color: Colors.white,
      height: 240,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            width: 210,
            decoration: BoxDecoration(
              color: diets[index].boxColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(diets[index].iconPath),
                Text(
                  diets[index].name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                //add view button
                Container(
                  height: 45,
                  width: 130,
                  child: const Center(
                    child: Text(
                      "View",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        diets[index].viewIsSelected
                            ? const Color(0xff9DCEFF)
                            : Colors.transparent,
                        diets[index].viewIsSelected
                            ? const Color(0xff92A3FD)
                            : Colors.transparent,
                      ]),
                      borderRadius: BorderRadius.circular(50)),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 25,
        ),
        itemCount: diets.length,
        scrollDirection: Axis.horizontal, //without these can't display
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
      ),
    );
  }

  Column _catergoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Catergory",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 120,

          //list items show
          child: ListView.separated(
            //add catgr items
            itemCount: catergories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: catergories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)),
                //add curcle
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      //add icons
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(catergories[index].iconPath),
                      ),
                    ),
                    //add text to under the icons
                    Text(
                      catergories[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 14,
            ),
            //add search icon left side
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assests/icons/Search.svg'),
            ),
            //add search icon right side
            suffixIcon: SizedBox(
              width: 100, //with out cant displat hint text
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.8),
                      child: SvgPicture.asset('assests/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Breackfast",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0, //remove the shadow
      centerTitle: true,
      //create svg icons
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          //add icons
          child: SvgPicture.asset(
            'assests/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),

          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        //make clickable
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            //add icons
            child: SvgPicture.asset(
              'assests/icons/dots.svg',
              height: 10,
              width: 10,
            ),

            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
