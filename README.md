### Development notes:
1. This project supports iOS 14 and above since iOS 13 is almost 3 years past and SwiftUI is limited otherwise. It is also quite hard if not impossible to create a new SwiftUI project with Xcode 13 since it will automatically create the 'App' component which is not available for iOS 13 and adding the SceneDelegate with AppDelegate seem to not work.
2. Trending API is not part of the public API of GitHub [(see repos docs)](https://docs.github.com/en/rest/repos/repos) [(other developers have encounter a similar issue)](https://stackoverflow.com/questions/30525330/how-to-get-list-of-trending-github-repositories-by-github-api). As an alternative I've used the first page of the (/search/repos/)[https://docs.github.com/en/rest/search#search-repositories] api with the search query item set to 'language:swift' and ordered by the 'updated' attribute  
   
---
# Modules
The project is applying the layer concept from [Clean Architecture as presented by Uncle Bob](http://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) 

## CoreTrend
Contains Domain logic, agnostic of any business logic, UI or API

## PresentationTrend
Contains the presentation logic of the app, view models from MVVM implementing the business logic & state management  

## GitHubAPI
Is a module implementing the specific API requirements of the GitHub API and the RepositoryFetcher interface of the app

## Testing 
Unit testing have been added mostly for the business logic implemented via view models
UI Testing were not implemented due to their slow feedback loop, preferring Unit Tests as much as possible

## Further Improvements & Tasks:
1. Add tests for GitHubAPI
2. Implement Favorite action by storing the favorite repo locally
3. Cache data to work offline
4. Implement continuous scrolling and multipage support for list of repos
5. Screen with list of favorite repos
6. Implement a search functionality
7. Support GitHub authentication
8. Display list of issues of a repo 

---
Note: This is a project used to evaluate my coding skills and iOS knowledge.


# Description

The project’s idea is to list trending projects from Github, tap on one of them, and show their details.
## Requirements:

- Write your application in Swift.
- Ensure your application is compatible with the latest version of iOS. (The layout of the screens must work on all supported iOS 13 devices (iPhone SE 1st gen, iPhone 11 Pro Max).
- Add at least one coordinated animation.
- Use good architecture and design patterns.
- Use SwiftUI is a big plus.
