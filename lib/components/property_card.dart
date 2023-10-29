import 'package:flutter/material.dart';
import 'package:propertypulse/models/models.dart';


class PropertyCard extends StatelessWidget {
  const PropertyCard({
    Key? key,
    required this.onPressed,
    required this.propertyModel, // Pass the PropertyModel instance here
  }) : super(key: key);

  final Function() onPressed;
  final PropertyModel propertyModel; // Store the PropertyModel instance

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Adjust the value as needed
          ),
          child: Row(
            children: [
              Image.asset(
                propertyModel.imageUrls[0], // Access image URL from the model
                fit: BoxFit.cover,
                width: 150,
                height: 120,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        propertyModel.title, // Access title from the model
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        propertyModel.location, // Access location from the model
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
                            propertyModel.bedrooms.toString(), // Access bedrooms from the model
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
                            propertyModel.bathrooms.toString(), // Access bathrooms from the model
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '\$${propertyModel.price.toStringAsFixed(2)}', // Access price from the model
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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

