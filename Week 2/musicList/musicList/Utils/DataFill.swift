//
//  DataFill.swift
//  musicList
//
//  Created by Consultant on 6/9/22.
//

import Foundation
import UIKit

struct DataFill{
    
    func returnData() -> [Artist]{
        return [
            Artist(
                image: UIImage(named: "beatles")!,
                name: "The Beatles",
                recordSells: "~ 290 million",
                activeYears: "1960 – 1970",
                foundedIn: "Liverpool, England, United Kingdom",
                members: ["George Harrison", "John Lennon", "Paul McCartney", "Ringo Starr"],
                genre: "Rock",
                bestSellingAlbum: "The Beatles (1968)"
            ),
            Artist(
                image: UIImage(named: "eagles")!,
                name: "The Eagles",
                recordSells: "~ 160 million",
                activeYears: "1971 – present",
                foundedIn: "Los Angeles, California, USA",
                members: ["Don Henley", "Joe Walsh", "Timothy Schmit", " Bernie Leadon", "Randy Meisner", "Glenn Frey"],
                genre: "Rock",
                bestSellingAlbum: "Greatest Hits (1971-1975, 1976)"
            ),
            Artist(
                image: UIImage(named: "queen")!,
                name: "Queen",
                recordSells: "~ 150 million",
                activeYears: "1970 – present",
                foundedIn: "London, England, UK",
                members: ["Brian May", "Roger Taylor", "Farrokh Bulsara (“Freddie Mercury”)", "John Deacon"],
                genre: "Rock",
                bestSellingAlbum: "Greatest Hits (1981)"
            ),
            Artist(
                image: UIImage(named: "zeppelin")!,
                name: "Led Zeppelin",
                recordSells: "~ 140 million",
                activeYears: "1968 – 1980",
                foundedIn: "London, England, UK",
                members: ["John Baldwin", "John Bonham", "Jimmy Page", "Robert Plant"],
                genre: "Hard Rock",
                bestSellingAlbum: "Led Zeppelin IV (1971)"
            ),
            Artist(
                image: UIImage(named: "pink")!,
                name: "Pink Floyd",
                recordSells: "~ 130 million",
                activeYears: "1965 – 2014",
                foundedIn: "London, England, UK",
                members: ["Syd Barrett", "Nick Mason", "Roger Waters", "David Gilmour"],
                genre: "Rock",
                bestSellingAlbum: "The Dark Side of the Moon (1973)"
            ),
            Artist(
                image: UIImage(named: "acdc")!,
                name: "AC/DC",
                recordSells: "~ 125 million",
                activeYears: "1973 – present",
                foundedIn: "Sydney, New South Wales, Australia",
                members: ["Angus Young", "Chris Slade", "Malcolm Young", "Phil Rudd", "Mark Evans", "Cliff Williams", "Brian Johnson", "Simon Wright"],
                genre: "Rock",
                bestSellingAlbum: "Back in Black (1980)"
            ),
            Artist(
                image: UIImage(named: "maroon")!,
                name: "Maroon 5",
                recordSells: "~ 120 million",
                activeYears: "1994 – present",
                foundedIn: "Los Angeles, California, USA",
                members: ["Adam Levine", "Jesse Carmichael", "Michael Madden", "James Valentine"],
                genre: "Pop Rock",
                bestSellingAlbum: "Songs About Jane (2002)"
            ),
            Artist(
                image: UIImage(named: "u2")!,
                name: "U2",
                recordSells: "~ 110 million",
                activeYears: "1976 – present",
                foundedIn: "Dublin, County Dublin, Ireland",
                members: ["Paul Hewson (“Bono”)", "Adam Clayton", "David Evans", "Larry Mullen"],
                genre: "Rock",
                bestSellingAlbum: "The Joshua Tree (1987)"
            ),
            Artist(
                image: UIImage(named: "metallica")!,
                name: "Metallica",
                recordSells: "~ 105 million",
                activeYears: "1981 – present",
                foundedIn: "Los Angeles, California, USA",
                members: ["James Hetfield", "Lars Ulrich", "Kirk Hammett", "Robert Trujillo"],
                genre: "Trash Metal",
                bestSellingAlbum: "Metallica (1991)"
            ),
            Artist(
                image: UIImage(named: "stones")!,
                name: "The Rolling Stones",
                recordSells: "~ 100 million",
                activeYears: "1962 – present",
                foundedIn: "Los Angeles, California, USA",
                members: ["Mick Jagger", "Keith Richards", "Charlie Watts", "Ronnie Wood", "Brian Jones", "Mick Taylor"],
                genre: "Rock",
                bestSellingAlbum: "Sticky Fingers (1971)"
            )
        ]
    }
}
