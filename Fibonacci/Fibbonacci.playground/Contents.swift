import UIKit

print(fibonacci(times: 6))

func fibonacci (times: Int) -> [Int]{
    var fib: [Int] = []
        for i in 0..<times {
            var fibResult = i;
            if(i > 1){
                fibResult = fib[i - 1] + fib[i - 2]
            }
            fib.append(fibResult)
        }
    return fib
}
