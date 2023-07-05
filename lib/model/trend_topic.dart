class TrendTopic {
  String location  = 'Trending in Turkey';
  String hashtag  = '#Bisiler';
  String tweets  = '16.8K Tweets';

  TrendTopic({location, hashtag, tweets});

  TrendTopic.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    hashtag = json['hashtag'];
    tweets = json['tweets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['hashtag'] = this.hashtag;
    data['tweets'] = this.tweets;
    return data;
  }
}