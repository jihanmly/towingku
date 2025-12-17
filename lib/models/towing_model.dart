class TowingModel {
  // Field yang digunakan dalam TowingDetailPage
  final String id;
  final String name;
  final String image; // Digunakan di Image.asset
  final String location;
  final double rating; // Digunakan sebagai double untuk rating
  final String description;
  final String price; // Menggunakan String agar mudah menampilkan 'Rp'
  final String phone; // Nomor telepon untuk panggilan dan WhatsApp

  TowingModel({
    required this.id,
    required this.name,
    required this.image,
    required this.location,
    required this.rating,
    required this.description,
    required this.price,
    required this.phone,
  });

  // Anda bisa menambahkan method 'copyWith' atau 'fromJson' di sini
  // jika Anda memerlukannya untuk manajemen state atau parsing data.
}

// --- CONTOH DATA UNTUK PENGUJIAN (Opsional) ---
/*
final List<TowingModel> sampleTowingList = [
  TowingModel(
    id: '1',
    name: 'Towing Amanah Jaya',
    image: 'assets/images/towing_a.jpg', // Pastikan path ini valid di assets Anda
    location: 'Jakarta Selatan',
    rating: 4.8,
    description: 'Layanan derek 24 jam untuk semua jenis kendaraan. Cepat, aman, dan terpercaya.',
    price: '500.000',
    phone: '6281234567890', // Format internasional tanpa '+'
  ),
  TowingModel(
    id: '2',
    name: 'Bantuan Darurat Mobil',
    image: 'assets/images/towing_b.jpg',
    location: 'Bandung Kota',
    rating: 4.5,
    description: 'Spesialis mobil mewah dan mogok di tol. Harga kompetitif.',
    price: '750.000',
    phone: '6289876543210',
  ),
];
*/