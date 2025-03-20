struct Heap<T: Comparable> {
    private var nodes: [T] = []
    private let order: (T, T) -> Bool  // 예: min-heap은 (<), max-heap은 (>)

    init(order: @escaping (T, T) -> Bool) {
        self.order = order
    }
    
    var isEmpty: Bool { nodes.isEmpty }
    var count: Int { nodes.count }
    var peek: T? { nodes.first }
    
    // 힙에 새 원소를 추가 (삽입)
    mutating func insert(_ value: T) {
        nodes.append(value)
        siftUp(from: nodes.count - 1)
    }
    
    // 힙에서 루트 원소를 제거 (삭제) 후 반환
    mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        nodes.swapAt(0, nodes.count - 1)
        let removed = nodes.removeLast()
        siftDown(from: 0)
        return removed
    }
    
    // 삽입 후 위로 올리기 (힙 속성 유지)
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && order(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
        nodes[childIndex] = child
    }
    
    // 삭제 후 아래로 내리기 (힙 속성 유지)
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        let count = nodes.count
        
        while true {
            let leftChildIndex = parentIndex * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            var candidate = parentIndex
            
            if leftChildIndex < count && order(nodes[leftChildIndex], nodes[candidate]) {
                candidate = leftChildIndex
            }
            if rightChildIndex < count && order(nodes[rightChildIndex], nodes[candidate]) {
                candidate = rightChildIndex
            }
            if candidate == parentIndex { break }
            nodes.swapAt(parentIndex, candidate)
            parentIndex = candidate
        }
    }
}
