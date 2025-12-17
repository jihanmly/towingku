import '../models/towing_model.dart';

final List<TowingModel> towingData = [
  TowingModel(
    // ID diubah dari int menjadi String:
    id: '1', 
    name: "Towing Aman Jaya",
    location: "Bekasi",
    // Price diubah dari int menjadi String:
    price: '150000', 
    phone: "081234567890",
    image: "assets/images/towing1.jpg",
    rating: 4.8,
    description: "Layanan towing cepat dan terpercaya, siap 24 jam. Mengutamakan keamanan kendaraan selama proses evakuasi.",
  ),
  TowingModel(
    // ID diubah dari int menjadi String:
    id: '2', 
    name: "Towing Mantap",
    location: "Jakarta Timur",
    // Price diubah dari int menjadi String:
    price: '170000', 
    phone: "081298765432",
    image: "assets/images/towing2.jpg",
    rating: 4.6,
    description: "Towing Mantap melayani mobil dan motor, tersedia layanan derek darurat dan penggantian ban.",
  ),
  TowingModel(
    // ID diubah dari int menjadi String:
    id: '3', 
    name: "Towing Cepat",
    location: "Depok",
    // Price diubah dari int menjadi String:
    price: '140000', 
    phone: "081212345678",
    image: "assets/images/towing3.jpg",
    rating: 4.5,
    description: "Harga kompetitif, teknisi berpengalaman, estimasi tiba 20-40 menit tergantung lokasi.",
  ),
];