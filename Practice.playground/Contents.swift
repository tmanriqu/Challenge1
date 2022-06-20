import UIKit

protocol Format {
    func prettyFormat() -> String
}

struct Person: Format {
    //format
    let fullname: String
    let gender: Character           //F or M
    let dateOfBirth: String         //DD/MM/YYYY
    let numberDNI: Int              //XXXXXXXX
    let numberBrothers: Int8
    let email: String
    let userId: String?
    
    init(fullname: String, gender: Character, dateOfBirth: String, numberDNI: Int, numberBrothers: Int8, email: String) {
        self.fullname = fullname
        self.gender = gender
        self.dateOfBirth = dateOfBirth
        self.numberDNI = numberDNI
        self.numberBrothers = numberBrothers
        self.email = email
        if (email.split(separator: "@").count == 2) {
            self.userId = String(email.split(separator: "@")[0])
        } else {
            self.userId = nil
        }
    }
    
    func prettyFormat() -> String {
        let splitFullname = fullname.lowercased().split(separator: " ")
        print(splitFullname)
        return " "
    }
}

//Set persons

let person1 = Person(
    fullname: "CARLOS JOSÉ ROBLES GOMES",
    gender: "M",
    dateOfBirth: "06/08/1995",
    numberDNI: 78451245,
    numberBrothers: 2,
    email: "carlos.roblesg@hotmail.com"
)

let person2 = Person(
    fullname: "MIGUEL ANGEL QUISPE OTERO",
    gender: "M",
    dateOfBirth: "28/12/1995",
    numberDNI: 79451654,
    numberBrothers: 0,
    email: "miguel.anguel@gmail.com"
)
let person3 = Person(
    fullname: "KARLA ALEXANDRA FLORES ROSAS",
    gender: "M",
    dateOfBirth: "15/02/1997",
    numberDNI: 77485812,
    numberBrothers: 1,
    email: "Karla.alexandra@hotmail.com"
)
let person4 = Person(
    fullname: "NICOLAS QUISPE ZEBALLOS",
    gender: "M",
    dateOfBirth: "08/10/1990",
    numberDNI: 71748552,
    numberBrothers: 1,
    email: "nicolas123@gmail.com"
)
let person5 = Person(
    fullname: "PEDRO ANDRE PICASSO BETANCUR",
    gender: "M",
    dateOfBirth: "17/05/1994",
    numberDNI: 74823157,
    numberBrothers: 2,
    email: "pedroandrepicasso@gmail.com"
)
let person6 = Person(
    fullname: "FABIOLA MARIA PALACIO VEGA",
    gender: "F",
    dateOfBirth: "02/02/1992",
    numberDNI: 76758254,
    numberBrothers: 0,
    email: "fabi@hotmail.com"
)



var persons:[Person] = []
persons.append(contentsOf: [person1, person2, person3, person4, person5, person6])

//Find the oldest person
func findOldest(persons: Array<Person>) -> Person {
    var datesOfBirth: [Int] = []
    persons.forEach { person in
        datesOfBirth.append(dateOfBirthToInt(dateOfBirth: person.dateOfBirth))
    }
    let indexOldest = datesOfBirth.indices.filter { datesOfBirth[$0] == datesOfBirth.min() }
    return persons[indexOldest[0]]
}
//Find the youngest person
func findYoungest(persons: Array<Person>) -> Person {
    var datesOfBirth: [Int] = []
    persons.forEach { person in
        datesOfBirth.append(dateOfBirthToInt(dateOfBirth: person.dateOfBirth))
    }
    let indexOldest = datesOfBirth.indices.filter { datesOfBirth[$0] == datesOfBirth.max() }
    return persons[indexOldest[0]]
}

// higher value is younger
func dateOfBirthToInt(dateOfBirth: String) -> Int{
    let splitDateOfBirth = dateOfBirth.split(separator: "/")
    return Int(splitDateOfBirth[2] + splitDateOfBirth[1] + splitDateOfBirth[0])!
}

//obtener una lista de hombres y mujeres
func getWoman(persons: Array<Person>) -> Array<Person> {
    return persons.filter { $0.gender == "F" }
}
let woman = getWoman(persons: persons)

func getMan(persons: Array<Person>) -> Array<Person> {
    return persons.filter { $0.gender == "M" }
}
//obtener una lista de las personas con mas 2 hermanos
func getPersonsMoreThanTwoSiblings(persons: Array<Person>) -> Array<Person> {
    return persons.filter { $0.numberBrothers > 2 }
}
