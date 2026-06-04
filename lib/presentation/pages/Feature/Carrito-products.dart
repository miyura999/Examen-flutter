//jeronimo
import 'package:flutter/material.dart';

class CarritoProducts extends StatefulWidget {
  const CarritoProducts({super.key});

  @override
  State<CarritoProducts> createState() => _CarritoProductsState();
}

class _CarritoProductsState extends State<CarritoProducts> {
  int bread = 1;
  int cupcake = 2;
  int croissant = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F4F5),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),

                  const Text(
                    "Dulce Aroma",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_outline, color: Colors.pink),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              /// TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Shopping Cart",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "3 Items",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    buildProduct(
                      title: "Sourdough Bread",
                      subtitle: "Artisanal, 500g",
                      price: "\$8.50",
                      quantity: bread,
                      image: "assets/images/img1.jpeg",
                      add: () {
                        setState(() {
                          bread++;
                        });
                      },
                      remove: () {
                        setState(() {
                          if (bread > 1) bread--;
                        });
                      },
                    ),

                    const SizedBox(height: 15),

                    buildProduct(
                      title: "Chocolate Cupcake",
                      subtitle: "Double fudge core",
                      price: "\$4.25",
                      quantity: cupcake,
                      image: "assets/images/img2.jpeg",
                      add: () {
                        setState(() {
                          cupcake++;
                        });
                      },
                      remove: () {
                        setState(() {
                          if (cupcake > 1) cupcake--;
                        });
                      },
                    ),

                    const SizedBox(height: 15),

                    buildProduct(
                      title: "Butter Croissant",
                      subtitle: "Flaky & buttery",
                      price: "\$3.50",
                      quantity: croissant,
                      image: "assets/images/img3.jpeg",
                      add: () {
                        setState(() {
                          croissant++;
                        });
                      },
                      remove: () {
                        setState(() {
                          if (croissant > 1) croissant--;
                        });
                      },
                    ),

                    const SizedBox(height: 25),

                    /// PROMO CODE
                    Container(
                      height: 55,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Promo code",
                              ),
                            ),
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Apply"),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// TOTAL CARD
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Subtotal"), Text("\$20.50")],
                          ),

                          SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Delivery Fee"), Text("\$2.99")],
                          ),

                          SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Discount"),
                              Text(
                                "-\$2.00",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),

                          Divider(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$21.49",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// CHECKOUT BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Proceed to Checkout →",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: "SHOP"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "CART",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "PROFILE",
          ),
        ],
      ),
    );
  }

  Widget buildProduct({
    required String title,
    required String subtitle,
    required String price,
    required int quantity,
    required String image,
    required VoidCallback add,
    required VoidCallback remove,
  }) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 700),

      tween: Tween<double>(begin: -120, end: 0),

      builder: (context, value, child) {
        return Transform.translate(offset: Offset(value, 0), child: child);
      },

      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,

              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Image.asset(image, fit: BoxFit.cover),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),

                  const SizedBox(height: 6),

                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(onPressed: remove, icon: const Icon(Icons.remove)),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      "$quantity",
                      key: ValueKey(quantity),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  IconButton(onPressed: add, icon: const Icon(Icons.add)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
