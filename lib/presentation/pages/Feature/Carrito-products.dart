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

  bool checkoutPressed = false;

  double get subtotal => (bread * 8.50) + (cupcake * 4.25) + (croissant * 3.50);

  double get delivery => 2.99;

  double get discount => 2.00;

  double get total => subtotal + delivery - discount;

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
                    onPressed: () {
                      setState(() {
                        bread = 0;
                        cupcake = 0;
                        croissant = 0;
                      });
                    },
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
                    child: Text(
                      "${bread + cupcake + croissant} Items",
                      style: const TextStyle(
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
                          if (bread > 0) {
                            bread--;
                          }
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
                          if (cupcake > 0) {
                            cupcake--;
                          }
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
                          if (croissant > 0) {
                            croissant--;
                          }
                        });
                      },
                    ),

                    const SizedBox(height: 25),

                    /// PROMO
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
                            child: const Text(
                              "Apply",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// TOTAL CARD
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Subtotal"),
                              Text("\$${subtotal.toStringAsFixed(2)}"),
                            ],
                          ),

                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Delivery Fee"),
                              Text("\$${delivery.toStringAsFixed(2)}"),
                            ],
                          ),

                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Discount"),
                              Text(
                                "-\$${discount.toStringAsFixed(2)}",
                                style: const TextStyle(color: Colors.green),
                              ),
                            ],
                          ),

                          const Divider(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                "\$${total.toStringAsFixed(2)}",
                                style: const TextStyle(
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

                    /// CHECKOUT
                    GestureDetector(
                      onTapDown: (_) {
                        setState(() {
                          checkoutPressed = true;
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          checkoutPressed = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Order placed successfully!"),
                          ),
                        );
                      },
                      onTapCancel: () {
                        setState(() {
                          checkoutPressed = false;
                        });
                      },
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 150),
                        scale: checkoutPressed ? 0.95 : 1,
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Proceed to Checkout →",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,

        showSelectedLabels: true,
        showUnselectedLabels: true,

        selectedFontSize: 12,
        unselectedFontSize: 12,

        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
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
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 30, end: 0),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
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

                  const SizedBox(height: 5),

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
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(onPressed: remove, icon: const Icon(Icons.remove)),

                  Text(
                    "$quantity",
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
