// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:optex_app/domain/home/entities/product.dart';
// import 'package:optex_app/presentation/home/bloc/product_cubit.dart';

// class AddProductScreen extends StatefulWidget {
//   const AddProductScreen({super.key});

//   @override
//   State<AddProductScreen> createState() => _AddProductScreenState();
// }

// class _AddProductScreenState extends State<AddProductScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _priceController = TextEditingController();
//   final _categoryIdController = TextEditingController();
//   final _imageUrlController = TextEditingController();


//   @override
//   void dispose() {
//     _nameController.dispose();
//     _priceController.dispose();
//     _categoryIdController.dispose();
//     _imageUrlController.dispose();

//     super.dispose();
//   }

//   void _submitProduct() {
//     if (_formKey.currentState!.validate()) {
//       final product = Product(
//         name: _nameController.text,
//         price: double.parse(_priceController.text),
//         categoryId: int.parse(_categoryIdController.text),
//         imageUrl: _imageUrlController.text.isEmpty ? null : _imageUrlController.text,
//       );
//       context.read<ProductCubit>().addProduct(product);
//       Navigator.of(context).pop(); // Go back to the previous screen
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Product'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Product Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a product name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _priceController,
//                 decoration: const InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a price';
//                   }
//                   if (double.tryParse(value) == null) {
//                     return 'Please enter a valid number';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _categoryIdController,
//                 decoration: const InputDecoration(labelText: 'Category ID'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a category ID';
//                   }
//                   if (int.tryParse(value) == null) {
//                     return 'Please enter a valid integer';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _imageUrlController,
//                 decoration: const InputDecoration(labelText: 'Image URL (Optional)'),
//                 keyboardType: TextInputType.url,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitProduct,
//                 child: const Text('Add Product'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }