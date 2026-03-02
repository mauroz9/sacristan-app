class Page<T> {
  final List<T> content;
  final PageInfo page;

  Page({
    required this.content,
    required this.page,
  });

  factory Page.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return Page(
      content: List<T>.from(
        (json['content'] as List<dynamic>?)?.map((x) => fromJsonT(x)) ?? [],
      ),
      page: PageInfo.fromJson(json['page'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) => {
    'content': content.map((x) => toJsonT(x)).toList(),
    'page': page.toJson(),
  };
}

class PageInfo {
  final int size;
  final int number;
  final int totalElements;
  final int totalPages;

  PageInfo({
    required this.size,
    required this.number,
    required this.totalElements,
    required this.totalPages,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      size: json['size'] as int? ?? 0,
      number: json['number'] as int? ?? 0,
      totalElements: json['totalElements'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'size': size,
    'number': number,
    'totalElements': totalElements,
    'totalPages': totalPages,
  };
}
