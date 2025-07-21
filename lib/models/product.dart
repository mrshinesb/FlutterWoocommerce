import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String name;
  final int featuredMedia;
  String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.featuredMedia,
    this.imageUrl = '',
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['title']['rendered'],
      featuredMedia: json['featured_media'],
    );
  }

  Future<void> loadImageUrl() async {
    if (featuredMedia == 0) return;
    final res = await http.get(
      Uri.parse('https://mobile.sbglobal.uk/wp-json/wp/v2/media/$featuredMedia'),
    );
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      imageUrl = data['source_url'] ?? '';
    }
  }
}
