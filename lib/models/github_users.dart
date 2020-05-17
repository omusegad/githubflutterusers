class GithubUsers{
  final int totalCount;
  final bool incompleteResults ;
  final List<Items> items;

  GithubUsers({this.totalCount, this.incompleteResults, this.items});

  factory GithubUsers.fromJson(Map<String, dynamic> json){
      return GithubUsers(
        totalCount:json['total_count'],
        incompleteResults:json['incomplete_results'],
        items:parseItems(json)
      );
    }


  static List<Items> parseItems(itemsJson) {
    var list = itemsJson['items'] as List;
    List<Items> itemsList =
        list.map((data) => Items.fromJson(data)).toList();
    return itemsList;
  }


}

class Items {
   final int itemId;
   final String name;
   final String fullName;
   final Owner owner;
   Items({this.itemId,this.name,this.fullName,this.owner});

  factory Items.fromJson(Map<String, dynamic> json){
    return Items(
      itemId:json['id'],
      name:json['name'],
      fullName:json['full_name'],
      owner: Owner.fromJson(json['owner'])
    );
  }

}


class Owner{
  final String avatarUrl;
  final String htmlUrl;
  Owner({this.avatarUrl,this.htmlUrl});

  factory Owner.fromJson(Map<String, dynamic> json){
    return Owner(
      avatarUrl:json['avatar_url'],
      htmlUrl:json['html_url']
    );
  }


}