import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BakeryHomePage(),
    );
  }
}

class BakeryHomePage extends StatelessWidget {
  BakeryHomePage({super.key});

  final List<Map<String, String>> products = [
    {
      "name": "Sourdough Loaf",
      "price": "\$8.50",
      "category": "ARTISANAL BREAD",
      "image": "assets/images/img1.jpeg",
    },
    {
      "name": "Chocolate Fudge",
      "price": "\$35.00",
      "category": "DECORATED CAKE",
      "image": "assets/images/img2.jpeg",
    },
    {
      "name": "French Croissant",
      "price": "\$4.25",
      "category": "CLASSIC PASTRY",
      "image": "assets/images/img3.jpeg",
    },
    {
      "name": "Strawberry Tart",
      "price": "\$6.50",
      "category": "FRESH FRUIT",
      "image": "assets/images/img1.jpeg",
    },
    {
      "name": "Macaron Box",
      "price": "\$12.00",
      "category": "SWEET TREATS",
      "image": "assets/images/img2.jpeg",
    },
    {
      "name": "Choco Cookies",
      "price": "\$3.75",
      "category": "FRESH BAKED",
      "image": "assets/images/img3.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F6F6),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffEE2B6C),
        elevation: 5,
        onPressed: () {},
        child: const Icon(Icons.shopping_cart_outlined),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: const Color(0xffEE2B6C),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: "SHOP",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: "ORDERS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "PROFILE",
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.menu, color: Color(0xffEE2B6C)),

                    const Spacer(),

                    const Text(
                      "Dulce Aroma",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    const Icon(
                      Icons.shopping_bag_outlined,
                      color: Color(0xffEE2B6C),
                    ),
                  ],
                ),
              ),

              // TABS
              Container(
                height: 50,
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    CategoryItem("Breads", true),
                    CategoryItem("Cakes", false),
                    CategoryItem("Pastries", false),
                    CategoryItem("Coffee", false),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // BANNER
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xffEE2B6C), Color(0xffF48FB1)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Morning Specials",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        "Fresh from the oven every 6:00 AM",
                        style: TextStyle(color: Colors.white),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "20% OFF TODAY",
                          style: TextStyle(
                            color: Color(0xffEE2B6C),
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // GRID
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      name: products[index]["name"]!,
                      price: products[index]["price"]!,
                      category: products[index]["category"]!,
                      image: products[index]["image"]!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final bool selected;

  const CategoryItem(this.title, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: selected ? const Color(0xffEE2B6C) : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String category;
  final String image;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        price,
                        style: const TextStyle(
                          color: Color(0xffEE2B6C),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        category,
                        style: const TextStyle(color: Colors.grey, fontSize: 9),
                      ),
                    ],
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color(0xffEE2B6C),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
