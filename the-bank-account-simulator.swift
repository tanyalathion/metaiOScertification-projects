/*
----------------- Ce à quoi vous pouvez vous attendre --------------------------
Vous travaillerez avec des fonctions, des boucles, des instructions conditionnelles,
des instructions de commutation, des structures et des classes
pour créer les fonctionnalités du simulateur de compte bancaire.

Les opérations du simulateur de compte bancaire sont implémentées avec des fonctions
et regroupées dans la structure du projet.
La logique du simulateur utilise des boucles pour traiter les données de l'utilisateur
et créer des comptes bancaires valides.
Les instructions conditionnelles et les instructions de commutation
mettent en œuvre des opérations de compte bancaire valides
et veillent à ce que le simulateur de compte bancaire fonctionne sans problème tout au long du processus.

Vous allez créer un simulateur de compte bancaire pour :

- Créer des comptes bancaires valides
- Vérifier le solde des comptes bancaires
- Valider les retraits des comptes bancaires et les dépôts sur les comptes bancaires.

En fin de compte, vous coderez un simulateur de compte bancaire en créant un compte bancaire valide
et en utilisant ensuite une logique de programmation appropriée pour le gérer.
Vous configurerez le simulateur de compte bancaire pour vérifier le solde du compte bancaire,
valider les retraits du compte bancaire et surveiller les dépôts sur le compte bancaire.
--------------------------------------------------------------------------------
*/

/* +++++++++++++++++ Partie 1: Créer le compte bancaire +++++++++++++++++++++ */
/* 📝​ Créer les options de débit et de crédit du compte bancaire */
/* 👉​ Définir une classe et utiliser des boucles pour créer un compte bancaire valide en fonction du choix de l'utilisateur.*/
class VirtualBankSystem {
    var accountType = ""
    func welcomeCustomer() {
        print("Welcome to your virtual bank system.")
    }
    func onboardCustomerAccountOpening() {
        print("What kind of account would you like to open?")
        print("1. Debit account")
        print("2. Credit account")
    }
    /* 👉​ Utiliser des instructions de commutation pour sélectionner le bon type de compte bancaire
    à partir de la liste des types de comptes bancaires valides fournie par le simulateur de compte bancaire.*/
    func makeAccount(numberPadKey: Int) {
        print("The selected option is \(numberPadKey).")
        switch numberPadKey {
        case 1:
            accountType = "debit"
        case 2:
            accountType = "credit"
        /* Les instructions de commutation doivent toujours traiter tous les cas.
        Le cas par défaut traite tous les cas que les autres cas de commutation ne traitent pas.*/
        default:
            print("Invalid input: \(numberPadKey)")
            return /*L'instruction break quitte le cas par défaut sans rien faire d'autre.*/
        }
        print("You have opened a \(accountType) account.")
    }
}
let virtualBankSystem = VirtualBankSystem()
virtualBankSystem.welcomeCustomer()

repeat {
    virtualBankSystem.onboardCustomerAccountOpening()
    let numberPadKey = Int.random(in: 1...3)
    virtualBankSystem.makeAccount(numberPadKey: numberPadKey)
} while virtualBankSystem.accountType == ""

/*
------------------------------- 🧪​ TESTS 1️⃣​ -------------------------------------
Welcome to your virtual bank system.
What kind of account would you like to open?
1. Debit account
2. Credit account
The selected option is 1.
You have opened a debit account.
--------------------------------------------------------------------------------
*/

/* ++++++++++ Partie 2: Définir les opérations du compte bancaire +++++++++++ */
/* 📝​ Configurer le compte bancaire pour qu'il puisse gérer différents types d'opérations,
y compris les retraits et les dépôts. */
/* 👉​ Utiliser des structures et des classes pour créer des opérations de compte bancaire valides
et modulariser le code du projet.*/
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
    /* 👉​ Configurer des instructions conditionnelles pour mettre en œuvre
    la logique des retraits des comptes bancaires et des dépôts sur les comptes bancaires.*/

    /* Dépôt au débit */
    mutating func debitDeposit(_ amount: Int) {
        debitBalance += amount
        print("Debit deposit: $\(amount). \(debitBalanceInfo)")
    }
    /* Retrait de débit */
    mutating func debitWithdraw(_ amount: Int){
        if amount > debitBalance {
            print("Insufficient fund to withdraw $\(amount). \(debitBalanceInfo)")
        }else{
            debitBalance -= amount
            print("Debit withdraw: $\(amount). \(debitBalanceInfo)")
        }
    }

    /* Dépôt de crédit */
    mutating func creditDeposit(_ amount: Int) {
        creditBalance += amount
        print("Credit deposit: $\(amount). \(creditBalanceInfo)")
        if creditBalance == 0 {
            print("Paid off credit balance.")
        } else if creditBalance > 0 {
            print("Overpaid credit balance.")
        }
    }

    /* Retrait de crédit */
    mutating func creditWithdraw(_ amount: Int){
        if amount > availableCredit {
            print("Insufficient credit to withdraw $\(amount). \(creditBalanceInfo)")
        }else{
            creditBalance -= amount
            print("Credit withdraw: $\(amount). \(creditBalanceInfo)")
        }
    }
}

/*
------------------------------- 🧪​ TESTS 2️⃣​​ -------------------------------------
Debit balance: $0
Debit deposit: $100. Debit balance: $100
Debit withdraw: $20. Debit balance: $80
Insufficient funds to withdraw $81. Debit balance: $80
Available credit: $100
Insufficient credit to withdraw $101. Available credit: $100
Credit withdraw: $100. Available credit: $0
Credit deposit: $50. Available credit: $50
Credit deposit: $50. Available credit: $100
Paid off credit balance.
Credit deposit: $100. Available credit: $200
Overpaid credit balance.
--------------------------------------------------------------------------------
*/

/* ++++++++++++++++ Partie 3: Gestion du compte bancaire ++++++++++++++++++++ */
/* 📝​ Gérer le compte bancaire à l'aide des opérations définies. */
/* 👉​ Utiliser des fonctions pour gérer la logique de transfert du compte bancaire.*/

/* 👉​ Utiliser des boucles pour gérer le compte bancaire en fonction du choix de l'utilisateur.*/

/* 👉​ Utiliser des instructions conditionnelles pour sélectionner
l'opération du compte bancaire en fonction du type de compte bancaire.*/

/* 👉​ Utiliser des instructions de commutation pour choisir la bonne opération de compte bancaire
dans la liste des opérations de compte bancaire valides fournie par le simulateur de compte bancaire.*/

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
