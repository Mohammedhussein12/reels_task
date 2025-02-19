// ReelResponse -> ReelEntity
import '../../domain/entities/reel_entity.dart';
import '../../domain/entities/reel_item_entity.dart';
import '../../domain/entities/reel_links_entity.dart';
import '../../domain/entities/reel_meta_entity.dart';
import '../../domain/entities/reel_meta_link_entity.dart';
import '../models/reel_data_model.dart';
import '../models/reel_links_model.dart';
import '../models/reel_meta_link_model.dart';
import '../models/reel_meta_model.dart';
import '../models/reel_response_model.dart';

extension ReelResponseMapper on ReelResponseModel {
  ReelEntity toEntity() {
    return ReelEntity(
      items: data.map((item) => item.toEntity()).toList(),
      links: links.toEntity(),
      meta: meta.toEntity(),
      status: status,
      message: message,
      maintenanceMode: maintenanceMode,
    );
  }
}

// ReelData -> ReelItemEntity
extension ReelDataMapper on ReelDataModel {
  ReelItemEntity toEntity() {
    return ReelItemEntity(
      id: id,
      isMine: isMine,
      roomId: roomId,
      videoUrl: video,
      previewUrl: preview,
      size: size,
      duration: duration,
      likesCountTranslated: likesCountTranslated,
      isLiked: authLikeStatus,
    );
  }
}

// ReelLinks -> ReelLinksEntity
extension ReelLinksMapper on ReelLinksModel {
  ReelLinksEntity toEntity() {
    return ReelLinksEntity(
      firstPageUrl: first,
      lastPageUrl: last,
      prevPageUrl: prev,
      nextPageUrl: next,
    );
  }
}

// ReelMeta -> ReelMetaEntity
extension ReelMetaMapper on ReelMetaModel {
  ReelMetaEntity toEntity() {
    return ReelMetaEntity(
      currentPage: currentPage,
      from: from,
      lastPage: lastPage,
      paginationLinks: links.map((link) => link.toEntity()).toList(),
      baseUrl: path,
      itemsPerPage: perPage,
      to: to,
      totalItems: total,
    );
  }
}

// ReelMetaLink -> ReelMetaLinkEntity
extension ReelMetaLinkMapper on ReelMetaLinkModel {
  ReelMetaLinkEntity toEntity() {
    return ReelMetaLinkEntity(
      linkUrl: url,
      label: label,
      isActive: active,
    );
  }
}

// ReelEntity -> ReelResponse (Optional reverse mapper)
extension ReelEntityToResponseMapper on ReelEntity {
  ReelResponseModel toModel() {
    return ReelResponseModel(
      data: items.map((item) => item.toModel()).toList(),
      links: links.toModel(),
      meta: meta.toModel(),
      status: status,
      message: message,
      maintenanceMode: maintenanceMode,
    );
  }
}

// ReelItemEntity -> ReelData
extension ReelItemEntityToModelMapper on ReelItemEntity {
  ReelDataModel toModel() {
    return ReelDataModel(
      id: id,
      isMine: isMine,
      roomId: roomId,
      video: videoUrl,
      preview: previewUrl,
      size: size,
      duration: duration,
      likesCountTranslated: likesCountTranslated,
      authLikeStatus: isLiked,
    );
  }
}

// ReelLinksEntity -> ReelLinks
extension ReelLinksEntityToModelMapper on ReelLinksEntity {
  ReelLinksModel toModel() {
    return ReelLinksModel(
      first: firstPageUrl,
      last: lastPageUrl,
      prev: prevPageUrl,
      next: nextPageUrl,
    );
  }
}

// ReelMetaEntity -> ReelMeta
extension ReelMetaEntityToModelMapper on ReelMetaEntity {
  ReelMetaModel toModel() {
    return ReelMetaModel(
      currentPage: currentPage,
      from: from,
      lastPage: lastPage,
      links: paginationLinks.map((link) => link.toModel()).toList(),
      path: baseUrl,
      perPage: itemsPerPage,
      to: to,
      total: totalItems,
    );
  }
}

// ReelMetaLinkEntity -> ReelMetaLink
extension ReelMetaLinkEntityToModelMapper on ReelMetaLinkEntity {
  ReelMetaLinkModel toModel() {
    return ReelMetaLinkModel(
      url: linkUrl,
      label: label,
      active: isActive,
    );
  }
}