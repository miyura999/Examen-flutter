import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailPage(),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  int quantity = 1;

  bool strawberry = false;
  bool chocolate = false;

  bool isFavorite = false;
  bool isPressed = false;

  int selectedPortion = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF5F2F4),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // TOP BAR
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),

                    const Text(
                      "Product Detail",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),

                    const Icon(
                      Icons.share_outlined,
                      size: 22,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),

              // IMAGE ANIMATION
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: TweenAnimationBuilder(

                  duration: const Duration(milliseconds: 800),

                  tween: Tween<double>(
                    begin: 0.8,
                    end: 1.0,
                  ),

                  builder: (context, value, child) {

                    return Transform.scale(
                      scale: value,

                      child: Opacity(
                        opacity: value,
                        child: child,
                      ),
                    );
                  },

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),

                    child: Image.asset(
                      'assets/images/img3.jpeg',
                      height: 330,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // TITLE + HEART
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Expanded(
                          child: Text(
                            "StrawberryCream\nCake",
                            style: TextStyle(
                              height: 1.0,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1B1B1B),
                            ),
                          ),
                        ),

                        // HEART ANIMATION
                        GestureDetector(
                          onTap: () {

                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },

                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),

                            height: isFavorite ? 42 : 38,
                            width: isFavorite ? 42 : 38,

                            decoration: BoxDecoration(
                              color: isFavorite
                                  ? const Color(0xFFFFD9E5)
                                  : const Color(0xFFFCE7EF),

                              borderRadius: BorderRadius.circular(20),

                              boxShadow: isFavorite
                                  ? [
                                BoxShadow(
                                  color: Colors.pink.withOpacity(0.4),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                                  : [],
                            ),

                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 300),

                              scale: isFavorite ? 1.2 : 1.0,

                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,

                                color: const Color(0xFFE91E63),
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "PREMIUM BAKERY",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        color: Color(0xFFE91E63),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "\$24.99",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      "A light and fluffy sponge cake layered with fresh\n"
                          "organic strawberries and rich whipped cream.\n"
                          "Perfect for any celebration or a sweet\n"
                          "afternoon treat. Crafted with Madagascar\n"
                          "vanilla and locally sourced dairy.",
                      style: TextStyle(
                        height: 1.8,
                        fontSize: 15,
                        color: Color(0xFF5E5E5E),
                      ),
                    ),

                    const SizedBox(height: 26),

                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Select Portions",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPortion = 0;
                              });
                            },

                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),

                              height: 52,

                              decoration: BoxDecoration(
                                color: selectedPortion == 0
                                    ? const Color(0xFFFFEDF3)
                                    : Colors.transparent,

                                borderRadius: BorderRadius.circular(14),

                                border: Border.all(
                                  color: selectedPortion == 0
                                      ? const Color(0xFFE91E63)
                                      : Colors.grey.shade300,
                                  width: 1.5,
                                ),
                              ),

                              child: Center(
                                child: Text(
                                  "4–6 Portions",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: selectedPortion == 0
                                        ? const Color(0xFFE91E63)
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPortion = 1;
                              });
                            },

                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),

                              height: 52,

                              decoration: BoxDecoration(
                                color: selectedPortion == 1
                                    ? const Color(0xFFFFEDF3)
                                    : Colors.transparent,

                                borderRadius: BorderRadius.circular(14),

                                border: Border.all(
                                  color: selectedPortion == 1
                                      ? const Color(0xFFE91E63)
                                      : Colors.grey.shade300,
                                  width: 1.5,
                                ),
                              ),

                              child: Center(
                                child: Text(
                                  "8–10 Portions",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: selectedPortion == 1
                                        ? const Color(0xFFE91E63)
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    const Text(
                      "Extra Toppings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 14),

                    toppingTile(
                      title: "Extra Strawberries",
                      price: "+\$3.00",
                      value: strawberry,
                      onChanged: (v) {
                        setState(() {
                          strawberry = v;
                        });
                      },
                    ),

                    const SizedBox(height: 12),

                    toppingTile(
                      title: "Chocolate Drizzle",
                      price: "+\$2.00",
                      value: chocolate,
                      onChanged: (v) {
                        setState(() {
                          chocolate = v;
                        });
                      },
                    ),

                    const SizedBox(height: 28),

                    Row(
                      children: [

                        // QUANTITY
                        Container(
                          height: 56,
                          width: 110,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [

                              GestureDetector(
                                onTap: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },

                                child: const Text(
                                  "−",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),

                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),

                                transitionBuilder:
                                    (child, animation) {

                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },

                                child: Text(
                                  quantity.toString(),
                                  key: ValueKey(quantity),

                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },

                                child: const Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 14),

                        // ADD TO CART BUTTON
                        Expanded(
                          child: GestureDetector(

                            onTapDown: (_) {
                              setState(() {
                                isPressed = true;
                              });
                            },

                            onTapUp: (_) {
                              setState(() {
                                isPressed = false;
                              });
                            },

                            onTapCancel: () {
                              setState(() {
                                isPressed = false;
                              });
                            },

                            child: AnimatedScale(
                              duration:
                              const Duration(milliseconds: 150),

                              scale: isPressed ? 0.95 : 1.0,

                              child: Container(
                                height: 56,

                                decoration: BoxDecoration(
                                  color: const Color(0xFFE91E63),
                                  borderRadius:
                                  BorderRadius.circular(18),

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.pink.withOpacity(0.35),
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),

                                child: const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [

                                    Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),

                                    SizedBox(width: 8),

                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget toppingTile({
    required String title,
    required String price,
    required bool value,
    required Function(bool) onChanged,
  }) {

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),

      height: 56,

      padding: const EdgeInsets.symmetric(horizontal: 14),

      decoration: BoxDecoration(
        color: value
            ? const Color(0xFFFFEDF3)
            : const Color(0xFFF7F7F7),

        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: value
              ? const Color(0xFFE91E63)
              : Colors.transparent,
        ),
      ),

      child: Row(
        children: [

          GestureDetector(
            onTap: () {
              onChanged(!value);
            },

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),

              height: 22,
              width: 22,

              decoration: BoxDecoration(
                color: value
                    ? const Color(0xFFE91E63)
                    : Colors.transparent,

                borderRadius: BorderRadius.circular(6),

                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),

              child: value
                  ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
                  : null,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF3D3D3D),
              ),
            ),
          ),

          Text(
            price,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF9E9E9E),
            ),
          ),
        ],
      ),
    );
  }
}