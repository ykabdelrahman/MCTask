import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.productName,
    required this.price,
    required this.image,
    this.onTap,
  });
  final String productName;
  final dynamic price;
  final String image;
  final VoidCallback? onTap;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Color heartColor = kPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.onTap,
        splashColor: Colors.purple,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.4),
                    blurRadius: 22,
                    spreadRadius: 0,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Card(
                  color: const Color(0xFFFAF0E6),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                      left: 12,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.productName,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$' '${widget.price}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            Positioned(
              right: 20,
              bottom: 60,
              child: Image.network(
                widget.image,
                height: 80,
                width: 80,
                errorBuilder: (context, error, stackTrace) => const Text(''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
