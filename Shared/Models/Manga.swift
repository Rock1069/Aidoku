//
//  Manga.swift
//  Aidoku
//
//  Created by Skitty on 12/20/21.
//

import Foundation
import UIKit

enum MangaStatus: Int {
    case unknown = 0
    case ongoing = 1
    case completed = 2
    case cancelled = 3
    case hiatus = 4
}

enum MangaContentRating: Int {
    case safe = 0
    case suggestive = 1
    case nsfw = 2
}

enum MangaViewer: Int {
    case rtl = 0
    case ltf = 1
    case vertical = 2
    case webtoon = 3
}

class Manga: KVCObject  {
    static func == (lhs: Manga, rhs: Manga) -> Bool {
        lhs.sourceId == rhs.sourceId && lhs.id == rhs.id
    }
    
    let sourceId: String
    let id: String
    
    var title: String?
    var author: String?
    var artist: String?
    
    var description: String?
    var tags: [String]?
    
    var cover: String?
    var url: String?
    
    var status: MangaStatus
    var nsfw: MangaContentRating
    var viewer: MangaViewer
    
    var tintColor: UIColor?
    
    init(
        sourceId: String,
        id: String,
        title: String? = nil,
        author: String? = nil,
        artist: String? = nil,
        description: String? = nil,
        tags: [String]? = nil,
        cover: String? = nil,
        url: String? = nil,
        status: MangaStatus = .unknown,
        nsfw: MangaContentRating = .safe,
        viewer: MangaViewer = .rtl
    ) {
        self.sourceId = sourceId
        self.id = id
        self.title = title
        self.author = author
        self.artist = artist
        self.description = description
        self.tags = tags
        self.cover = cover
        self.url = url
        self.status = status
        self.nsfw = nsfw
        self.viewer = viewer
    }
    
    func copy(from manga: Manga) -> Manga {
        Manga(
            sourceId: manga.sourceId,
            id: manga.id,
            title: manga.title,
            author: manga.author ?? self.author,
            artist: manga.artist ?? self.artist,
            description: manga.description ?? self.description,
            tags: manga.tags ?? self.tags,
            cover: manga.cover ?? self.cover,
            url: manga.url,
            status: manga.status,
            nsfw: manga.nsfw,
            viewer: manga.viewer
        )
    }
    
    func valueByPropertyName(name: String) -> Any? {
        switch name {
        case "id": return id
        case "title": return title
        case "author": return author
        case "artist": return artist
        case "description": return description
        case "tags": return tags
        case "cover": return cover
        case "url": return url
        case "status": return status.rawValue
        case "nsfw": return nsfw.rawValue
        case "viewer": return viewer.rawValue
        default: return nil
        }
    }
}

struct MangaPageResult {
    let manga: [Manga]
    let hasNextPage: Bool
}