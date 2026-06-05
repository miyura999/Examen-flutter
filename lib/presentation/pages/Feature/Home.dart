import 'package:flutter/material.dart';
import 'Product-detail.dart';
import 'Carrito-products.dart';

class BakeryHomePage extends StatefulWidget {
  const BakeryHomePage({super.key});

  @override
  State<BakeryHomePage> createState() => _BakeryHomePageState();
}

class _BakeryHomePageState extends State<BakeryHomePage> {
  int currentIndex = 0;
  final List<Map<String, String>> products = [
    {
      "name": "Sourdough Loaf",
      "price": "\$8.50",
      "category": "ARTISANAL BREAD",
      "image": "assets/images/img1.jpeg",
      "description":
          "Traditional artisan sourdough bread with a crispy crust and soft interior, naturally fermented for a rich flavor.",
    },
    {
      "name": "Chocolate Fudge",
      "price": "\$35.00",
      "category": "DECORATED CAKE",
      "image": "assets/images/img2.jpeg",
      "description":
          "Rich chocolate cake layered with creamy fudge frosting, perfect for birthdays and celebrations.",
    },
    {
      "name": "French Croissant",
      "price": "\$4.25",
      "category": "CLASSIC PASTRY",
      "image": "assets/images/img3.jpeg",
      "description":
          "Buttery and flaky French croissant baked fresh every morning using premium ingredients.",
    },
    {
      "name": "Strawberry Tart",
      "price": "\$6.50",
      "category": "FRESH FRUIT",
      "image": "assets/images/img1.jpeg",
      "description":
          "Crispy tart shell filled with pastry cream and topped with fresh strawberries.",
    },
    {
      "name": "Macaron Box",
      "price": "\$12.00",
      "category": "SWEET TREATS",
      "image": "assets/images/img2.jpeg",
      "description":
          "Selection of colorful French macarons with assorted gourmet fillings.",
    },
    {
      "name": "Choco Cookies",
      "price": "\$3.75",
      "category": "FRESH BAKED",
      "image": "assets/images/img3.jpeg",
      "description":
          "Soft baked chocolate cookies loaded with premium chocolate chips.",
    },
  ];

  void openProduct(Map<String, String> product) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, animation, __) => ProductDetailPage(
          name: product["name"]!,
          price: product["price"]!,
          category: product["category"]!,
          image: product["image"]!,
          description: product["description"]!,
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  void openCart() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, animation, __) => const CarritoProducts(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F6F6),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffEE2B6C),
        elevation: 5,
        onPressed: openCart,
        child: const Icon(Icons.shopping_cart_outlined),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xffEE2B6C),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          if (index == 2) {
            openCart();
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: "SHOP",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "CART",
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

                    GestureDetector(
                      onTap: openCart,
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Color(0xffEE2B6C),
                      ),
                    ),
                  ],
                ),
              ),

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

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 140,
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
                      product: products[index],
                      onTap: () => openProduct(products[index]),
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
  final Map<String, String> product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 600),
        tween: Tween<double>(begin: 0.9, end: 1),
        builder: (context, value, child) {
          return Transform.scale(scale: value, child: child);
        },
        child: Container(
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
                child: Hero(
                  tag: product["image"]!,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      product["image"]!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product["name"]!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product["price"]!,
                              style: const TextStyle(
                                color: Color(0xffEE2B6C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              product["category"]!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color(0xffEE2B6C),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
