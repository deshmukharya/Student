import Foundation
import UIKit

class StudentViewModel {
    private var student: Student
    
    var id: String {
        return String(student.id)
    }
    
    var name: String {
        return student.name
    }
    
    var dateOfBirth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: student.dateOfBirth)
    }
    
    var age: String {
        return String(student.age)
    }
    
    var photo: UIImage? {
        return student.photo
    }
    
    init(student: Student) {
        self.student = student
    }
    
    func updateId(_ newId: Int) {
        student.id = newId
    }
    
    func updateName(_ newName: String) {
        student.name = newName
    }
    
    func updateAge(_ newAge: Int) {
        student.age = newAge
    }
    
    func updateProfileImage(_ newProfileImage: UIImage?) {
        if let newProfileImage = newProfileImage {
            student.photo = newProfileImage
        } else {
            student.photo = UIImage(named: "defaultProfileImage")!
        }
    }
    
    func updateDateOfBirth(_ newDate: Date) {
        student.dateOfBirth = newDate
    }
}


