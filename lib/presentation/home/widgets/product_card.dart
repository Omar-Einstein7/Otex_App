import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:optex_app/domain/movie/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 190, // increased fixed height for a bigger image area
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: product.imageUrl != null
                  ? Image.asset(
                      product.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported, size: 64),
                    )
                  : const Icon(Icons.image, size: 64),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  textDirection: TextDirection
                      .ltr, // Force LTR so icon stays first regardless of locale
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/bxs_offer.svg',
                      width: 24,
                      height: 24,
                    ),
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 4),
                    Text(
                      '${product.price - 1} EGP',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      '${product.price} EGP',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Icon(Icons.favorite_border, size: 20),
                  ],
                ),
                 const SizedBox(height: 10),

                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/local_fire_department.svg',
                      width: 15,
                      height: 15,
                    ),
                    Text(
                      textDirection: TextDirection.rtl,
                      'تم البيع ${'\u200E'}3.3k',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    
                    
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade100.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.business, // company badge icon
                            size: 16,
                            color: Colors.blue,
                          ),
                        ),
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(Icons.add_shopping_cart, size: 16),
                    ),
                    const SizedBox(width: 8),
                    Image.asset('lib/assets/icons/logo (2).png', width: 20, height: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
