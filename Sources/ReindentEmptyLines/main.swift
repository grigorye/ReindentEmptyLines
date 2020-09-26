var accumulatedLines: Int = 0

while let line = readLine() {
    if line.allSatisfy({ $0.isWhitespace }) {
        accumulatedLines += 1
    } else {
        if let indentationLength = line.firstIndex(where: { !$0.isWhitespace }) {
            let indentation = line[..<indentationLength]
            for _ in 0..<accumulatedLines {
                print(indentation)
            }
        }
        print(line)
        accumulatedLines = 0
    }
}
