
import 'SectionModel.dart';

class TopicField {
  static const createdTime = 'createdTime';
}

class TopicModel {
  DateTime? createdTime;
  int topicId;
  String topicTitle;
  String topicDescription;
  List<TopicModel> topics = [];
  List<SectionModel> sections = [];
    // List<CommentsModel> comments = [];
  bool isPosted = false;
  

  TopicModel({
    this.createdTime,
    this.topicId = 0,
    required this.topicTitle,
    required this.topicDescription ,
    // this.comments = const [],
    // this.topics = const [],
  });

  // List<SectionModel> get sectionList => sections;
  List<TopicModel> get topicList => topics;
    // List<CommentsModel> get commentList => comments;

  int get id => topicId;
  String get title => topicTitle;
  String get description => topicDescription;

  set setId(int id) {
    topicId = id;
  }


  set setTitle(String title) {
    topicTitle = title;
  }

  set setDesription(String description) {
    topicDescription = description;
  }

      void setTopicList(List<TopicModel> topic) {
     topics = topic;
  }


  void resetTopics(TopicModel topic){
    topics.clear();
  }
  // void addComment(CommentsModel comment) {
  //   comments.add(comment);
  // }

  // void removeComment(CommentsModel comment) {
  //   comments.remove(comment);
  // }

  // void setCommentList(List<CommentsModel> comments){
  //   this.comments=comments;
  // }

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
 
      topicId: json['id'],
      topicTitle: json['title'],
      topicDescription: json['description']
    );
  }

  // void addTopic(TopicModel topic) {
  //   topics.add(topic);
  // }

  // void toggleCompleted() {
  //   completed = !completed;
  // }

  dynamic toJson() => {
        'id': topicId,
        'title': topicTitle,
        'description': topicDescription,
      };
}
