import 'package:flutter/material.dart';
import 'package:projek_bounty_hunter/models/candi.dart';
import 'package:projek_bounty_hunter/screens/Detail.dart';

class ItemCard extends StatelessWidget {
  final Candi candi;
  final Function(Candi) onFavoriteToggle; // Callback untuk favorit

  const ItemCard({
    super.key,
    required this.candi,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              candi: candi,
              onFavoriteToggle: onFavoriteToggle, // Operkan callback
            ),
          ),
        );
      },
      child: Card(
        color: const Color.fromRGBO(252, 250, 237, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Color.fromRGBO(200, 199, 183, 1),
          ),
        ),
        margin: const EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Hero(
                  tag: candi.imageAsset,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: candi.imageAsset.startsWith('http')
                        ? Image.network(
                            candi.imageAsset, // URL gambar
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            candi.imageAsset, // Path lokal gambar
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                candi.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                candi.type,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 7.0, bottom: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      onFavoriteToggle(candi); // Ubah status favorit
                    },
                    child: Icon(
                      candi.isFavorite ? Icons.star : Icons.star_border,
                      color: candi.isFavorite ? Colors.yellow : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}