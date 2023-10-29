import 'package:flutter/material.dart';
import 'package:propertypulse/models/property_model.dart';

class FavoritePropertyCard extends StatelessWidget {
  const FavoritePropertyCard({
    Key? key,
    required this.onPressed,
    required this.propertyModel,
  }) : super(key: key);

  final Function() onPressed;
  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                propertyModel.imageUrls[0],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      propertyModel.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      propertyModel.location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.bed,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          propertyModel.bedrooms.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.bathtub,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          propertyModel.bathrooms.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$${propertyModel.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),// Added Spacer to push the price to the right
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}