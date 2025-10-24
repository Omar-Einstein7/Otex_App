import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optex_app/common/helper/navigation/app_navigation.dart';
import 'package:optex_app/common/helper/navigation/routes.dart';
import 'package:optex_app/l10n/app_localizations.dart';
import 'package:optex_app/presentation/home/bloc/category_cubit.dart';
import 'package:optex_app/presentation/home/bloc/product_cubit.dart';
import 'package:optex_app/presentation/home/bloc/product_state.dart';

import 'package:optex_app/presentation/home/widgets/category_chip.dart';
import 'package:optex_app/presentation/home/widgets/category_image_card.dart';
import 'package:optex_app/presentation/home/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<CategoryCubit>(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          leadingWidth: 0,
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
                  child: BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      final categoryInitialState = state as CategoryInitial;
                      return Row(
                        children: [
                          CategoryChip(
                            label: AppLocalizations.of(context)!.allOffers,
                            selected: categoryInitialState.selectedCategory == AppLocalizations.of(context)!.allOffers,
                            onSelected: () => context.read<CategoryCubit>().selectCategory(AppLocalizations.of(context)!.allOffers),
                          ),
                          const SizedBox(width: 8),
                          CategoryChip(
                            label: AppLocalizations.of(context)!.clothes,
                            selected: categoryInitialState.selectedCategory == AppLocalizations.of(context)!.clothes,
                            onSelected: () => context.read<CategoryCubit>().selectCategory(AppLocalizations.of(context)!.clothes),
                          ),
                          const SizedBox(width: 8),
                          CategoryChip(
                            label: AppLocalizations.of(context)!.accessories,
                            selected: categoryInitialState.selectedCategory == AppLocalizations.of(context)!.accessories,
                            onSelected: () => context.read<CategoryCubit>().selectCategory(AppLocalizations.of(context)!.accessories),
                          ),
                          const SizedBox(width: 8),
                          CategoryChip(
                            label: AppLocalizations.of(context)!.electronics,
                            selected: categoryInitialState.selectedCategory == AppLocalizations.of(context)!.electronics,
                            onSelected: () => context.read<CategoryCubit>().selectCategory(AppLocalizations.of(context)!.electronics),
                          ),
                        ],
                      );
                    },
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
                    CategoryImageCard(
                      imageUrl: 'lib/assets/images/man.png',
                      title: AppLocalizations.of(context)!.men,
                    ),
                    const SizedBox(width: 12),
                    CategoryImageCard(
                      imageUrl: 'lib/assets/images/clock.png',
                      title: AppLocalizations.of(context)!.clocks,
                    ),
                    const SizedBox(width: 12),
                    CategoryImageCard(
                      imageUrl: 'lib/assets/images/phone.png',
                      title: AppLocalizations.of(context)!.phones,
                    ),
                    const SizedBox(width: 12),
                    CategoryImageCard(
                      imageUrl: 'lib/assets/images/beauty.png',
                      title: AppLocalizations.of(context)!.beauity,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(10),
                color: Color.fromRGBO(249, 91, 28, 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_sharp, color: Color(0xFF3A813F)),
                        const SizedBox(width: 4),
                        Text("شحن مجانى"),
                      ],
                    ),
                    Text("لأى عرض تطلبه دلوقتى !")

                  ],
                ),
              ),
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 800
                            ? 4
                            : MediaQuery.of(context).size.width > 480
                                ? 3
                                : 2,
                        childAspectRatio: MediaQuery.of(context).size.width > 800
                            ? 0.75
                            : MediaQuery.of(context).size.width > 480
                                ? 0.4
                                : 0.45,


                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (_, i) =>
                          ProductCard(product: state.products[i]),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),

      ),
    );
  }
}

/// A reusable card widget for category images




