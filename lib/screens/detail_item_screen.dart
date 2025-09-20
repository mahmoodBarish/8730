import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class DetailItemScreen extends StatefulWidget {
  const DetailItemScreen({super.key});

  @override
  State<DetailItemScreen> createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  String _selectedSize = 'M'; // Default selected size

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    // Define base dimensions (from Figma 375x812) to scale proportionally
    const double baseWidth = 375;
    const double baseHeight = 812;

    // Calculate scaling factors
    final double scaleX = screenWidth / baseWidth;
    final double scaleY = screenHeight / baseHeight;

    // Helper to scale values (e.g., padding, font sizes)
    double scaleW(double value) => value * scaleX;
    double scaleH(double value) => value * scaleY;
    double scaleFont(double value) => value * (scaleX + scaleY) / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main content scrollable
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: scaleH(44), // Status bar height
                bottom: scaleH(118), // Bottom action bar height
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: scaleW(24),
                      vertical: scaleH(24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop(); // Go back using go_router
                          },
                          child: Container(
                            width: scaleW(44),
                            height: scaleH(44),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(scaleW(12)),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: scaleFont(20),
                              color: const Color(0xFF2F2D2C),
                            ),
                          ),
                        ),
                        Text(
                          'Detail',
                          style: GoogleFonts.sora(
                            fontSize: scaleFont(16),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2F2D2C),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle favorite button tap
                          },
                          child: Container(
                            width: scaleW(44),
                            height: scaleH(44),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(scaleW(12)),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.favorite_border,
                              size: scaleFont(20),
                              color: const Color(0xFF2F2D2C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scaleH(12)),
                  // Product Image
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: scaleW(24)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(scaleW(16)),
                      child: Image.asset(
                        'assets/images/I184_204_417_715.png',
                        width: screenWidth - scaleW(48),
                        height: scaleH(202),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: scaleH(24)),
                  // Product Details
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: scaleW(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Caffe Mocha',
                                  style: GoogleFonts.sora(
                                    fontSize: scaleFont(20),
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF2F2D2C),
                                  ),
                                ),
                                SizedBox(height: scaleH(4)),
                                Text(
                                  'Ice/Hot',
                                  style: GoogleFonts.sora(
                                    fontSize: scaleFont(12),
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFA9A9A9),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                _buildSuperiorityIcon(
                                  'assets/images/I184_198_418_950.png', // Bike icon
                                ),
                                SizedBox(width: scaleW(12)),
                                _buildSuperiorityIcon(
                                  'assets/images/I184_200_418_971.png', // Bean icon
                                ),
                                SizedBox(width: scaleW(12)),
                                _buildSuperiorityIcon(
                                  'assets/images/I184_202_418_967.png', // Milk icon
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: scaleH(16)),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: const Color(0xFFFBBE21),
                              size: scaleFont(20),
                            ),
                            SizedBox(width: scaleW(4)),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '4.8 ',
                                    style: GoogleFonts.sora(
                                      fontSize: scaleFont(14),
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF2F2D2C),
                                    ),
                                  ),
                                  TextSpan(
                                    text: '(230)',
                                    style: GoogleFonts.sora(
                                      fontSize: scaleFont(12),
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFA9A9A9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: scaleH(16)),
                        Divider(
                          color: const Color(0xFFEAEAEA),
                          thickness: 1,
                          height: scaleH(1),
                          indent: scaleW(16),
                          endIndent: scaleW(16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scaleH(16)),
                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: scaleW(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: GoogleFonts.sora(
                            fontSize: scaleFont(16),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2F2D2C),
                          ),
                        ),
                        SizedBox(height: scaleH(8)),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..',
                                style: GoogleFonts.sora(
                                  fontSize: scaleFont(14),
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFA9A9A9),
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: ' Read More',
                                style: GoogleFonts.sora(
                                  fontSize: scaleFont(14),
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFC67C4E),
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scaleH(24)),
                  // Size Selection
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: scaleW(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Size',
                          style: GoogleFonts.sora(
                            fontSize: scaleFont(16),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2F2D2C),
                          ),
                        ),
                        SizedBox(height: scaleH(16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: ['S', 'M', 'L'].map((size) {
                            bool isSelected = _selectedSize == size;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSize = size;
                                });
                              },
                              child: Container(
                                width: scaleW(96),
                                height: scaleH(41),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFFF9F9F9)
                                      : Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(scaleW(12)),
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFFC67C4E)
                                        : const Color(0xFFEAEAEA),
                                    width: 1,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  size,
                                  style: GoogleFonts.sora(
                                    fontSize: scaleFont(14),
                                    fontWeight: FontWeight.w400,
                                    color: isSelected
                                        ? const Color(0xFFC67C4E)
                                        : const Color(0xFF2F2D2C),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scaleH(24)),
                ],
              ),
            ),
          ),

          // Bottom Action Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(
                scaleW(24),
                scaleH(16),
                scaleW(24),
                scaleH(46) + mediaQuery.padding.bottom, // Add safe area bottom
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(scaleW(16)),
                  topRight: Radius.circular(scaleW(16)),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: GoogleFonts.sora(
                          fontSize: scaleFont(14),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF909090),
                        ),
                      ),
                      SizedBox(height: scaleH(4)),
                      Text(
                        '\$ 4.53',
                        style: GoogleFonts.sora(
                          fontSize: scaleFont(18),
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFC67C4E),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: scaleW(217),
                    height: scaleH(56),
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('/checkout'); // Navigate to checkout using go_router
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC67C4E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(scaleW(16)),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: scaleW(20),
                          vertical: scaleH(16),
                        ),
                      ),
                      child: Text(
                        'Buy Now',
                        style: GoogleFonts.sora(
                          fontSize: scaleFont(16),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Custom Status Bar Overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: mediaQuery.padding.top > 0 ? mediaQuery.padding.top : scaleH(44), // Dynamic height for notch
              color: Colors.white, // Background for status bar
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: mediaQuery.padding.top > 0 ? mediaQuery.padding.top - scaleH(10) : 0), // Adjust padding for actual top safe area
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: scaleW(24)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '9:41',
                      style: GoogleFonts.sora(
                        fontSize: scaleFont(15),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2F2D2C),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.signal_cellular_alt, size: scaleFont(17), color: const Color(0xFF2F2D2C)),
                        SizedBox(width: scaleW(5)),
                        Icon(Icons.wifi, size: scaleFont(17), color: const Color(0xFF2F2D2C)),
                        SizedBox(width: scaleW(5)),
                        Icon(Icons.battery_full, size: scaleFont(17), color: const Color(0xFF2F2D2C)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Home Indicator Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white, // Ensure it covers content
              height: mediaQuery.padding.bottom > 0 ? mediaQuery.padding.bottom : scaleH(34), // Dynamic height for home indicator
              alignment: Alignment.topCenter,
              child: Container(
                width: scaleW(134),
                height: scaleH(5),
                margin: EdgeInsets.only(bottom: mediaQuery.padding.bottom > 0 ? scaleH(8) : scaleH(8)),
                decoration: BoxDecoration(
                  color: const Color(0xFF2F2D2C),
                  borderRadius: BorderRadius.circular(scaleW(100)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuperiorityIcon(String assetPath) {
    // Define base dimensions from Figma
    const double baseWidth = 375;
    const double baseHeight = 812;

    // Calculate scaling factors
    final double scaleX = MediaQuery.of(context).size.width / baseWidth;
    final double scaleH(double value) => value * (MediaQuery.of(context).size.height / baseHeight);
    final double scaleW(double value) => value * scaleX;

    return Container(
      width: scaleW(44),
      height: scaleH(44),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA).withOpacity(0.35),
        borderRadius: BorderRadius.circular(scaleW(12)),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        assetPath,
        width: scaleW(24),
        height: scaleH(24),
        fit: BoxFit.contain,
        color: const Color(0xFFC67C4E), // Apply accent color for custom icons
      ),
    );
  }
}