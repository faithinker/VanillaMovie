//
//  MovieModel.swift
//  VanillaMovie
//
//  Created by pineone on 2022/05/17.
//

import UIKit

// MARK: - MovieResponse 공통 리스폰스
struct MovieResponse: Codable {
    let status, statusMessage: String
    let data: MovieListModel // Any
    let meta: Meta

    enum CodingKeys: String, CodingKey {
        case status
        case statusMessage = "status_message"
        case data
        case meta = "@meta"
    }
}

// MARK: - MovieListModel
struct MovieListModel: Codable {
    let movieCount, limit, pageNumber: Int
    let movieList: [Movie]

    enum CodingKeys: String, CodingKey {
        case movieCount = "movie_count"
        case limit
        case pageNumber = "page_number"
        case movieList = "movies"
    }
}

struct Movie: Codable {
    /// 영화상세정보보기 위한 Id
    let id: Int?
    /// 웹브라우저 url
    let url: String?
    let title: String?
    let rating: Double?
    let runtime: Int?
    let genres: [String]
    let year: Int?
    let smallCoverImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id, url, title, rating, runtime, genres, year
        case smallCoverImage = "small_cover_image"
    }
}


// MARK: - Meta
struct Meta: Codable {
    let serverTime: Int
    let serverTimezone: String
    let apiVersion: Int
    let executionTime: String

    enum CodingKeys: String, CodingKey {
        case serverTime = "server_time"
        case serverTimezone = "server_timezone"
        case apiVersion = "api_version"
        case executionTime = "execution_time"
    }
}

