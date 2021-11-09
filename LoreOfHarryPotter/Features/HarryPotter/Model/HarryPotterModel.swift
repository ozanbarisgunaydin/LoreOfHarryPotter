//
//  HarryPotterModel.swift
//  LoreOfHarryPotter
//
//  Created by Ozan Barış Günaydın on 5.11.2021.
//

import Foundation

struct WelcomeElement: Codable {
    let name: String?
    let alternateNames: AlternateNames?
    let species: Species?
    let gender: Gender?
    let house: House?
    let dateOfBirth: DateOfBirth?
    let yearOfBirth: YearOfBirth?
    let wizard: Bool?
    let ancestry: Ancestry?
    let eyeColour: EyeColour?
    let hairColour: HairColour?
    let wand: Wand?
    let patronus: Patronus?
    let hogwartsStudent, hogwartsStaff: Bool?
    let actor: String?
    let alternateActors: [String]?
    let alive: Bool?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case name
        case alternateNames
        case species, gender, house, dateOfBirth, yearOfBirth, wizard, ancestry, eyeColour, hairColour, wand, patronus, hogwartsStudent, hogwartsStaff, actor
        case alternateActors
        case alive, image
    }
}

enum AlternateNames: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(AlternateNames.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AlternateNames"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

enum Ancestry: String, Codable {
    case empty = ""
    case halfBlood = "half-blood"
    case muggle = "muggle"
    case muggleborn = "muggleborn"
    case pureBlood = "pure-blood"
    case squib = "squib"
}

enum DateOfBirth: String, Codable {
    case empty = ""
    case the01031980 = "01-03-1980"
    case the03111959 = "03-11-1959"
    case the04101925 = "04-10-1925"
    case the05061980 = "05-06-1980"
    case the06021950 = "06-02-1950"
    case the06121928 = "06-12-1928"
    case the09011960 = "09-01-1960"
    case the10031960 = "10-03-1960"
    case the11081981 = "11-08-1981"
    case the13021981 = "13-02-1981"
    case the19091979 = "19-09-1979"
    case the30071980 = "30-07-1980"
    case the31071980 = "31-07-1980"
    case the31121926 = "31-12-1926"
}

enum EyeColour: String, Codable {
    case amber = "amber"
    case black = "black"
    case blue = "blue"
    case brown = "brown"
    case dark = "dark"
    case empty = ""
    case green = "green"
    case grey = "grey"
    case hazel = "hazel"
    case orange = "orange"
    case paleSilvery = "pale, silvery"
    case red = "red"
    case white = "white"
    case yellow = "yellow"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

enum HairColour: String, Codable {
    case bald = "bald"
    case black = "black"
    case blond = "blond"
    case blonde = "blonde"
    case brown = "brown"
    case brows = "brows"
    case dark = "dark"
    case empty = ""
    case ginger = "ginger"
    case grey = "grey"
    case red = "red"
    case sandy = "sandy"
    case silver = "silver"
    case white = "white"
}

enum House: String, Codable {
    case empty = ""
    case gryffindor = "Gryffindor"
    case huffleluff = "Huffleluff"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
    case slythetin = "Slythetin"
}

enum Patronus: String, Codable {
    case boar = "boar"
    case doe = "doe"
    case empty = ""
    case goat = "goat"
    case hare = "hare"
    case horse = "horse"
    case jackRussellTerrier = "Jack Russell terrier"
    case lynx = "lynx"
    case otter = "otter"
    case persianCat = "persian cat"
    case stag = "stag"
    case swan = "swan"
    case tabbyCat = "tabby cat"
    case weasel = "weasel"
    case wolf = "wolf"
}

enum Species: String, Codable {
    case acromantula = "acromantula"
    case cat = "cat"
    case centaur = "centaur"
    case dragon = "dragon"
    case ghost = "ghost"
    case giant = "giant"
    case goblin = "goblin"
    case halfGiant = "half-giant"
    case hippogriff = "hippogriff"
    case houseELF = "house-elf"
    case human = "human"
    case owl = "owl"
    case poltergeist = "poltergeist"
    case threeHeadedDog = "three-headed dog"
    case werewolf = "werewolf"
}

// MARK: - Wand
struct Wand: Codable {
    let wood: String?
    let core: Core?
    let length: Length?
}

enum Core: String, Codable {
    case dragonHeartstring = "dragon heartstring"
    case empty = ""
    case phoenixFeather = "phoenix feather"
    case unicornHair = "unicorn hair"
    case unicornTailHair = "unicorn tail-hair"
}

enum Length: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Length.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Length"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum YearOfBirth: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(YearOfBirth.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for YearOfBirth"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

/*
// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let name: String
    let alternateNames: AlternateNames
    let species: Species
    let gender: Gender
    let house: House
    let dateOfBirth: DateOfBirth
    let yearOfBirth: YearOfBirth
    let wizard: Bool
    let ancestry: Ancestry
    let eyeColour: EyeColour
    let hairColour: HairColour
    let wand: Wand
    let patronus: Patronus
    let hogwartsStudent, hogwartsStaff: Bool
    let actor: String
    let alternateActors: [String]
    let alive: Bool
    let image: String
}

enum AlternateNames: Codable {
    case string(String)
    case stringArray([String])
}

enum Ancestry: Codable {
    case empty
    case halfBlood
    case muggle
    case muggleborn
    case pureBlood
    case squib
}

enum DateOfBirth: Codable {
    case empty
    case the01031980
    case the03111959
    case the04101925
    case the05061980
    case the06021950
    case the06121928
    case the09011960
    case the10031960
    case the11081981
    case the13021981
    case the19091979
    case the30071980
    case the31071980
    case the31121926
}

enum EyeColour: Codable {
    case amber
    case black
    case blue
    case brown
    case dark
    case empty
    case green
    case grey
    case hazel
    case orange
    case paleSilvery
    case red
    case white
    case yellow
}

enum Gender: Codable {
    case female
    case male
}

enum HairColour: Codable {
    case bald
    case black
    case blond
    case blonde
    case brown
    case brows
    case dark
    case empty
    case ginger
    case grey
    case red
    case sandy
    case silver
    case white
}

enum House: Codable {
    case empty
    case gryffindor
    case huffleluff
    case hufflepuff
    case ravenclaw
    case slytherin
    case slythetin
}

enum Patronus: Codable {
    case boar
    case doe
    case empty
    case goat
    case hare
    case horse
    case jackRussellTerrier
    case lynx
    case otter
    case persianCat
    case stag
    case swan
    case tabbyCat
    case weasel
    case wolf
}

enum Species: Codable {
    case acromantula
    case cat
    case centaur
    case dragon
    case ghost
    case giant
    case goblin
    case halfGiant
    case hippogriff
    case houseELF
    case human
    case owl
    case poltergeist
    case threeHeadedDog
    case werewolf
}

// MARK: - Wand
struct Wand: Codable {
    
    let wood: String
    let core: Core
    let length: Length
}

enum Core: Codable {
    case dragonHeartstring
    case empty
    case phoenixFeather
    case unicornHair
    case unicornTailHair
}

enum Length: Codable {
    case double(Double)
    case string(String)
}

enum YearOfBirth: Codable {
    case integer(Int)
    case string(String)
}
 
 */
