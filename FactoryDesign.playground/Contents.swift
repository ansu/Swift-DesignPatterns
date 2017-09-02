//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Contact {
    var name:String
    var job:Job
    
    init(name:String, job:Job){
        self.name = name
        self.job = job
    }
    
    enum Job {
        case IOS
        case Android
    }
}


protocol JobContactProtocol{
    
    func sendRequestResumeEmail()
}


class IOSJob: JobContactProtocol {
    
    var contact:Contact

    func sendRequestResumeEmail() {
         print("Dear \(contact.name) you are the ios candidate")
    }
    
    init(contact:Contact){
        self.contact = contact
    }

}

class AndroidJob: JobContactProtocol {
    
    var contact:Contact
    
    func sendRequestResumeEmail() {
        print("Dear \(contact.name) you are the android candidate")
    }
    
    init(contact:Contact){
        self.contact = contact
    }
    
}


struct jobContactorFactory {
    
    static func getJobSeeker(contact:Contact) -> JobContactProtocol{
        switch  contact.job {
        case .IOS:
             return  IOSJob(contact: contact)
        case .Android:
            return  AndroidJob(contact: contact)
        }
        
    }
}

var contacts = [Contact]()
contacts.append(Contact(name: "J Rob", job: .IOS))
contacts.append(Contact(name: "J Rob", job: .Android))


for contact in contacts{
    let client = jobContactorFactory.getJobSeeker(contact: contact)
    print (client.sendRequestResumeEmail())
}


