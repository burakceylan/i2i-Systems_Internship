import Foundation


// MARK: - PackageList
struct PackageList: Codable ,Hashable{
    let packages: [Pack]
}

// MARK: - Package
struct Pack: Codable,Hashable {
    let packageType, packageName: String
    let usedAmount, remainedAmount: Int
    let endDate, businessZone: String
    let visible: Bool
    
    func getPercent() -> Float{
        return Float(remainedAmount)/Float(usedAmount+remainedAmount)
    }
}

// MARK: - Login
struct Login: Codable {
    var msisdn, password: String
}


// MARK : - Customer Object
class Customer : ObservableObject{
    var userID: Int?
    var jwt, name, lastName, msisdn: String?
    var email: String?
    var loginSuccess: Bool?
    var packages:PackageList?
    
    init() {
    }
    func setUserID(userID : Int) {
        self.userID = userID
    }
    func setJwt(jwt: String){
        self.jwt = jwt
    }
    func setName(name : String) {
        self.name = name
    }
    func setlastName(lastName: String){
        self.lastName = lastName
    }
    func setMsisdn(msisdn: String){
        self.msisdn = msisdn
    }
    func setEmail(email: String){
        self.email = email
    }
    func setLogin(succes: Bool){
        self.loginSuccess = succes
    }
    func setPackageList(packages: PackageList){
        self.packages = packages
    }
}
// MARK: - CustomerInf
struct CustomerInf: Codable {
    var userID: Int
    var jwt, name, lastName, msisdn: String
    var email: String
    var loginSuccess: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case jwt, name, lastName, msisdn, email, loginSuccess
    }
}

// MARK: - Register
struct Register: Codable {
    let name, lastName, email, password: String
    let msisdn: String
}


// MARK: - RegisterResponse
struct RegisterResponse: Codable {
    let registerConfirmationID: Int
    let registerRequestSuccess: Bool

    enum CodingKeys: String, CodingKey {
        case registerConfirmationID = "registerConfirmationId"
        case registerRequestSuccess
    }
}

// MARK: - ReceivedCode
struct ReceivedCode: Codable {
    let codeReceivedViaEmail: String
}

// MARK: - ConfirmResponse
struct ConfirmResponse: Codable {
    let registerSuccess: Bool
}


// MARK: - Funtions
func parseJSON(data: Data) -> PackageList? {

var returnValue: PackageList?
do {
returnValue = try JSONDecoder().decode(PackageList.self, from: data)
} catch {
print("Error took place\(error.localizedDescription).")
}

return returnValue
}


func getPackages(jwt:String,userID:Int,completionBlock: @escaping ((PackageList) -> Void))  {
    // Create URL
    let url = URL(string: "http://localhost:8080/api/users/"+String(userID)+"/package")
    guard let requestUrl = url else { fatalError() }

    // Create URL Request
    var request = URLRequest(url: requestUrl)


    // Specify HTTP Method to use
    request.httpMethod = "GET"
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer "+jwt, forHTTPHeaderField: "Authorization")

    // Send HTTP Request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        // Check if Error took place
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        // Read HTTP Response Status code
        if let response = response as? HTTPURLResponse {
            print("Response HTTP Status code: \(response.statusCode)")
        }
        
        // Convert HTTP Response Data to a simple String
        if let data = data {
            let todoItem = parseJSON(data: data)
            completionBlock(todoItem!);
        }
        
    }
    task.resume()
}

// MARK - Packages
func getCustomerInformations(msisdn:String,pass:String,completionBlock: @escaping ((CustomerInf) -> Void)) {
    
    let url = URL(string: "http://localhost:8080/api/login")
    guard let requestUrl = url else { fatalError() }
    var request = URLRequest(url: requestUrl)
    request.httpMethod = "POST"
    
    
    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    var customer:CustomerInf?
    do {
        let item = Login(msisdn: msisdn, password: pass)
        let jsonData = try JSONEncoder().encode(item)
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else {return}
            do{
                customer = try JSONDecoder().decode(CustomerInf.self, from: data)
                completionBlock(customer!);
            }catch let jsonErr{
                print(jsonErr)
            }
            
        }.resume()
    }
    catch _{
        print("Error")
    }

}

//MARK -Register
func registeration(name:String,lastName:String,email:String,msisdn:String,pass:String,completionBlock: @escaping ((RegisterResponse) -> Void)) {
    
    let url = URL(string: "http://localhost:8080/api/register")
    guard let requestUrl = url else { fatalError() }
    var request = URLRequest(url: requestUrl)
    request.httpMethod = "POST"
    
    
    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    var customer:RegisterResponse?
    do {
        let item = Register(name: name, lastName: lastName, email: email, password: pass, msisdn: msisdn)
        let jsonData = try JSONEncoder().encode(item)
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else {return}
            do{
                customer = try JSONDecoder().decode(RegisterResponse.self, from: data)
                completionBlock(customer!);
            }catch let jsonErr{
                print(jsonErr)
            }
            
        }.resume()
    }
    catch _{
        print("Error")
    }

}

// MARK - Registiration Confirmation
func sendConfirmCode(UserId:Int,confirmCode:String,completionBlock: @escaping ((ConfirmResponse) -> Void)) {
    
    let url = URL(string: "http://localhost:8080/api/register/"+String(UserId)+"/confirm")
    guard let requestUrl = url else { fatalError() }
    var request = URLRequest(url: requestUrl)
    request.httpMethod = "POST"
    
    
    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    var customer:ConfirmResponse?
    do {
        let item = ReceivedCode(codeReceivedViaEmail: confirmCode)
        let jsonData = try JSONEncoder().encode(item)
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else {return}
            do{
                customer = try JSONDecoder().decode(ConfirmResponse.self, from: data)
                completionBlock(customer!);
            }catch let jsonErr{
                print(jsonErr)
            }
            
        }.resume()
    }
    catch _{
        print("Error")
    }

}

