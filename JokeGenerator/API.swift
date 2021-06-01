//
//  API.swift
//  JokeGenerator
//
//  Created by Morgan Duverney on 6/1/21.
//

import Foundation

enum API {
    static func getJoke(completionHandler: @escaping (Joke) -> ()) {
        // Ensure url is valid
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else {
            print("URL is invalid")
            return
        }
        // Create data task with verified url annd completion handler
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            // If an error is returned, print it out and exit
            if let error = error {
                print("Error occurred while getting joke: \(error)")
                return
            }
            // Ensure the response contains a 200 code
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response")
                return
            }
            // Ensure data can be sucessfully decoded
            guard let data = data,
                  let joke = try? JSONDecoder().decode(Joke.self, from: data) else {
                print("Failed to decode joke data")
                return
            }
            // Pass off joke to completion handler
            completionHandler(joke)
        })
        .resume()
    }
}
