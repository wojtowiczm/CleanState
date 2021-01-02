# CleanState
Clean architecture implementation for SwiftUI based projects

## Overview
Proposed implementation from [Uncle Bob Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

## Motivation
When I started learing SwiftUI I asked myself which architecture is the best usecase for SwiftUI. I really like concept of separated testable components and so far [CleanSwift](https://clean-swift.com) - implementation of origin Clean Architecture for iOS development seems to be the best option.
However when it comes to SwiftUI there is a problem with state. It's just not clear whitch compoment should hold state of View.
That's why I replaced Origin `Presenter` with more firendly for SwiftUI views `ViewState`.

## Entities
### View - User interface

```swift
struct Example_View: View {
    @ObservedObject var state: Example_ViewState
    let interactor: Example_BusinessLogic
    
    var body: some View { ... }
}
```

### View State - Source of thuth

```swift
protocol Example_PresentationLogic: class {
    func presentSomeEvent()
}

final class FormViewState: ObservableObject, Example_ViewData {
    @Published var someString: String = ""
}

extension Example_ViewState: Example_PresentationLogic {
    func presentSomeEvent() { ... }
}
```

```switft
struct Example_View: View {
    @ObservedObject var state: Example_ViewState
    let interactor: Example_BusinessLogic
    
    var body: some View { ... }
}
```

### Interactor - Bussiness Logic 
```swift
// Data exposed to logic
// Since in 'CleanState' should be only one source of thuth it should be implemented by ViewState.
// Interactor should not modify directly ViewData (properties should me market 'get'). 
// It should be done via PresentationLogic.
protocol Example_ViewData: class {
    var someString: String { get }
}

protocol FormBusinessLogic {
    func submitSomeData()
}

struct Example_Interactor: Example_BusinessLogic {
    weak var presenter: Example_PresentationLogic?
    unowned let data: Example_Data
    
    func submitSomeData() { ... }
}
```
 
## Flow diagram
![Diagram not loaded](https://github.com/wojtowiczm/CleanState/blob/main/FlowDiagram.png?raw=true)

