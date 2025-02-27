
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class Detailwidgets extends StatelessWidget {
  const Detailwidgets({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.title,
    required this.description,
    required this.delete,
  });

  final double screenHeight;
  final double screenWidth;
  final String title;
  final String description;
  final VoidCallback? delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.15,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: const Color.fromARGB(255, 233, 233, 233),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Material(
                  shadowColor: Colors.black,
                  elevation: 25,
                  child: Container(
                    height: screenHeight * 0.14,
                    color: const Color.fromARGB(255, 230, 230, 230),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              const Icon(
                                Icons.turned_in_sharp,
                                color: black,
                                size: 17,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Expanded(
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 82, 82, 82),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.004),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.description_outlined,
                                color: Color.fromARGB(255, 104, 104, 104),
                                size: 17,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Flexible(
                                child: Text(
                                  description,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 104, 104, 104),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IconButton.outlined(
                       color: const Color.fromARGB(255, 247, 115, 106),
                      onPressed: delete, icon: Icon(Icons.delete_sweep))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
