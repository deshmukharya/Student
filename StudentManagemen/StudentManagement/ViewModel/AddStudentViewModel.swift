//
//  AddStudentViewModel.swift
//  StudentManagement
//
//  Created by E5000861 on 28/06/24.
//

import Foundation
import UIKit

class AddStudentViewModel {
    var student: Student?
    
    var id: Int = 0
    var name: String = ""
    var dateOfBirth: Date = Date()
    var age: String = ""
    var profileImage: UIImage? = UIImage(named: "student")
    
    let numbers: [Int] = Array(0...100)
    
    init(student: Student? = nil) {
        self.student = student
    }
    
    func updateID(_ id: Int) {
        self.id = id
    }
    
    func updateName(_ name: String) {
        self.name = name
    }
    
    func updateDateOfBirth(_ date: Date) {
        self.dateOfBirth = date
    }
    
    func updateAge(_ age: String) {
        self.age = age
    }
    
    func updateProfileImage(_ image: UIImage) {
        self.profileImage = image
    }
    
    func validateID() -> (isValid: Bool, message: String?) {
        if id <= 0 {
            return (false, "ID cannot be empty.")
        }
        // Add additional validations for ID length or specific requirements here if needed
        return (true, nil)
    }
    
    func validateName() -> (isValid: Bool, message: String?) {
        if name.isEmpty {
            return (false, "Name cannot be empty.")
        }
        let nameCharacterSet = CharacterSet.letters.union(CharacterSet.whitespaces)
        if name.rangeOfCharacter(from: nameCharacterSet.inverted) != nil {
            return (false, "Please enter a valid name (alphabetic characters only).")
        }
        return (true, nil)
    }
    
    func validateAge() -> (isValid: Bool, message: String?) {
        if age.isEmpty {
            return (false, "Age cannot be empty.")
        }
        guard let ageInt = Int(age) else {
            return (false, "Please enter a numeric age.")
        }
        
        let calculatedAge = calculateAge()
        if ageInt != calculatedAge {
            return (false, "Your age should be \(calculatedAge). Please enter the correct age.")
        }
        
        return (true, nil)
    }


    
    func calculateAge() -> Int {
          let calendar = Calendar.current
          let now = Date()
          let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: now)
          return ageComponents.year ?? 0
      }
    
    func validateProfileImage() -> (isValid: Bool, message: String?) {
        // Check if profileImage is nil or if it's the default image
        if profileImage == UIImage(named: "defaultProfileImage") {
            return (false, "Please select an image.")
        }
        return (true, nil)
    }
    
    func saveStudent() -> (isValid: Bool, message: String?) {
        let idValidation = validateID()
        if !idValidation.isValid {
            return (false, idValidation.message)
        }
        
        let nameValidation = validateName()
        if !nameValidation.isValid {
            return (false, nameValidation.message)
        }
        
        let ageValidation = validateAge()
        if !ageValidation.isValid {
            return (false, ageValidation.message)
        }
        
        let imageValidation = validateProfileImage()
        if !imageValidation.isValid {
            return (false, imageValidation.message)
        }
        
        let newStudent = Student(id: id, name: name, dateOfBirth: dateOfBirth, photo: profileImage!, age: Int(age) ?? 0)
        
        // Assuming StudentDataModel is a shared instance where students are stored
        StudentDataModel.shared.students.append(newStudent)
        
        // Clear fields after successful save
        clearFields()
        
        return (true, "Student data saved successfully.")
    }

    func clearFields() {
        id = 0
        name = ""
        dateOfBirth = Date()
        age = ""
        profileImage = UIImage(named: "student")
    }
}

