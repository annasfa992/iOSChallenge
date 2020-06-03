//
//  MostPopulerResultResponseModel.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import Foundation
public class MostPopulerResultResponseModel: Codable {
public var uri: String?
public var url: String?
public var id: Int?
public var assetID: Int?
public var source: Source?
public var published_date: String?
public var updated: String?
public var section: String?
public var subsection: String?
public var nytdsection: String?
public var adxKeywords: String?
public var column: Int?
public var byline: String?
public var type: ResultType?
public var title: String?
public var abstract: String?
public var desFacet: [String]?
public var orgFacet: [String]?
public var perFacet: [String]?
public var geoFacet: [String]?
public var media: [Media]?
public var etaID: Int?


}

