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
public var asset_id: Int?

public var published_date: String?
public var updated: String?
public var section: String?

public var nytdsection: String?
public var adx_keywords: String?
public var column: String?
public var byline: String?

public var title: String?
public var abstract: String?
public var des_facet: [String]?
public var org_facet: [String]?
public var per_facet: [String]?
public var geo_facet: [String]?

public var etaID: Int?

}
