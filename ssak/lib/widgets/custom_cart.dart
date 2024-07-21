import 'package: flutter/ material.dart';
import '../screens/ detail_screen.dart';

class CustomCard extends
StatelessWidget {
  final String title;
  final String description;

  CustomCard({required this.title, required this.description});
  
  @override
  Widget build(BuildContext context)
{
    return Card(
      child: ListTile(
        title: Text(title), 
        subtitle: Text(description),
        onTap: () {
          Navigator.push( 
            context,
            MaterialPageRoute ( 
              builder: (context) =>
  DetailScreen(title: title, 
  description: description),
            ),
          );
        },
      ),
    );
}
}