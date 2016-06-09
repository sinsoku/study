class FizzBuzz {
    let num : Int

    init(num : Int) {
        self.num = num
    }

    func toString() -> String {
      if self.num % 15 == 0 {
        return "FizzBuzz"
      } else if self.num % 3 == 0 {
        return "Fizz"
      } else if self.num % 5 == 0 {
        return "Buzz"
      } else {
        return String(self.num)
      }
    }
}
