//
//  ViewController.swift
//  Firebase101
//
//  Created by 임현규 on 2020/10/20.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var numOfcustomers: UILabel!
    
    let db = Database.database().reference()
    
    var customers: [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        saveBasicTypes()
//        saveCustomers()
        fetchCustomers()
        
        //update, delete
//        updateBasicTypes()
//        deleteBasicTypes()
        }

    func updateLabel() {
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
            print("--> \(snapshot)")
            
            let value = snapshot.value as? String ?? ""
            
            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
        }
    }
    @IBAction func createCustomer(_ sender: Any) {
        saveCustomers()
    }
    
    @IBAction func fetchCustomer(_ sender: Any) {
        fetchCustomers()
    }
    
    func updateCustomers() {
        guard customers.isEmpty == false else {return}
        customers[0].name = "Min"
        
        // customers 딕셔너리화
        let dictionary = customers.map { $0.toDictionary }
        db.updateChildValues((["customers": dictionary]))
    }
    
    @IBAction func updateCustomer(_ sender: Any) {
        updateCustomers()
    }
    
    func deleteCustomers() {
        db.child("customers").removeValue()
    }
    @IBAction func deleteCustomer(_ sender: Any) {
        deleteCustomers()
    }
    
}
// MARK: Read(Fetch) Data
extension ViewController {
    func fetchCustomers() {
        // 데이터베이스에서 값을 가져오기
        db.child("customers").observeSingleEvent(of: .value) {snapshot in
            print("--> \(snapshot.value)")
            
            // 가져온 값을 코더블 형태의 배열형태로 디코딩 하기
            do {
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                let decoder = JSONDecoder()
                // 디코딩 하기.
                let customers: [Customer] = try decoder.decode([Customer].self, from: data)
                // 모델 데이터 설정
                self.customers = customers
                
                // UIlabel에 값 넣어주기
                DispatchQueue.main.async {
                    self.numOfcustomers.text = "# of Customers: \(customers.count)"
                }
                // 디코딩 된 값 출력해보기
                print("--> customers: \(customers.count)")
            } catch let error {
                print("--> error: \(error.localizedDescription)")
            }
        }
    }
}
extension ViewController{
    func updateBasicTypes() {
//        db.child("int").setValue(3)
//        db.child("double").setValue(3.5)
//        db.child("str").setValue("string value - 여러분 안녕")
        
        db.updateChildValues(["int": 6])
        db.updateChildValues(["double": 5.4])
        db.updateChildValues(["str": "변경된 스트링"])
    }
    
    func deleteBasicTypes() {
        db.child("int").removeValue()
        db.child("double").removeValue()
        db.child("str").removeValue()
    }
    
}
    extension ViewController {
        func saveBasicTypes() {
            //Firebase에서 chile 하고 ("KEY").setValue(Value)
             // - String, Array, number, dictionary
            
            db.child("int").setValue(3)
            db.child("double").setValue(3.5)
            db.child("str").setValue("string value - 여러분 안녕")
            db.child("array").setValue(["a", "b", "c"])
            db.child("dict").setValue(["id":"anyID", "age":10, "city":"seoul"])
        }
        func saveCustomers() {
            //책가게
            //사용자를 저장하겠다
            // 모델 Customer + Book
            
            let books = [Book(title: "Good to Great", author: "Someone"), Book(title: "Hacking Growth", author: "Somebody")]
            
            let customer1 = Customer(id: "\(Customer.id)", name: "Son", books: books)
            Customer.id += 1
            let customer2 = Customer(id: "\(Customer.id)", name: "Dele", books: books)
            Customer.id += 1
            let customer3 = Customer(id: "\(Customer.id)", name: "Kane", books: books)
            Customer.id += 1
            
            db.child("customers").child(customer1.id).setValue(customer1.toDictionary)
            db.child("customers").child(customer2.id).setValue(customer2.toDictionary)
            db.child("customers").child(customer3.id).setValue(customer3.toDictionary)
            
        }
    }

struct Customer: Codable {
    let id: String
    var name: String
    let books: [Book]
    
    //computed property
    var toDictionary:[String: Any] {
        let booksArray = books.map {$0.toDictionary}
        let dict: [String: Any] = ["id": id, "name":name, "books":booksArray]
        return dict
    }
    // 타입 프로퍼티
    static var id: Int = 0
}

struct Book: Codable {
    let title: String
    let author: String
    
    var toDictionary:[String: Any] {
    let dict: [String: Any] = ["title" : title, "author": author]
    return dict
    }
}
