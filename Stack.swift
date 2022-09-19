import Foundation

struct Stack<T> {
    var isEmpty: Bool {
            return self.list.isEmpty
        }
        
        var top: T? {
            return self.list.last
        }
        
        mutating func push(_ item: T) {
            self.list.append(item)
        }
        
        mutating func pop() -> T? {
            return self.list.popLast()
        }
        
        private var list = [T]()
}
