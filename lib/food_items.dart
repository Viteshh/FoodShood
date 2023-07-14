import 'package:flutter/material.dart';

List<FoodItem> foodItems = [
  FoodItem(
    imagePath: 'assets/image/image 2.png',
    name: 'Food 1',
    rate: '4.5',
  ),
  FoodItem(
    imagePath: 'assets/image/Mask Group.png',
    name: 'Food 2',
    rate: '3.8',
  ),
  // Add more food items as needed
];

class FoodItem {
  final String imagePath;
  final String name;
  final String rate;

  FoodItem({required this.imagePath, required this.name, required this.rate});
}

class FoodTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FoodCard(
            imagePath: foodItems[index].imagePath,
            name: foodItems[index].name,
            rate: foodItems[index].rate,
          ),
        );
      },
    );
  }
}

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String rate;

  const FoodCard({
    required this.imagePath,
    required this.name,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 30),
      // child: Column(
      //   children: [
      //     Container(
      //         width: 120,
      //         height: 180,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(30), color: Colors.amber),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.all(8.0),
      //               child: Image.asset(
      //                 imagePath,
      //                 // width: double.infinity,
      //               ),
      //             ),
      //             Text(name),
      //             Text("Price: $rate")
      //           ],
      //         ))
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40, 120, 40, 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Veggies Tom Mix',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      'N1,900',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(250, 250, 74, 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, -50.9),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/image/Mask Group.png',
                width: 205,
                height: 270,
              ),
            ),
          ),
        ],
      ),

      // child: Card(
      //   elevation: 2,
      //   child: Column(
      //     children: [
      // Expanded(
      //   child: Padding(
      //     padding: EdgeInsets.all(8.0),
      //     child: SvgPicture.asset(
      //       imagePath,
      //       width: double.infinity,
      //     ),
      //   ),
      // ),
      //       Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Text(
      //           name,
      //           style: TextStyle(
      //             fontSize: 16,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Text(
      //           'Rate: $rate',
      //           style: TextStyle(
      //             fontSize: 14,
      //             color: Colors.grey,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // ),
      // ],
    );
    // );
  }
}
