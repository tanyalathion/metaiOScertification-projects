/* ++++++++++++++++ Partie 3: Gestion du compte bancaire ++++++++++++++++++++ */
/* 📝​ Gérer le compte bancaire à l'aide des opérations définies. */
class VirtualBankSystem {
    var accountType = ""
    var isOpened = true
    func welcomeCustomer() {
        print("Welcome to your virtual bank system.")
    }
    func onboardCustomerAccountOpening() {
        print("What kind of account would you like to open?")
        print("1. Debit account")
        print("2. Credit account")
    }
    func makeAccount(numberPadKey: Int) {
        print("The selected option is \(numberPadKey).")
        switch numberPadKey {
        case 1:
            accountType = "debit"
        case 2:
            accountType = "credit"
        default:
            print("Invalid input: \(numberPadKey)")
            return
        }
        print("You have opened a \(accountType) account.")
    }
/* 👉​ Utiliser des fonctions pour gérer la logique de transfert du compte bancaire.*/
        func transferMoney(
        transferType: String,
        transferAmount: Int,
        bankAccount: inout BankAccount
    ){
/* 👉​ Utiliser des instructions de commutation pour choisir la bonne opération de compte bancaire
dans la liste des opérations de compte bancaire valides fournie par le simulateur de compte bancaire.*/
        switch transferType {
        case "withdraw":
            if accountType == "credit" {
                bankAccount.creditWithdraw(transferAmount)
            } else if accountType == "debit" {
                bankAccount.debitWithdraw(transferAmount)
            }
        case "deposit":
            if accountType == "credit" {
                bankAccount.creditDeposit(transferAmount)
            } else if accountType == "debit" {
                bankAccount.debitDeposit(transferAmount)
            }
        default:
            break
        }
    }
        func checkBalance(
        bankAccount: BankAccount
    ) {
        switch accountType {
        case "credit":
            print(bankAccount.creditBalanceInfo)
        case "debit":
            print(bankAccount.debitBalanceInfo)
        default:
            break
        }
    }
}

struct BankAccount {
    var debitBalance = 0
    var creditBalance = 0
    let creditLimit = 100
    var debitBalanceInfo: String {
        "Debit balance: $\(debitBalance)"
    }
    var availableCredit: Int {
        creditLimit + creditBalance
    }
    var creditBalanceInfo: String {
        "Available credit: $\(availableCredit)"
    }
    mutating func debitDeposit(_ amount: Int) {
        debitBalance += amount
        print("Debit deposit: $\(amount). \(debitBalanceInfo)")
    }
    mutating func debitWithdraw(_ amount: Int) {
        if amount > debitBalance {
            print("Insufficient funds to withdraw $\(amount). \(debitBalanceInfo)")
        } else {
            debitBalance -= amount
            print("Debit withdraw: $\(amount). \(debitBalanceInfo)")
        }
    }
    mutating func creditDeposit(_ amount: Int) {
        creditBalance += amount
        print("Credit deposit: $\(amount). \(creditBalanceInfo)")
        if creditBalance == 0 {
            print("Paid off credit balance.")
        } else if creditBalance > 0 {
            print("Overpaid credit balance.")
        }
    }
    mutating func creditWithdraw(_ amount: Int) {
        if amount > availableCredit {
            print("Insufficient credit to withdraw $\(amount). \(creditBalanceInfo)")
        } else {
            creditBalance -= amount
            print("Credit withdraw: $\(amount). \(creditBalanceInfo)")
        }
    }
}

let virtualBankSystem = VirtualBankSystem()
virtualBankSystem.welcomeCustomer()

repeat {
    virtualBankSystem.onboardCustomerAccountOpening()
    let numberPadKey = Int.random(in: 1...3)
    virtualBankSystem.makeAccount(numberPadKey: numberPadKey)
} while virtualBankSystem.accountType == ""

let transferAmount = 50
print("Transfer amount: $\(transferAmount)")
var bankAccount = BankAccount()

/* 👉​ Utiliser des boucles pour gérer le compte bancaire en fonction du choix de l'utilisateur.*/
repeat {
    print("What would you like to do?")
    print("1. Check bank account")
    print("2. Withdraw money")
    print("3. Deposit money")
    print("4. Close the system")
    let option = Int.random(in: 1...5)
    print("Selected option: \(option).")
/* 👉​ Utiliser des instructions conditionnelles pour sélectionner
l'opération du compte bancaire en fonction du type de compte bancaire.*/
    switch option {
    case 1:
        virtualBankSystem.checkBalance(bankAccount: bankAccount)
    case 2:
        virtualBankSystem.transferMoney(
            transferType: "withdraw",
            transferAmount: transferAmount,
            bankAccount: &bankAccount
        )
    case 3:
        virtualBankSystem.transferMoney(
            transferType: "deposit",
            transferAmount: transferAmount,
            bankAccount: &bankAccount
        )
    case 4:
        virtualBankSystem.isOpened = false
        print("The system is closed.")
    default:
        break
    }
} while virtualBankSystem.isOpened



/*
------------------------------- 🧪​ TESTS 3️⃣ -------------------------------------
​What would you like to do?
1. Check bank account
2. Withdraw money
3. Deposit money
4. Close the system
Selected option: 4.
The system is closed.
--------------------------------------------------------------------------------
*/
