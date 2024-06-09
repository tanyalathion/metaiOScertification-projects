let reservationsInPerson:Set<String> = ["000-345-3441", "000-345-3442"]
let reservationsOverPhone:Set<String> = ["000-345-3443", "000-345-3444"]
let reservationsOverInternet:Set<String> = ["000-345-3445", "000-345-3446"]
let inPersonAndOverPhone = reservationsInPerson.union(reservationsOverPhone)
print(inPersonAndOverPhone)
var allPhoneNumbers = inPersonAndOverPhone.union(reservationsOverInternet)
print(allPhoneNumbers)

var confirmationCodes: Set = ["LL3450","LL3451","LL3452", "LL3453", "LL3454"]
print("\(allPhoneNumbers.count) \(confirmationCodes.count)")
confirmationCodes.insert("LL3455")
print(confirmationCodes)

confirmationCodes.remove("LL3451")
allPhoneNumbers.remove("000-345-3443")

print("\(allPhoneNumbers.count) \(confirmationCodes.count)")
