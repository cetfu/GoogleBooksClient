// generated with app.quicktype.io

class BooksResponse {
  String kind;
  int totalItems;
  List<Book> items;

  BooksResponse({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  factory BooksResponse.fromJson(Map<String, dynamic> json) => BooksResponse(
    kind: json['kind'],
    totalItems: json['totalItems'],
    items: (json['items'] as List<dynamic>)
        .map((e) => Book.fromJson(e))
        .toList(),
  );
}
class Book {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final UserInfo? userInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;
  final SearchInfo? searchInfo;

  Book({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    this.userInfo,
    required this.saleInfo,
    required this.accessInfo,
    this.searchInfo,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    kind: json['kind'],
    id: json['id'],
    etag: json['etag'],
    selfLink: json['selfLink'],
    volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
    userInfo: json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null,
    saleInfo: SaleInfo.fromJson(json['saleInfo']),
    accessInfo: AccessInfo.fromJson(json['accessInfo']),
    searchInfo: json['searchInfo'] != null ? SearchInfo.fromJson(json['searchInfo']) : null,
  );
}

class VolumeInfo {
  final String title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final int? pageCount;
  final Dimensions? dimensions;
  final String printType;
  final String? mainCategory;
  final List<String>? categories;
  final double? averageRating;
  final int? ratingsCount;
  final String contentVersion;
  final ImageLinks? imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.pageCount,
    this.dimensions,
    required this.printType,
    this.mainCategory,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    required this.contentVersion,
    this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'],
    subtitle: json['subtitle'],
    authors: (json['authors'] as List?)?.map((e) => e as String).toList(),
    publisher: json['publisher'],
    publishedDate: json['publishedDate'],
    description: json['description'],
    industryIdentifiers: (json['industryIdentifiers'] as List?)?.map((e) => IndustryIdentifier.fromJson(e)).toList(),
    pageCount: json['pageCount'],
    dimensions: json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null,
    printType: json['printType'],
    mainCategory: json['mainCategory'],
    categories: (json['categories'] as List?)?.map((e) => e as String).toList(),
    averageRating: (json['averageRating'] as num?)?.toDouble(),
    ratingsCount: json['ratingsCount'],
    contentVersion: json['contentVersion'],
    imageLinks: json['imageLinks'] != null ? ImageLinks.fromJson(json['imageLinks']) : null,
    language: json['language'],
    previewLink: json['previewLink'],
    infoLink: json['infoLink'],
    canonicalVolumeLink: json['canonicalVolumeLink'],
  );
}

class IndustryIdentifier {
  final String type;
  final String identifier;

  IndustryIdentifier({required this.type, required this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
    type: json['type'],
    identifier: json['identifier'],
  );
}

class Dimensions {
  final String? height;
  final String? width;
  final String? thickness;

  Dimensions({this.height, this.width, this.thickness});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    height: json['height'],
    width: json['width'],
    thickness: json['thickness'],
  );
}

class ImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;
  final String? small;
  final String? medium;
  final String? large;
  final String? extraLarge;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
    this.small,
    this.medium,
    this.large,
    this.extraLarge,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json['smallThumbnail'],
    thumbnail: json['thumbnail'],
    small: json['small'],
    medium: json['medium'],
    large: json['large'],
    extraLarge: json['extraLarge'],
  );
}

class UserInfo {
  final bool? isPurchased;
  final bool? isPreordered;
  final String? updated;

  UserInfo({this.isPurchased, this.isPreordered, this.updated});

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    isPurchased: json['isPurchased'],
    isPreordered: json['isPreordered'],
    updated: json['updated'],
  );
}

class SaleInfo {
  final String country;
  final String saleability;
  final bool isEbook;
  final Price? listPrice;
  final Price? retailPrice;
  final String? buyLink;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json['country'],
    saleability: json['saleability'],
    isEbook: json['isEbook'],
    listPrice: json['listPrice'] != null ? Price.fromJson(json['listPrice']) : null,
    retailPrice: json['retailPrice'] != null ? Price.fromJson(json['retailPrice']) : null,
    buyLink: json['buyLink'],
  );
}

class Price {
  final double amount;
  final String currencyCode;

  Price({required this.amount, required this.currencyCode});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: (json['amount'] as num).toDouble(),
    currencyCode: json['currencyCode'],
  );
}class AccessInfo {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final Format epub;
  final Format pdf;
  final String webReaderLink;
  final String accessViewStatus;
  final DownloadAccess? downloadAccess;

  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    this.downloadAccess,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    country: json['country'],
    viewability: json['viewability'],
    embeddable: json['embeddable'],
    publicDomain: json['publicDomain'],
    textToSpeechPermission: json['textToSpeechPermission'],
    epub: Format.fromJson(json['epub']),
    pdf: Format.fromJson(json['pdf']),
    webReaderLink: json['webReaderLink'],
    accessViewStatus: json['accessViewStatus'],
    downloadAccess: json['downloadAccess'] != null ? DownloadAccess.fromJson(json['downloadAccess']) : null,
  );
}

class Format {
  final bool isAvailable;
  final String? downloadLink;
  final String? acsTokenLink;

  Format({required this.isAvailable, this.downloadLink, this.acsTokenLink});

  factory Format.fromJson(Map<String, dynamic> json) => Format(
    isAvailable: json['isAvailable'],
    downloadLink: json['downloadLink'],
    acsTokenLink: json['acsTokenLink'],
  );
}

class DownloadAccess {
  final String kind;
  final String volumeId;
  final bool restricted;
  final bool deviceAllowed;
  final bool justAcquired;
  final int maxDownloadDevices;
  final int downloadsAcquired;
  final String nonce;
  final String source;
  final String reasonCode;
  final String message;
  final String signature;

  DownloadAccess({
    required this.kind,
    required this.volumeId,
    required this.restricted,
    required this.deviceAllowed,
    required this.justAcquired,
    required this.maxDownloadDevices,
    required this.downloadsAcquired,
    required this.nonce,
    required this.source,
    required this.reasonCode,
    required this.message,
    required this.signature,
  });

  factory DownloadAccess.fromJson(Map<String, dynamic> json) => DownloadAccess(
    kind: json['kind'],
    volumeId: json['volumeId'],
    restricted: json['restricted'],
    deviceAllowed: json['deviceAllowed'],
    justAcquired: json['justAcquired'],
    maxDownloadDevices: json['maxDownloadDevices'],
    downloadsAcquired: json['downloadsAcquired'],
    nonce: json['nonce'],
    source: json['source'],
    reasonCode: json['reasonCode'],
    message: json['message'],
    signature: json['signature'],
  );
}

class SearchInfo {
  final String textSnippet;

  SearchInfo({required this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
    textSnippet: json['textSnippet'],
  );
}