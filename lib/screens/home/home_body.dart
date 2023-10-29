import 'package:flutter/material.dart';
import 'package:propertypulse/components/property_card.dart';
import 'package:propertypulse/components/section_title.dart';
import 'package:propertypulse/firestore_services/property_service.dart';
import 'package:propertypulse/models/property_model.dart';
import 'package:propertypulse/property/property_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.hasNotifications,
  });

  final bool hasNotifications;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          floating: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          expandedHeight: 330, // Adjust the expanded height as needed
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/3bhk.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Discover',
                              style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8.0),
                          ],
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Stack(
                              children: [
                                const Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                if (hasNotifications)
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                    child: Text(
                      'Find the right property for you',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 23),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Location",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Property",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  prefixIcon: const Icon(Icons.home),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Price Range",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  prefixIcon: const Icon(Icons.attach_money),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            // search based on location and property type and price range

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.8),
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: const Size(double.infinity, 56.0),
                          ),
                          child: const Text(
                            'Find',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: SectionTitle(title: 'Popular Properties'),
              ),
              // Use ListView.builder to display property cards
              FutureBuilder<List<PropertyModel>>(
                future: PropertyService().getProperty(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final List<PropertyModel> properties = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: properties.length,
                      itemBuilder: (context, index) {
                        return PropertyCard(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PropertyScreen(
                                    propertyModel: properties[index]),
                              ),
                            );
                          },
                          propertyModel: properties[index],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
