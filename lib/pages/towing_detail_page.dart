import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/towing_model.dart';

class TowingDetailPage extends StatelessWidget {
  final TowingModel towing;
  const TowingDetailPage({Key? key, required this.towing}) : super(key: key);

  void _callPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _openWhatsApp(String phone, String text) async {
    final encoded = Uri.encodeComponent(text);
    final url = Uri.parse('https://wa.me/$phone?text=$encoded');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // fallback: try tel
      _callPhone(phone);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(towing.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'towing-image-${towing.id}',
              child: Image.asset(
                towing.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  height: 220,
                  child: const Center(child: Icon(Icons.car_repair, size: 60)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(towing.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18),
                      const SizedBox(width: 6),
                      Text(towing.location),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 18, color: Colors.amber),
                          const SizedBox(width: 6),
                          Text(towing.rating.toString()),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(towing.description),
                  const SizedBox(height: 18),
                  Text('Harga: Rp ${towing.price}', style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                          label: const Text('Hubungi via WhatsApp'),
                          onPressed: () => _openWhatsApp(towing.phone, 'Halo ${towing.name}, saya butuh towing. Lokasi saya: ...'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: () => _callPhone(towing.phone),
                        child: const Icon(Icons.call),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
