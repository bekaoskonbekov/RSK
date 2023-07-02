class JwtTokens {
  String? refresh;
  String? access;

  JwtTokens({this.refresh, this.access,});

  JwtTokens.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
   
    return data;
  }
}