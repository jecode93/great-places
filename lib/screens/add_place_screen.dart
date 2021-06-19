import 'package:flutter/material.dart';
import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(height: 10,),
                  ImageInput(),

                ],
                ),
              ),
            )
          )
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            onPressed: () {},
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
            color: Colors.accents,
          )
        ],
      ),
    );
  }
}
