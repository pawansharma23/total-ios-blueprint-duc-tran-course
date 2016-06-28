//
//  Quotes.swift
//  Inspirus
//
//  Created by Jorge Jimenez on 6/27/16.
//  Copyright © 2016 xadrijoLab. All rights reserved.
//

import Foundation

class Qoutes {
    
    // 1.- Create an array of quotes
    let quotes = ["Stay Hungry, Stay Foolish.", "All wonders you seek are within yourself.", "Service to others is the rent you pay for your room here on Earth.", "Faith is taking the first step even when you don't see the whole staircase.", "If your ship doesn't come in, swin out to it.", "Relentless optimism is what moves the world forward.", "Your time is limited so don't waste it living someone else's life.", "Our lives begin to end the day we become silent about things that matter.", "If your dreams don't scare you, they are not big enough.", "If you are not willing to risk the unusual, you will have to settle for the ordinary.", "I act despite of my mood!", "You decided to pursue your dreams. That's confidence!", "Continuous effort - not strength or intelligence - is the key to unclocking our potential.", "When you knock on the door of opportunities, it is work who answers!", "Happiness is not something ready made. It comes from your own actions.", "Be kind whenever possible. It is always possible!", "Try not to become a man of succses but rather to become a man of value."]
    
    // 2.- Properties
    var count: Int {
        return quotes.count
    }
    
    // 3.- Methods
    // return a random quote everytime it gets called
    func randomQuotes() -> String
    {
        // need an random index
        let randomIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        let randomQuote = quotes[randomIndex]
        return randomQuote
    }
}