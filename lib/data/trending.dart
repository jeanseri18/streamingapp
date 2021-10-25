class Trending {
  final int id;
  final String name;
  final String image;
  final String type;
  final String rating;
  final String file;
  const Trending(
      {this.id, this.name, this.image, this.type, this.rating, this.file});
}

class TrendingList {
  static List<Trending> list() {
    const data = <Trending>[
      Trending(
        id: 1,
        name: 'Usluss Us',
        image: 'assets/images/trending/1.png',
        type: 'Horror',
        rating: '8',
      ),
      Trending(
        id: 2,
        name: 'Roy',
        image: 'assets/images/trending/2.png',
        type: 'Romantic',
        rating: '5.5',
      ),
      Trending(
        id: 3,
        name: 'Stranger',
        image: 'assets/images/trending/3.png',
        type: 'Series',
        rating: '6',
      ),
      Trending(
        id: 4,
        name: 'Mr. Vengeance',
        image: 'assets/images/trending/4.png',
        type: 'Thriller',
        rating: '5.5',
      ),
      Trending(
        id: 5,
        name: 'Zootopiya',
        image: 'assets/images/trending/5.png',
        type: 'Animation',
        rating: '8',
      ),
      Trending(
        id: 6,
        name: 'Loco',
        image: 'assets/images/trending/6.png',
        type: 'Animation',
        rating: '5.5',
      ),
      Trending(
        id: 7,
        name: 'Despicable Me',
        image: 'assets/images/trending/7.png',
        type: 'Animation',
        rating: '9',
      ),
      Trending(
        id: 8,
        name: 'Incredible',
        image: 'assets/images/trending/8.png',
        type: 'Animation',
        rating: '8.5',
      ),
    ];
    return data;
  }
}
