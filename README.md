# AnimatedSlideView for SwiftUI

<p>
  <img src="https://img.shields.io/badge/iOS-13.0+-blue"/>
  <img src="https://img.shields.io/badge/SwiftUI-blue"/>
</p>
<p align="leading">
  <img width="25%" src="https://github.com/cyeond/AnimatedSlideView/assets/139483587/039f809d-37dd-4dfb-8260-fb9eb284a84c">
</p>

<br>

## Client Usage

1. Add package with URL https://github.com/cyeond/AnimatedSlideView
2. import AnimatedSlideView
3. Set three custom views in AnimatedSlideView(first: , second: , third: )
### Example
```swift
import SwiftUI
import AnimatedSlideView

struct ContentView: View {
    var body: some View {
        AnimatedSlideView {
            ZStack {
                Color.red
                Text("First View")
                    .foregroundColor(.white)
                    .font(.system(size: 30.0))
                    .fontWeight(.bold)
            }
        } second: {
            ZStack {
                Color.yellow
                Text("Second View")
                    .foregroundColor(.white)
                    .font(.system(size: 30.0))
                    .fontWeight(.bold)
            }
        } third: {
            ZStack {
                Color.blue
                Text("Third View")
                    .foregroundColor(.white)
                    .font(.system(size: 30.0))
                    .fontWeight(.bold)
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
```

<br>
<br>
