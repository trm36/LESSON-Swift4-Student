//: Playground - noun: a place where people can play

import UIKit

var array = ["a", "b", "c", "d", "e"]

protocol MyDelegate {}









/*----MULTI-LINE STRINGS----*/
//SWIFT 3

let longMessage = "The year 1866 was signalised by a remarkable incident, a mysterious and puzzling phenomenon, which doubtless no one has yet forgotten.\n\nNot to mention rumours which agitated the maritime population and excited the public mind, even in the interior of continents, seafaring men were particularly excited.\n\nMerchants, common sailors, captains of vessels, skippers, both of Europe and America, naval officers of all countries, and the Governments of several States on the two continents, were deeply interested in the matter."
















/*----MULTI-LINE STRINGS----*/
//SWIFT 4

let multiLineMessage = """
    The year 1866 was signalised by a remarkable incident, a mysterious and puzzling phenomenon, which doubtless no one has yet forgotten.

    Not to mention rumours which agitated the maritime population and excited the public mind, even in the interior of continents, seafaring men were particularly excited.

    Merchants, common sailors, captains of vessels, skippers, both of Europe and America, naval officers of all countries, and the Governments of several States on the two continents, were deeply interested in the matter.
    """

/* GOTCHA! will not compile!
 
let singleLineMessage = """The year 1866 was signalised by a remarkable incident, a mysterious and puzzling phenomenon, which doubtless no one has yet forgotten."""
 */







/*----ONE SIDED RANGES----*/
//SWIFT 3 *DIDN'T EXIST*

//let middle = array.count / 2
//let firstHalf = array[0..<middle]
//let secondHalf = array[middle..<array.count]


/*----ONE SIDED RANGES----*/
//SWIFT 4

let middle = array.count / 2
let firstHalf = array[..<middle]
let secondHalf = array[middle...]



let someNumber: Int = 5

switch someNumber {
case ..<0:
    print("negative")
case 0...:
    print("positive")
default:
    break
}












/*----Combined Class and Protocol Types----*/
//SWIFT 3 *DIDN'T EXIST*

//     ¯\_(ツ)_/¯

/*----Combined Class and Protocol Types----*/
//SWIFT 4

let object: UITableViewController & MyDelegate
















/*----Codable----*/
//SWIFT 3
//struct Message {
//    var text: String
//    var sender: String
//    var timeSent: Int   //number of seconds since 1970
//}
//
//extension Message {
//    init?(_ dictionary: [String : Any]) {
//        guard let text = dictionary["text"] as? String,
//            let sender = dictionary["sender"] as? String,
//            let timeSent = dictionary["timeSent"] as? Int else { return nil }
//
//        self.text = text
//        self.sender = sender
//        self.timeSent = timeSent
//    }
//
//    var dictionaryRepresentation: [String : Any] {
//        var dictionary = [String : Any]()
//
//        dictionary["text"] = self.text
//        dictionary["sender"] = self.sender
//        dictionary["timeSent"] = self.timeSent
//
//        return dictionary
//    }
//}
//
//let message = Message(text: "Hello, World.", sender: "Freshman CS Major", timeSent: 1208932770)
//
//let data = try JSONSerialization.data(withJSONObject: message.dictionaryRepresentation, options: [])
//
//if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
//    let messageFromJSON = Message(jsonObject) {
//
//    print(message.text)
//}






/*----Codeable----*/
//SWIFT 4

struct Message: Codable {
    var text: String
    var sender: String
    var timeSent: Int   //number of seconds since 1970
}

let message = Message(text: "Hello, World.", sender: "Freshman CS Major", timeSent: 1208932770)

let jsonEncoder = JSONEncoder()
let data = try jsonEncoder.encode(message)

let jsonDecoder = JSONDecoder()
let decodedMessage = try jsonDecoder.decode(Message.self, from: data)

decodedMessage.sender

let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
print(dictionary)













/* WORKS CITED
 https://swift.org/blog/swift-4-0-released/
 https://developer.apple.com/documentation/swift/codable
 https://plausible.coop/blog/2017/09/13/best-new-features-in-swift-4?utm_campaign=iOS%2BDev%2BWeekly&utm_medium=web&utm_source=iOS_Dev_Weekly_Issue_318
 http://benscheirman.com/2017/06/ultimate-guide-to-json-parsing-with-swift-4/
 http://www.fullbooks.com/20-000-Leagues-Under-the-Sea1.html
 */



