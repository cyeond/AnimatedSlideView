import SwiftUI

public struct AnimatedSlideView<Content1: View, Content2: View, Content3: View>: View {
    @ObservedObject var viewModel: AnimatedSlideViewModel
    var view1: Content1
    var view2: Content2
    var view3: Content3
    
    
    public init(@ViewBuilder first: () -> Content1, @ViewBuilder second: () -> Content2, @ViewBuilder third: () -> Content3) {
        self.viewModel = AnimatedSlideViewModel()
        self.view1 = first()
        self.view2 = second()
        self.view3 = third()
    }
    
    public var body: some View {
        switch viewModel.currentPage {
        case 1:
            ZStack {
                view2
                    .opacity(1-viewModel.offsetRatio.magnitude)
                view3
                    .opacity(viewModel.offsetRatio < 0 ? viewModel.offsetRatio.magnitude : 0)
                view1
                    .opacity(viewModel.offsetRatio > 0 ? viewModel.offsetRatio.magnitude : 0)
            }
            .gesture(DragGesture(minimumDistance: 5, coordinateSpace: .global)
                .onChanged { value in
                    viewModel.setOffset(value.translation.width)
                }
                .onEnded({ value in
                    viewModel.resetOffset()
                })
            )
        case 2:
            ZStack {
                view3
                    .opacity(1-viewModel.offsetRatio.magnitude)
                view1
                    .opacity(viewModel.offsetRatio < 0 ? viewModel.offsetRatio.magnitude : 0)
                view2
                    .opacity(viewModel.offsetRatio > 0 ? viewModel.offsetRatio.magnitude : 0)
            }
            .gesture(DragGesture(minimumDistance: 5, coordinateSpace: .global)
                .onChanged { value in
                    viewModel.setOffset(value.translation.width)
                }
                .onEnded({ value in
                    viewModel.resetOffset()
                })
            )
        default:
            ZStack {
                view1
                    .opacity(1-viewModel.offsetRatio.magnitude)
                view2
                    .opacity(viewModel.offsetRatio < 0 ? viewModel.offsetRatio.magnitude : 0)
                view3
                    .opacity(viewModel.offsetRatio > 0 ? viewModel.offsetRatio.magnitude : 0)
            }
            .gesture(DragGesture(minimumDistance: 5, coordinateSpace: .global)
                .onChanged { value in
                    viewModel.setOffset(value.translation.width)
                }
                .onEnded({ value in
                    viewModel.resetOffset()
                })
            )
        }
    }
}
