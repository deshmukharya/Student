
import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Properties
    
    var student: Student?
    
    private lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
        imageView.image = student?.photo
        return imageView
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var studentId: UILabel = {
        let label = UILabel()
        label.text = String(student?.id ?? 0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var studentName: UILabel = {
        let label = UILabel()
        label.text = student?.name
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of Birth"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateOfBirth: UILabel = {
        let label = UILabel()
        if let date = student?.dateOfBirth {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            label.text = dateFormatter.string(from: date)
        } else {
            label.text = "N/A"
        }
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var studentAge: UILabel = {
        let label = UILabel()
        label.text = String(student?.age ?? 0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Student Details"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    // MARK: - UI Setup
    
    private func setUpUI() {
        view.addSubview(titleLabel)
        view.addSubview(detailImageView)
        view.addSubview(idLabel)
        view.addSubview(studentId)
        view.addSubview(nameLabel)
        view.addSubview(studentName)
        view.addSubview(dateOfBirthLabel)
        view.addSubview(dateOfBirth)
        view.addSubview(ageLabel)
        view.addSubview(studentAge)
        
        NSLayoutConstraint.activate([
            // Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // Detail Image View Constraints
            detailImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            detailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailImageView.heightAnchor.constraint(equalToConstant: 150),
            detailImageView.widthAnchor.constraint(equalToConstant: 150),
            
            // ID Label Constraints
            idLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 30),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            idLabel.widthAnchor.constraint(equalToConstant: 150),
            
            // Student ID Constraints
            studentId.centerYAnchor.constraint(equalTo: idLabel.centerYAnchor),
            studentId.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 50),
            studentId.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            studentId.heightAnchor.constraint(equalToConstant: 50),
            
            // Name Label Constraints
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            nameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            // Student Name Constraints
            studentName.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            studentName.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 50),
            studentName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            studentName.heightAnchor.constraint(equalToConstant: 50),
            
            // Date of Birth Label Constraints
            dateOfBirthLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            dateOfBirthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            dateOfBirthLabel.widthAnchor.constraint(equalToConstant: 150),
            
            // Date of Birth Constraints
            dateOfBirth.centerYAnchor.constraint(equalTo: dateOfBirthLabel.centerYAnchor),
            dateOfBirth.leadingAnchor.constraint(equalTo: dateOfBirthLabel.trailingAnchor, constant: 50),
            dateOfBirth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateOfBirth.heightAnchor.constraint(equalToConstant: 50),
            
            // Age Label Constraints
            ageLabel.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 30),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            ageLabel.widthAnchor.constraint(equalToConstant: 150),
            
            // Student Age Constraints
            studentAge.centerYAnchor.constraint(equalTo: ageLabel.centerYAnchor),
            studentAge.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor, constant: 50),
            studentAge.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            studentAge.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
