//  Created by zhilly and som on 2022/08/17.

class NumberBaseballLibrary {
    var computerRandomNumberArray: [Int] = []
    var numberOfAttempts = 9
    var otherComputerRandomNumberArray: [Int] = []
    var strike: Int = 0
    var ball: Int = 0

    private func generateRandomNumber() -> [Int] {
        var randomNumArray: [Int] = []
        while randomNumArray.count < 3 {
            randomNumArray.append(Int.random(in: 1...9))
            randomNumArray = Array(Set(randomNumArray))
        }
        return randomNumArray
    }

    private func putNumberInArray() {
        computerRandomNumberArray = generateRandomNumber()
    }

    private func putTestNumberInArray() {
        otherComputerRandomNumberArray = generateRandomNumber()
    }

    private func matchIndex(_ x: Int, _ y: Int) -> Bool {
        if x == y {
            return true
        } else {
            return false
        }
    }

    private func matchNumberArray(_ computerArray: [Int], _ otherComputerArray: [Int]) -> (Int, Int) {
        for i in 0...2 {
            if matchIndex(Int(computerArray[i]), Int(otherComputerArray[i])) == true {
                strike += 1
            } else if computerArray.contains(otherComputerArray[i]) {
                ball += 1
            }
        }
        return (strike, ball)
    }

    private func resetStrikeAndBall() {
        strike = 0
        ball = 0
    }
}

extension NumberBaseballLibrary: NumberBaseballLibraryProtocol {
    func playNumberBaseball() {
        putNumberInArray()
        
        while numberOfAttempts > 0 {
            putTestNumberInArray()
            let (outputStrike,outputBall) = matchNumberArray(computerRandomNumberArray, otherComputerRandomNumberArray)
            let messeage = otherComputerRandomNumberArray.map { String($0) }.joined(separator: " ")
            print("임의의 수 : \(messeage)")
            print("\(outputStrike) 스트라이크, \(outputBall) 볼")
            
            if strike == 3 {
                break
            } else {
                resetStrikeAndBall()
                numberOfAttempts -= 1
            }
            
            if numberOfAttempts != 0 {
                print("남은 기회 : \(numberOfAttempts)")
            }
        }
        
        if numberOfAttempts > 0 {
            print("임의의 수 승리!")
        } else {
            print("컴퓨터 승리...!")
        }
    }
}
