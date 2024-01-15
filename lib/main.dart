
import 'package:flutter/material.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  product productlist = product();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "My Bag",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productlist.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 104,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: const [
                              BoxShadow(
                                  color:Colors.grey,
                                  spreadRadius: 2,
                                  blurRadius:2,
                                  offset: Offset(2,2)
                              )
                            ]
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 140,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Image(
                                image: AssetImage(
                                  productlist.data[index]["image"],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0, left: 3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productlist.data[index]["title"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "Color :",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.0,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                "${productlist.data[index]["color"]}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "Size : ",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.0,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                "${productlist.data[index]["size"]}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (productlist.data[index]["quantity"] != 1) {
                                                productlist.data[index]["quantity"]--;
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(50),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(2, 2),
                                                )
                                              ],
                                            ),
                                            child: const Icon(Icons.remove),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            productlist.data[index]['quantity']
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (productlist.data[index]["quantity"] == 4) {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        "Congratulations!",
                                                      ),
                                                      content: Text(
                                                          '''You have added 5 ${productlist.data[index]["title"] } on your bag!'''),
                                                      actions: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            height: 50,
                                                            width:
                                                            MediaQuery.of(context).size.width,
                                                            decoration:
                                                            BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  50.0),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                "OKAY",
                                                                style: TextStyle(
                                                                  fontSize: 16.0,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                              productlist.data[index]
                                              ["quantity"]++;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(50),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(2, 2),
                                                )
                                              ],
                                            ),
                                            child: const Icon(Icons.add),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert),
                                ),
                                Text(
                                  "${productlist.data[index]["price"] * productlist.data[index]["quantity"]}\$",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total amount:",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    "${productlist.totalAmaunt}\$",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: const Center(
                    child: Text(
                      "CHECK OUT",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class product{
  List<Map<String, dynamic>> data = [
    {

      'image': 'images/0.png',
      'title': 'Pullover',
      'color': 'Black',
      'size': 'L',
      'price': 52,
      'quantity': 1,
    },
    {
      'image': 'images/int_0.png',
      'title': 'T-Shirt',
      'color': 'Grey',
      'size': 'L',
      'price': 30,
      'quantity': 1,
    },
    {
      'image': 'images/photo.png',
      'title': 'Sport Dress',
      'color': 'Black',
      'size': 'M',
      'price': 43,
      'quantity': 1,
    },
  ];

  int get totalAmaunt {
    return data.fold(0, (total, product) => total+(product["price"]*product["quantity"] as int));
  }
}



void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

