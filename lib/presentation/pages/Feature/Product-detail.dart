import 'package:flutter/material.dart';
import 'Carrito-products.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String price;
  final String category;
  final String image;
  final String description;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.description,
  });

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

  void openCart() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, animation, __) => const CarritoProducts(),
        transitionsBuilder: (_, animation, __, child) {
          return ScaleTransition(scale: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F2F4),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// TOP BAR
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
                      child: const Icon(Icons.arrow_back_ios_new, size: 20),
                    ),

                    const Text(
                      "Product Detail",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Icon(Icons.share_outlined, size: 22),
                  ],
                ),
              ),

              /// HERO IMAGE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Hero(
                  tag: widget.image,
                  child: TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 800),
                    tween: Tween<double>(begin: 0.8, end: 1.0),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Opacity(opacity: value, child: child),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Image.asset(
                        widget.image,
                        height: 330,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
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
                    /// TITLE + FAVORITE
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                              height: 1.0,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1B1B1B),
                            ),
                          ),
                        ),

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

                    Text(
                      widget.category,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFE91E63),
                        letterSpacing: 0.8,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Divider(color: Colors.grey.shade300),

                    const SizedBox(height: 20),

                    Text(
                      widget.description,
                      style: const TextStyle(
                        height: 1.8,
                        fontSize: 15,
                        color: Color(0xFF5E5E5E),
                      ),
                    ),

                    const SizedBox(height: 25),

                    Divider(color: Colors.grey.shade300),

                    const SizedBox(height: 20),

                    const Text(
                      "Select Portions",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: buildPortionButton(
                            text: "4-6 Portions",
                            index: 0,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: buildPortionButton(
                            text: "8-10 Portions",
                            index: 1,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Extra Toppings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

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

                    const SizedBox(height: 10),

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

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        /// QUANTITY
                        Container(
                          width: 110,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  "-",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),

                              Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
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
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12),

                        /// CART BUTTON
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

                              openCart();
                            },
                            onTapCancel: () {
                              setState(() {
                                isPressed = false;
                              });
                            },
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 150),
                              scale: isPressed ? 0.95 : 1,
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE91E63),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Add To Cart",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
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

  Widget buildPortionButton({required String text, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPortion = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 52,
        decoration: BoxDecoration(
          color: selectedPortion == index
              ? const Color(0xFFFFEDF3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selectedPortion == index
                ? const Color(0xFFE91E63)
                : Colors.grey.shade300,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: selectedPortion == index
                  ? const Color(0xFFE91E63)
                  : Colors.grey,
            ),
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: value ? const Color(0xFFFFEDF3) : Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Checkbox(
            value: value,
            activeColor: const Color(0xFFE91E63),
            onChanged: (v) {
              onChanged(v!);
            },
          ),

          Expanded(child: Text(title)),

          Text(price),
        ],
      ),
    );
  }
}
