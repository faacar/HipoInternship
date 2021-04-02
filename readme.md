# Hipo Assigment Project
This project has been assigned for the HipoLabs company's internship program

# Images and GIF's
- Dark Mode
<img src = "https://github.com/faacar/HipoInternship/blob/main/readmeAssets/dark.png">

- Light Mode
<img src = "https://github.com/faacar/HipoInternship/blob/main/readmeAssets/white.png">

- How Drop down framework works
<img src = "https://github.com/faacar/HipoInternship/blob/main/readmeAssets/dropDownGifs.gif">

# 3rd Party Libraries
> <a href="https://github.com/SnapKit/SnapKit">SnapKit</a>\
> <a href="https://github.com/AssistoLab/DropDown">DropDown</a>

## Installation
Install the 3rd party libraries to use this project

```bash
pod install
```

# Architecture
- MVC architecture was used in this project.

# Code Sample
### Sorting members Rule.

- By using the extension function you wrote, find the most occurences of the character for each string in the array and sort in descending order.
```swift
extension String {
    func countNumberOfOccurrences(character: Character) -> Int {
        return self.filter { $0 == character }.count
    }
}
```

- If two or more strings contain the same amount for the character, sort these according to their length. 
- If two or more strings contain the same amount for the character and have the same length, sort these in alphabetical order.
```swift
    func sortMembers(char: Character){
        var hipoData = PersistenceManager.load()
        var members = hipoData[0].members

        members.sort(by: {
            let userFirst = $0.name.lowercased()
            let userSecond = $1.name.lowercased()

            if userFirst.countNumberOfOccurrences(character: char) > 
            userSecond.countNumberOfOccurrences(character: char) { // find the most occurrences char
                return true
            }
            else if userFirst.countNumberOfOccurrences(character: char) == 
            userSecond.countNumberOfOccurrences(character: char) &&
                        userFirst.count != userSecond.count { // char is eqeual, return long one
                return userFirst.count > userSecond.count ? true : false
            }
            else if userFirst.countNumberOfOccurrences(character: char) == 
            userSecond.countNumberOfOccurrences(character: char) &&
                        userFirst.count == userSecond.count {// length is equeal return alphabetically
                return userFirst < userSecond ? true : false
            }
            else { // return second one
                return false
            }
        })
        hipoData[0].members = members
        PersistenceManager.save(hipoMembers: hipoData)

        tableView.reloadData()
    }
```


# Author
- To contact with me: faruk-16@outlook.com
