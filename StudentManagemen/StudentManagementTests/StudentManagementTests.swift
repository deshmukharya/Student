//
//  StudentManagementTests.swift
//  StudentManagementTests
//
//  Created by E5000861 on 07/06/24.
//


import XCTest
@testable import StudentManagement
 // Replace with your actual app module name

class AddStudentViewModelTests: XCTestCase {
    
    var viewModel: AddStudentViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = AddStudentViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    // MARK: - Validation Tests
    
    func testValidateID_InvalidID() {
        // Test case where ID is invalid (<= 0)
        viewModel.updateID(0)
        let result = viewModel.validateID()
        XCTAssertFalse(result.isValid)
        XCTAssertEqual(result.message, "ID cannot be empty.")
    }
    
    func testValidateID_ValidID() {
        // Test case where ID is valid (> 0)
        viewModel.updateID(1)
        let result = viewModel.validateID()
        XCTAssertTrue(result.isValid)
        XCTAssertNil(result.message)
    }
    
    func testValidateName_EmptyName() {
        // Test case where name is empty
        viewModel.updateName("")
        let result = viewModel.validateName()
        XCTAssertFalse(result.isValid)
        XCTAssertEqual(result.message, "Name cannot be empty.")
    }
    
    func testValidateName_InvalidCharacters() {
        // Test case where name contains non-alphabetic characters
        viewModel.updateName("John123")
        let result = viewModel.validateName()
        XCTAssertFalse(result.isValid)
        XCTAssertEqual(result.message, "Please enter a valid name (alphabetic characters only).")
    }
    
    func testValidateName_ValidName() {
        // Test case where name is valid (only alphabetic characters)
        viewModel.updateName("John Doe")
        let result = viewModel.validateName()
        XCTAssertTrue(result.isValid)
        XCTAssertNil(result.message)
    }
    
    func testValidateAge_EmptyAge() {
        // Test case where age is empty
        viewModel.updateAge("")
        let result = viewModel.validateAge()
        XCTAssertFalse(result.isValid)
        XCTAssertEqual(result.message, "Age cannot be empty.")
    }
    
    func testValidateAge_NonNumericAge() {
        // Test case where age is non-numeric
        viewModel.updateAge("Twenty")
        let result = viewModel.validateAge()
        XCTAssertFalse(result.isValid)
        XCTAssertEqual(result.message, "Please enter a numeric age.")
    }
    

    
    // MARK: - saveStudent() Tests
    
    
    func testSaveStudent_InvalidID() {
        // Test case where ID is invalid
        viewModel.updateID(0)
        viewModel.updateName("John Doe")
        viewModel.updateDateOfBirth(Date())
        viewModel.updateAge("25")
        // Provide a sample image
        
        let result = viewModel.saveStudent()
        XCTAssertFalse(result.isValid)
        XCTAssertEqual(result.message, "ID cannot be empty.")
    }
    
    func testSaveStudent_EmptyName() {
        // Arrange: Set up empty name
        viewModel.updateID(1)
        viewModel.updateName("")
        viewModel.updateDateOfBirth(Date())
        viewModel.updateAge("25")
        viewModel.updateProfileImage(UIImage(named: "defaultProfileImage") ?? UIImage() )

        // Act: Call saveStudent()
        let result = viewModel.saveStudent()

        // Assert: Validate the result
        XCTAssertFalse(result.isValid)
        XCTAssertEqual(result.message, "Name cannot be empty.")
        XCTAssertEqual(StudentDataModel.shared.students.count, 0) // Ensure no student was added
    }

    func testSaveStudent_InvalidAge() {
        // Arrange: Set up invalid age
        viewModel.updateID(1)
        viewModel.updateName("John Doe")
        viewModel.updateDateOfBirth(Date())
        viewModel.updateAge("Twenty")
        viewModel.updateProfileImage(UIImage(named: "defaultProfileImage") ?? UIImage() )

        // Act: Call saveStudent()
        let result = viewModel.saveStudent()

        // Assert: Validate the result
        XCTAssertFalse(result.isValid)
        XCTAssertEqual(result.message, "Please enter a numeric age.")
        XCTAssertEqual(StudentDataModel.shared.students.count, 0) // Ensure no student was added
    }
    func testSaveStudent_ValidData() {
           // Test case where all data is valid
           viewModel.updateID(1)
           viewModel.updateName("John Doe")
           viewModel.updateAge("25")
           viewModel.profileImage = UIImage(named: "validImage")
           
           let (success, message) = viewModel.saveStudent()
           
           XCTAssertTrue(success, "Expected saving student data to succeed")
           XCTAssertEqual(message, "Student data saved successfully.", "Expected success message after saving")
           XCTAssertEqual(StudentDataModel.shared.students.count, 1, "Expected one student in data model after saving")
       }
       
       
       func testSaveStudent_EmptyAge() {
           // Test case where age is empty
           viewModel.updateID(1)
           viewModel.updateName("John Doe")
           viewModel.updateAge("")
           viewModel.profileImage = UIImage(named: "validImage")
           
           let (success, message) = viewModel.saveStudent()
           
           XCTAssertFalse(success, "Expected saving student data to fail with empty age")
           XCTAssertEqual(message, "Age cannot be empty.", "Expected error message for empty age")
           XCTAssertEqual(StudentDataModel.shared.students.count, 0, "Expected no students in data model after save failure")
       }
       
       func testSaveStudent_NoProfileImage() {
           // Test case where profile image is not selected
           viewModel.updateID(1)
           viewModel.updateName("John Doe")
           viewModel.updateAge("25")
           // Profile image is not set intentionally
           
           let (success, message) = viewModel.saveStudent()
           
           XCTAssertFalse(success, "Expected saving student data to fail without profile image")
           XCTAssertEqual(message, "Please select a profile image.", "Expected error message for missing profile image")
           XCTAssertEqual(StudentDataModel.shared.students.count, 0, "Expected no students in data model after save failure")
       }
}


