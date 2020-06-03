//
//  MostPopulerMediaResponseModel.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import Foundation
public class Media: Codable {
public var type: MediaType?
public var subtype: Subtype?
public var caption: String?
public var copyright: String?
public var approvedForSyndication: Int?
public var mediaMetadata: [MediaMetadatum]?


}
