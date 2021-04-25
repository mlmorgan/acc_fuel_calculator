// List<int> searchByName(String keyword, items) {
//   var returned = List<int>();
//   if (keyword != null && items != null && keyword.isNotEmpty) {
//     keyword.split(" ").forEach((k) {
//       int i = 0;
//       items.forEach((item) {
//         if (k.isNotEmpty &&
//             (item.value.name
//                 .toString()
//                 .toLowerCase()
//                 .contains(k.toLowerCase()))) {
//           returned.add(i);
//         }
//         i++;
//       });
//     });
//   }
//   if (keyword.isEmpty) {
//     returned = Iterable<int>.generate(items.length).toList();
//   }
//   return (returned);
// }
