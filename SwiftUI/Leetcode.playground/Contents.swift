import Cocoa

func getValidCharacter(_ str: String, _ index: Int) -> (Bool, Character) {
        var pos = str.index(str.startIndex, offsetBy: index)
        var char = str[pos]
    
        guard let loweredChar = (char.isLetter || char.isNumber) ? char.lowercased().first : nil else {
            return (false, "\0".first!)
        }
    
        return (true, loweredChar)
    }

    func isPalindrome(_ s: String) -> Bool {
        var l = 0, r = s.count - 1

        while l < r {
            let (lValid, lc) = getValidCharacter(s, l)
            if !lValid {
                l += 1
                continue
            }

            let (rValid, rc) = getValidCharacter(s, r)
            if !rValid {
                r -= 1
                continue
            }

            if lc != rc {
                return false
            }
            
            l += 1
            r -= 1
        }
        
        return true
    }

isPalindrome("s")
isPalindrome("ss")
isPalindrome("sad")
isPalindrome("A man, a plan, a canal: Panama")
isPalindrome("race a car")
isPalindrome(" ")
