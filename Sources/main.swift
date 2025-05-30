import Foundation

struct Account {
    let id: Int
    var transactions: [Double]
}

func main() {
    print("Hello, World!")

    autoreleasepool {
        for i in stride(from: 0, through: 100000, by: 1) {
            let random = Double.random(in: 0...100)
            var account = Account(
                id: i,
                transactions: [Double(i)]
            )

            add_transaction(account: &account, amount: random)

            print("Account ID: \(account.id), Transactions: \(account.transactions)")
        }
    }
}

func add_transaction(account: inout Account, amount: Double) {
    account.transactions.append(amount)

    while account.transactions.count < 100 {
        add_transaction(account: &account, amount: amount*amount)
    }
}

main()
