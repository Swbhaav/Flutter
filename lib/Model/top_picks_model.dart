

class TopPickModel{
  String? imageUrl;
  String? title;
  double? rating;
  TopPickModel({this.imageUrl, this.title, this.rating});
}
final List<TopPickModel> TopPickList=[
  TopPickModel(
    imageUrl: 'https://i.ibb.co/TbJ9cwZ/movie3.jpg',
    title: 'Breaking Bad',
    rating: 8.5,
  ),
  TopPickModel(
    imageUrl: 'https://i.ibb.co/QCT5fMF/movie2.jpg',
    title: 'Barry',
    rating: 8.5,
  ),
  TopPickModel(
    imageUrl: 'https://i.ibb.co/XVYT7M7/movie1.jpg',
    title: 'Shameless',
    rating: 8.5,
  )
];