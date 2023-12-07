import SwiftUI

public struct AnimatedSlideView: View {
    @ObservedObject var viewModel: AnimatedSlideViewModel
    typealias SlidableContent = ZStack<TupleView<(Color, AnyView)>>
    var views: [SlidableContent]
    
    public init(views: [any View]) {
        self.viewModel = AnimatedSlideViewModel(totalPageCount: views.count)
        
        self.views = views.map { view in ZStack {
            Color.white.opacity(0.000001)
            AnyView(view)
        }}
    }
    
    public var body: some View {
        if views.count == 1 {
            views[0]
        } else {
            switch viewModel.currentPage {
            case 0:
                ZStack {
                    views[viewModel.currentPage]
                        .opacity(1-viewModel.offsetRatio.magnitude)
                    views[viewModel.currentPage+1]
                        .opacity(viewModel.offsetRatio < 0 ? viewModel.offsetRatio.magnitude : 0)
                    views[views.count-1]
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
            case views.count-1:
                ZStack {
                    views[views.count-1]
                        .opacity(1-viewModel.offsetRatio.magnitude)
                    views[0]
                        .opacity(viewModel.offsetRatio < 0 ? viewModel.offsetRatio.magnitude : 0)
                    views[views.count-2]
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
                    views[viewModel.currentPage]
                        .opacity(1-viewModel.offsetRatio.magnitude)
                    views[viewModel.currentPage+1]
                        .opacity(viewModel.offsetRatio < 0 ? viewModel.offsetRatio.magnitude : 0)
                    views[viewModel.currentPage-1]
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
}
