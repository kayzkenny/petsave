import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimalRow extends StatelessWidget {
  const AnimalRow({
    required this.animal,
    super.key,
  });
  final Animal animal;

  // write a method that an animal age and returns a  pill widget
  // the ages are 'Adult', 'Baby', 'Young',
  PillWidget _agePill(String age) {
    switch (age) {
      case 'Adult':
        return PillWidget(
          label: 'Adult',
          backgroundColor: Colors.lightGreen.shade100,
          textColor: Colors.green,
        );

      case 'Baby':
        return PillWidget(
          label: 'Baby',
          backgroundColor: Colors.lightBlue.shade100,
          textColor: Colors.blue,
        );
      case 'Young':
        return PillWidget(
          label: 'Young',
          backgroundColor: Colors.orange.shade100,
          textColor: Colors.orange,
        );
      default:
        return PillWidget(
          label: 'Unknown',
          backgroundColor: Colors.teal.shade100,
          textColor: Colors.teal,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          animal.photos?.isEmpty ?? true
              ? FlutterLogo(size: 100.0)
              : Image.network(
                  animal.photos![0].medium!,
                  width: 100.0,
                  height: 150.0,
                  fit: BoxFit.fitHeight,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${animal.name}',
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  '${animal.breeds?.primary} ${animal.type}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 4.0),
                if (animal.description != null) ...[
                  Text(
                    '${animal.description}',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 8.0),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _agePill(animal.age ?? 'Adult'),
                    SizedBox(width: 8.0),
                    PillWidget(
                      label: '${animal.gender}',
                      backgroundColor: Colors.red.shade100,
                      textColor: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(width: 16.0),
          IconButton(
            onPressed: () => context.push('/animals/${animal.id}'),
            icon: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

class PillWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  const PillWidget(
      {super.key,
      required this.label,
      required this.backgroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12.0,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
