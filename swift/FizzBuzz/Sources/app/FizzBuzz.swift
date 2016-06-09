class FizzBuzz {
    let num : Int

    init(num : Int) {
        self.num = num
    }

    func toString() -> String {
        switch self.num {
            case let n where n % 15 == 0:
                return "FizzBuzz"
            case let n where n % 3 == 0:
                return "Fizz"
            case let n where n % 5 == 0:
                return "Buzz"
            default:
                return String(self.num)
        }
    }
}
