//
//  NewsResponse.swift
//  NewsAppSwiftUI
//
//  Created by Consultant on 7/14/22.
//

import Foundation

struct Article: Decodable, Identifiable{
    let id: Int
    let title: String?
    let imageUrl: String?
    let url: String?
    let summary: String?
//    let publishedAt: Date?
}


extension Article{
    static var dummyData: Article{
        .init(
            id: 15770,
            title: "SpaceX and NASA set to launch CRS-25 mission to the ISS",
            imageUrl: "https://www.nasaspaceflight.com/wp-content/uploads/2022/07/KSC-20220712-PH-SPX01_0004_orig-1170x780.jpg",
            url: "https://www.nasaspaceflight.com/2022/07/spacex-crs-25-launch/",
            summary: "SpaceX is set to launch its 25th commercial resupply services (CRS) mission for the International Space Station (ISS). SpaceX CRS-25 will be launched on a flight-proven Falcon 9 while also utilizing a flight-proven Cargo Dragon 2 spacecraft. Falcon 9 B1067-5 will lift Dragon 2 Capsule 208-3 (C208-3) from Launch Complex 39A (LC-39A) on July 14 at 8:44 PM EDT (00:44 UTC on July 15)."
//            publishedAt: Date()
        )
    }
}
