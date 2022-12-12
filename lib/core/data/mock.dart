import 'package:flutter/material.dart';

import '../../features/cart/data/model/cart_model.dart';
import '../../features/products/data/models/category_model.dart';
import '../../features/products/data/models/product_model.dart';

// Product productMockData = Product(
//   homeStore: [
//     HomeStore(
//       id: 1,
//       isNew: true,
//       title: 'Iphone 12',
//       subtitle: 'Súper. Mega. Rápido.',
//       picture:
//           'https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both',
//       isBuy: true,
//     ),
//     HomeStore(
//       id: 2,
//       title: 'Samsung Galaxy A71',
//       subtitle: 'Súper. Mega. Rápido.',
//       picture:
//           'https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg',
//       isBuy: true,
//     ),
//     HomeStore(
//       id: 3,
//       title: 'Xiaomi Mi 11 ultra',
//       subtitle: 'Súper. Mega. Rápido.',
//       picture:
//           'https://static.digit.in/default/942998b8b4d3554a6259aeb1a0124384dbe0d4d5.jpeg',
//       isBuy: true,
//     ),
//   ],
//   bestSeller: [
//     BestSeller(
//       id: 111,
//       isFavorites: true,
//       title: 'Samsung Galaxy s20 Ultra',
//       priceWithoutDiscount: 1047,
//       discountPrice: 1500,
//       picture:
//           'https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg',
//     ),
//     BestSeller(
//       id: 222,
//       isFavorites: true,
//       title: 'Xiaomi Mi 10 Pro',
//       priceWithoutDiscount: 300,
//       discountPrice: 400,
//       picture:
//           'https://mi92.ru/wp-content/uploads/2020/03/smartfon-xiaomi-mi-10-pro-12-256gb-global-version-starry-blue-sinij-1.jpg',
//     ),
//     BestSeller(
//       id: 3333,
//       isFavorites: true,
//       title: 'Samsung Note 20 Ultra',
//       priceWithoutDiscount: 1047,
//       discountPrice: 1500,
//       picture:
//           'https://opt-1739925.ssl.1c-bitrix-cdn.ru/upload/iblock/c01/c014d088c28d45b606ed8c58e5817172.jpg?160405904823488',
//     ),
//     BestSeller(
//       id: 4444,
//       isFavorites: true,
//       title: 'Motorola One Edge',
//       priceWithoutDiscount: 300,
//       discountPrice: 400,
//       picture: 'https://www.benchmark.rs/assets/img/news/edge1.jpg',
//     ),
//   ],
// );

// Cart cartMockData = Cart(
//   id: "4",
//   delivery: "Free",
//   total: 3300,
//   basket: [
//     Basket(
//       id: 1,
//       images:
//           "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg",
//       price: 1500,
//       title: "Galaxy Note 20\nUltra",
//     ),
//     Basket(
//       id: 2,
//       images:
//           "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-silver-select?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1631652954000",
//       price: 1800,
//       title: "iPhone 13",
//     ),
//   ],
// );

// ProductDetail productDetailMockData = ProductDetail(
//   id: "3",
//   cpu: "Exynos 990",
//   camera: "108 + 12 mp",
//   capacity: ["126", "252"],
//   color: ["#772D03", "#010035"],
//   images: [
//     "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
//     "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg"
//   ],
//   isFavorites: true,
//   price: 1500,
//   rating: 4.5,
//   sd: "256 GB",
//   ssd: "8 GB",
//   title: "Galaxy Note 20 Ultra",
// );

List<Category> categoriesMockData = [
  Category(
    id: '1',
    catTitle: 'Phones',
    catIcon: Icons.phone,
  ),
  Category(
    id: '2',
    catTitle: 'Computers',
    catIcon: Icons.computer_sharp,
  ),
  Category(
    id: '3',
    catTitle: 'Health',
    catIcon: Icons.health_and_safety,
  ),
  Category(
    id: '4',
    catTitle: 'Books',
    catIcon: Icons.book_sharp,
  ),
  Category(
    id: '5',
    catTitle: 'For Home',
    catIcon: Icons.home,
  ),
  Category(
    id: '6',
    catTitle: 'Beauty',
    catIcon: Icons.girl,
  ),
];
