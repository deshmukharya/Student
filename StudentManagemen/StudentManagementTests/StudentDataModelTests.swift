
// Replace with your actual app module name
import XCTest
@testable import StudentManagement // Replace with your actual app module name

class StudentViewModelTests: XCTestCase {

    var viewModel: StudentViewModel!
    var student: Student!
    
    override func setUp() {
        super.setUp()
        let defaultImage = UIImage(named: "defaultProfileImage") ?? UIImage() // Ensure this image exists in your assets
        student = Student(id: 1, name: "John Doe", dateOfBirth: Date(), photo: defaultImage, age: 25)
        viewModel = StudentViewModel(student: student)
    }
    override func tearDown() {
        viewModel = nil
        student = nil
        super.tearDown()
    }

    func testUpdateId() {
        viewModel.updateId(2)
        XCTAssertEqual(viewModel.id, "2")
    }

    func testUpdateName() {
        viewModel.updateName("Jane Doe")
        XCTAssertEqual(viewModel.name, "Jane Doe")
    }

    func testUpdateAge() {
        viewModel.updateAge(30)
        XCTAssertEqual(viewModel.age, "30")
    }

    func testUpdateProfileImage() {
        let image = UIImage()
        viewModel.updateProfileImage(image)
        XCTAssertEqual(viewModel.photo, image)
    }

    func testUpdateProfileImageWithNil() {
        viewModel.updateProfileImage(nil)
        XCTAssertEqual(viewModel.photo, UIImage(named: "defaultProfileImage"))
    }
}


