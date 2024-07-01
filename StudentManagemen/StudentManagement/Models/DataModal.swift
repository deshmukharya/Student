//
//  DataModal.swift
//  StudentManagement
//
//  Created by E5000861 on 07/06/24.
//

//click on any row should navigate to the second screen and display student details(id, name, age, photo, date)
import Foundation
import UIKit

struct Student {
    var id: Int
    var name: String
    var dateOfBirth: Date
    var photo: UIImage
    var age: Int
    
    init(id: Int, name: String, dateOfBirth: Date, photo: UIImage, age: Int) {
        self.id = id
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.photo = photo
        self.age = age
    }
}

// Define the StudentDataModel as a singleton class
class StudentDataModel {
    static let shared = StudentDataModel()
    private init() {} // Private initialization to ensure just one instance is created.
    
    var students: [Student] = [
        // Initial student data if needed
    ]
}
