import Foundation

// CHECKING FOR NIL

var greeting:String? = "Hello"

if greeting != nil {
    print(greeting!)
}

// Optional Binding
if let greetingValue = greeting {
    print(greetingValue)
}

struct Person {
    var name: String?
    
    func walk() {
        
    }
}

// Optionals work with structures too
var me:Person? = nil


// Checking for nil before force unwrapping and using instance
if me != nil {
    me!.walk() }


// Optional Chaining with method
me?.walk()


// Optional Chaining with property with nil coalescing operator
me?.name ?? "Default Value"


if let url = URL(string: "https://www.google.com") {
    
    // step 2, create the url request and pass actual value
}


// ERROR HANDLING

// Method 1: Handle the error
do {
    try functionThatThrows()
    
} catch {
    print("Encountered an error")
}


//Method 2: Ignore the error
try? functionThatThrows()

// Method 3: Crash
try! functionThatThrows()


func functionThatThrows() throws {
    
}



