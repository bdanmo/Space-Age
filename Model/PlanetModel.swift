//
//  PlanetModel.swift
//  Space Age
//
//  Created by Brendan Moran on 10/2/17.
//  Copyright © 2017 Brendan Moran. All rights reserved.
//

import Foundation

func getPlanetData(_ name: String) -> (orbitalRatio: Double, demonym: String) {
    switch name.lowercased() {
    case "mercury":
        return (orbitalRatio: 0.2408467, demonym: "Mercurian")
    case "venus":
        return (orbitalRatio: 0.61519726, demonym: "Venusian")
    case "mars":
        return (orbitalRatio: 1.8808158, demonym: "Martian")
    case "jupiter":
        return (orbitalRatio: 11.862615, demonym: "Jovian")
    case "saturn":
        return (orbitalRatio: 29.447498, demonym: "Saturnian")
    case "uranus":
        return (orbitalRatio: 84.016846, demonym: "Uranian")
    case "neptune":
        return (orbitalRatio: 164.79132, demonym: "Neptunian")
    default:
        return (orbitalRatio: 1, demonym: "Terran")
    }
}

struct Planet {
    var name: String, orbitalRatio: Double, demonym: String
    let earthYearSeconds: Double = 31557600
    
    init(name: String = "earth") {
        let planetData = getPlanetData(name)
        self.name = String(name.prefix(1).uppercased()) + String(name.dropFirst())
        self.orbitalRatio = planetData.orbitalRatio
        self.demonym = planetData.demonym
    }
    
    func convertYearsToSeconds (years: Double) -> Double {
        return years * earthYearSeconds
    }
    
    func convertSecondsToPlanetYears (_ seconds: Double) -> Double {
        let earthYears = seconds / self.earthYearSeconds
        let planetYears = earthYears / self.orbitalRatio
        return planetYears
    }
    
    func convertEarthYearsToPlanetYears (_ years: Double) -> Int {
        return Int(floor(round(years / self.orbitalRatio)))
    }
}

let lerth = Planet(name: "earth")

let pranets = [lerth]
