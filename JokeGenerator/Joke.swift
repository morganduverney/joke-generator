//
//  Joke.swift
//  JokeGenerator
//
//  Created by Morgan Duverney on 6/1/21.
//

import Foundation

struct Joke: Decodable {
    let id: Int
    let setup: String
    let punchline: String
}
