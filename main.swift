/*
Squares Of A Sorted Array
Given an array of numbers sorted in increasing order, generate another array containing the square of all the elements in the given array, sorted in increasing order.

Example One
{
"numbers": [1, 2, 3, 4]
}
Output:

[1, 4, 9, 16]
Example Two
{
"numbers": [-9, -5, -2, 0, 3, 7]
}
Output:

[0, 4, 9, 25, 49, 81]
Notes
Constraints:

1 <= size of the input array <= 105
-104 <= any element of the input array <= 104
*/

func generate_sorted_array_of_squares(numbers: [Int]) -> [Int] {
    
    func binarySearch(_ find: Int) -> Int {
        var startIdx = 0, endIdx = numbers.count - 1
        
        while startIdx <= endIdx {
            let midIdx = startIdx + (endIdx - startIdx) / 2
            if startIdx == endIdx {
                return midIdx
            } else if numbers[midIdx] < find {
                startIdx = midIdx + 1
            } else if numbers[midIdx] >= find {
                endIdx = midIdx - 1
            }
        }
        return -1
    }

    var result: [Int] = []
    let firstPositiveIndex = binarySearch(0)
    var i = firstPositiveIndex - 1, j = firstPositiveIndex
    
    while i >= 0 && j < numbers.count {
        if numbers[i] * numbers[i] <= numbers[j] * numbers[j] {
            result.append(numbers[i] * numbers[i])
            i -= 1
        } else {
            result.append(numbers[j] * numbers[j])
            j += 1
        }
    }
    
    while i >= 0 {
        result.append(numbers[i] * numbers[i])
        i -= 1
    }
    
    while j < numbers.count {
        result.append(numbers[j] * numbers[j])
        j += 1
    }
    
    return result
}