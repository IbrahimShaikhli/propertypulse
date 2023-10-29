class PropertyModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final String location;
  final List<String> imageUrls;

  PropertyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.location,
    required this.imageUrls,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      area: json['area'].toDouble(),
      location: json['location'],
      imageUrls: (json['imageUrls'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'location': location,
      'imageUrls': imageUrls,
    };
  }
}

List<PropertyModel> demoProperties = [
  PropertyModel(
    id: '1',
    title: 'Luxury Villa',
    description: 'Beautiful villa with a stunning panoramic view of the tranquil surroundings, offering a serene and luxurious retreat for your relaxation and enjoyment.',
    price: 1200000.0,
    bedrooms: 4,
    bathrooms: 3,
    area: 3200.0,
    location: 'Miami, FL',
    imageUrls: ['assets/images/miami_fl.jpg'],
  ),
  PropertyModel(
    id: '2',
    title: 'Modern Apartment',
    description: 'Spacious apartment in the heart of the city',
    price: 850000.0,
    bedrooms: 2,
    bathrooms: 2,
    area: 1600.0,
    location: 'New York, NY',
    imageUrls: ['assets/images/NYapartment.jpg'],
  ),
  PropertyModel(
    id: '3',
    title: 'Cozy Cottage',
    description: 'Charming cottage with a garden',
    price: 350000.0,
    bedrooms: 3,
    bathrooms: 2,
    area: 1800.0,
    location: 'San Francisco, CA',
    imageUrls: ['assets/images/sanfrancottage.png'],
  ),
  PropertyModel(
    id: '4',
    title: 'Lakefront House',
    description: 'A house by the lake with a private dock',
    price: 2200000.0,
    bedrooms: 5,
    bathrooms: 4,
    area: 4500.0,
    location: 'Seattle, WA',
    imageUrls: ['assets/images/seattlewashington.jpg'],
  ),
  PropertyModel(
    id: '5',
    title: 'City Penthouse',
    description: 'Luxurious penthouse in the city center',
    price: 2800000.0,
    bedrooms: 3,
    bathrooms: 3,
    area: 2500.0,
    location: 'Los Angeles, CA',
    imageUrls: ['assets/images/LAPenthouse.png'],
  ),
  // Add more properties here as needed
];
