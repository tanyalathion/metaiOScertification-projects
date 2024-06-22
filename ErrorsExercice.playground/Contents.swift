//Supposons que vous créiez une application de calculatrice. Pour signaler les erreurs liées à des opérations mathématiques non valides, vous écrirez des fonctions jetables. Vous appellerez également la fonctionnalité et gérerez les erreurs à l'aide de do-catch.
enum CalculatorError: Error {
    case divisionByZero
}

class Calculator {
    func divide(x: Double, y: Double) throws -> Double {
        if y == 0 {
            throw CalculatorError.divisionByZero
        }
                return x / y
    }
}

let calculator = Calculator()

do {
    let successfulResult = try calculator.divide(x: 1, y: 2)
    print(successfulResult)
    let wrongResult = try calculator.divide(x: 1, y: 0)
}
catch CalculatorError.divisionByZero {
    print("You can't divide a number by zero")
}
// Résultat dans la console après l'exécution du projet:
// 0.5
// Division par zéro détectée et non autorisée
