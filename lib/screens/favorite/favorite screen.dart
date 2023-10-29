import 'package:flutter/material.dart';
import 'package:propertypulse/models/favorite_model.dart';
import 'package:propertypulse/models/property_model.dart';
import 'package:propertypulse/property/property_screen.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = '/favorite';
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // Sample data for dropdowns
  List<String> leftDropdownItems = ['All Properties', 'Villas', 'Apartment', 'Shop', 'Office'];
  List<String> rightDropdownItems = ['Latest Saved', 'Oldest Saved']; // Options for the right button
  String? selectedOption1;
  String? selectedOption2;

  @override
  Widget build(BuildContext context) {

    List<PropertyModel> savedProperties = demoProperties; // Use your demoProperties list

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Saved',
          style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            OptionsRow(),
            SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
                  itemCount: savedProperties.length,
                    itemBuilder: (BuildContext context, int index){
                    return FavoritePropertyCard(
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PropertyScreen(propertyModel: demoProperties[index]),
                            ),
                          );
                        },
                        propertyModel: savedProperties[index]
                    );
                  }
                ),
            )
          ],
        ),
      ),
    );
  }

  Row OptionsRow() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Left Dropdown Button
              SizedBox(
                width: 155, // Set the desired width
                height: 50, // Set the desired height
                child: PopupMenuButton<String>(
                  onSelected: (newValue) {
                    setState(() {
                      selectedOption1 = newValue;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return leftDropdownItems.map((item) {
                      return PopupMenuItem<String>(
                        value: item,
                        child: Row(
                          children: [
                            SizedBox(width: 8),
                            Text(item),
                          ],
                        ),
                      );
                    }).toList();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedOption1 ?? 'All Properties'),
                        Icon(Icons.arrow_downward),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20), // Add spacing between the dropdowns

              // Right Dropdown Button
              SizedBox(
                width: 155, // Set the desired width
                height: 50, // Set the desired height
                child: PopupMenuButton<String>(
                  onSelected: (newValue) {
                    setState(() {
                      selectedOption2 = newValue;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return rightDropdownItems.map((item) {
                      return PopupMenuItem<String>(
                        value: item,
                        child: Row(
                          children: [
                            SizedBox(width: 8),
                            Text(item),
                          ],
                        ),
                      );
                    }).toList();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedOption2 ?? 'Latest Saved'),
                        Icon(Icons.arrow_downward),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
