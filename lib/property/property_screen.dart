import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:propertypulse/models/property_model.dart';

class PropertyScreen extends StatefulWidget {
  final PropertyModel propertyModel;

  const PropertyScreen({Key? key, required this.propertyModel}) : super(key: key);

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  bool isFavorite = false; // Track favorite state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // Toggle favorite state
              });
              // Handle favorite button click and save to favorites if needed

            },
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      aspectRatio: 16 / 9,
                    ),
                    items: widget.propertyModel.imageUrls.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16), // Add more space below the carousel
                  // Add indicators below the carousel
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.propertyModel.imageUrls.map((imageUrl) {

                      return Container(

                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black, // Match your app's theme
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          widget.propertyModel.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Match your app's theme
                          ),
                        ),
                        const SizedBox(height: 12), // Add more space below the title
                        // Rest of your property details
                        // For example:

                        Text(
                          'Location: ${widget.propertyModel.location}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey, // Match your app's theme
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Add more space below the location
                        Row(
                          children: [
                            const Icon(
                              Icons.bed,
                              color: Colors.black, // Match your app's theme
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${widget.propertyModel.bedrooms} Bedrooms',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey, // Match your app's theme
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Icon(
                              Icons.bathtub,
                              color: Colors.black, // Match your app's theme
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${widget.propertyModel.bathrooms} Bathrooms',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey, // Match your app's theme
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20), // Add more space below the bedrooms and bathrooms
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Match your app's theme
                          ),
                        ),
                        const SizedBox(height: 12), // Add more space below the title
                        Text(
                          widget.propertyModel.description,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey, // Match your app's theme
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Container with white background and buttons at the bottom
      bottomSheet: Container(
        height: 124,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Price: ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${widget.propertyModel.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "Show Map" button click
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: Text(
                    'Show Map',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                      fontSize: 18,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Message" button click
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text(
                    'Message',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
