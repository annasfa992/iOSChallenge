//
//  MostPopulerEnumResponseModel.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import Foundation
public enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}



public enum ResultType: String, Codable {
    case article = "Article"
}


public enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

public enum Subtype: String, Codable {
    case photo = "photo"
}

public enum MediaType: String, Codable {
    case image = "image"
}
public enum Subsection: String, Codable {
    case americas = "Americas"
    case empty = ""
    case politics = "Politics"
}

