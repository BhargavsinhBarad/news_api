class api_model {
  Map source;
  dynamic author;
  dynamic title;
  dynamic description;
  dynamic url;
  dynamic urlToImage;
  dynamic publishedAt;
  dynamic content;

  api_model(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content,
      required this.publishedAt});

  factory api_model.api({required Map data}) {
    return api_model(
      source: data['source'],
      author: data['author'],
      title: data['title'],
      description: data['description'],
      url: data['url'],
      urlToImage: data['urlToImage'],
      content: data['content'],
      publishedAt: data['publishedAt'],
    );
  }
}
