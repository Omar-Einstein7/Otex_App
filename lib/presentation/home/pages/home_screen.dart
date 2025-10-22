import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optex_app/common/helper/navigation/app_navigation.dart';
import 'package:optex_app/common/helper/navigation/routes.dart';
import 'package:optex_app/l10n/app_localizations.dart';
import 'package:optex_app/presentation/home/bloc/product_cubit.dart';
import 'package:optex_app/presentation/home/bloc/product_state.dart';
import 'package:optex_app/presentation/home/pages/add_product_screen.dart';
import 'package:optex_app/presentation/home/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          Directionality(
            textDirection: TextDirection.rtl,

            child: Row(
              children: [
                Text("الكل"),
                IconButton(
                  onPressed: () => AppNavigator.push(context, Routes.filter),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Chips for categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryChip(
                      label: AppLocalizations.of(context)!.allOffers,
                      selected: true,
                    ),
                    const SizedBox(width: 8),
                    CategoryChip(label: AppLocalizations.of(context)!.clothes),
                    const SizedBox(width: 8),
                    CategoryChip(
                      label: AppLocalizations.of(context)!.accessories,
                    ),
                    const SizedBox(width: 8),
                    CategoryChip(
                      label: AppLocalizations.of(context)!.electronics,
                    ),
                  ],
                ),
              ),
            ),
            // Horizontal category containers with images
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _CategoryImageCard(
                    imageUrl: 'lib/assets/images/man.png',
                    title: AppLocalizations.of(context)!.men,
                  ),
                  const SizedBox(width: 12),
                  _CategoryImageCard(
                    imageUrl: 'lib/assets/images/clock.png',
                    title: AppLocalizations.of(context)!.clocks,
                  ),
                  const SizedBox(width: 12),
                  _CategoryImageCard(
                    imageUrl: 'lib/assets/images/phone.png',
                    title: AppLocalizations.of(context)!.phones,
                  ),
                  const SizedBox(width: 12),
                  _CategoryImageCard(
                    imageUrl: 'lib/assets/images/beauty.png',
                    title: AppLocalizations.of(context)!.beauity,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Products grid
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircularProgressIndicator(strokeWidth: 3),
                    ),
                  );
                } else if (state is ProductLoaded) {
                  if (state.products.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            size: 64,
                            color: theme.colorScheme.outline.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No products yet',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withOpacity(
                                0.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.55,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: state.products.length,
                    itemBuilder: (_, i) =>
                        ProductCard(product: state.products[i]),
                  );
                } else if (state is ProductError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64,
                          color: theme.colorScheme.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.message,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(builder: (_) => const AddProductScreen()),
      //     );
      //   },
      //   icon: const Icon(Icons.add),
      //   label: const Text('Add'),
      //   backgroundColor: theme.colorScheme.primary,
      //   foregroundColor: theme.colorScheme.onPrimary,
      //   elevation: 4,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(24),
      //   ),
      // ),
    );
  }
}

/// A reusable card widget for category images
class _CategoryImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const _CategoryImageCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;

  const CategoryChip({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (value) {
        // Handle category selection
      },
      selectedColor: theme.colorScheme.primaryContainer,
      backgroundColor: theme.colorScheme.surface,
      labelStyle: TextStyle(
        color: selected
            ? theme.colorScheme.onPrimaryContainer
            : theme.colorScheme.onSurface,
      ),
    );
  }
}

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Offers')),
      body: const Center(child: Text('Offers Screen')),
    );
  }
}
