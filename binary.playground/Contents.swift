import UIKit

var arr = ["a", "abc", "aabc", "aabbc", "aaabbbcc", "bacc", "bbcc", "bbbccc", "cb", "cbb", "cbbc", "d" , "defff", "deffz"]

func binarySearch(searchedText: String /*= String()*/) -> String {

    var firstIndex = 0
    var lastIndex = arr.count - 1
    var wordToFind = "Not founded"
    var count = 0

    while firstIndex <= lastIndex {

        count += 1
        let middleIndex = (firstIndex + lastIndex) / 2
        let middleValue = arr[middleIndex]

        if middleValue == searchedText {
            wordToFind = middleValue
            print(wordToFind)
            return wordToFind
        }
        if searchedText.localizedCompare(middleValue) == ComparisonResult.orderedDescending {
            firstIndex = middleIndex + 1
        }
        if searchedText.localizedCompare(middleValue) == ComparisonResult.orderedAscending {
           // print(middleValue)
            lastIndex = middleIndex - 1
        }
    }
    return wordToFind
}
binarySearch(searchedText: "d")

var firstIndex = 0
    var lastIndex = data.count - 1
var wordToFind: CityData = .init(country: "", name: "", id: 0, coord: .init(lon: 0.0, lat: 0.0))
var arr =  [CityData]()
    var count = 0


    while firstIndex <= lastIndex {

        count += 1
        let middleIndex = (firstIndex + lastIndex) / 2
        let middleValue = data[middleIndex]

        if middleValue.name == searchedText {
            wordToFind = middleValue
            arr.append(wordToFind)
            print(wordToFind)
            
        }
        if searchedText.localizedCompare(middleValue.name) == ComparisonResult.orderedDescending {
            firstIndex = middleIndex + 1
        }
        if searchedText.localizedCompare(middleValue.name) == ComparisonResult.orderedAscending {

            lastIndex = middleIndex - 1
        }
    }


filteredData = arr
tableView.reloadData()
}
