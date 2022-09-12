### 정해진 크기의 배열 만들기

```swift
var threeDoubles = [Int](repeating: 0, count: 5)
// [0, 0, 0, 0, 0]
```

### 배열의 속성 변경하기

```swift
sort(), reverse(), sorted(), sorted(by: >)
```

- 수동태는 변경하고 리턴도 같이 해주는 것

```swift
var input = readLine()!

for i in (1...Int(input)!).reversed() {
	print(i)
}
```

### 배열에 값 추가하기

```swift
threeDoubles.append(contentsOf: stride(from: 5, through: 1, by: 1))
// [0, 0, 0, 0, 0, 1, 2, 3, 4, 5]
```

```swift
// stride()

for i in stride(from: Int(input)!, to: 1, by: -1) {   // by에 음수 넣어주면 됨
	print(i)
}

// but 이렇게 하면 오류 발생. to는 파라미터로 들어오는 수를 제외하고 카운팅하기 때문임

// 포함하고 싶다면 stride(from:through:by:) 사용
```

### 배열의 값 수정하기

1. 범위 지정
    
    ```swift
    threeDoubles[1...2] = [5, 6]    // [0, 5, 6, 0, 0, 1, 2, 3, 4, 5]
    ```
    
    - 범위를 벗어나게도 넣을 수 있음
2. 삽입
    
    ```swift
    insert( _:at:)
    
    // out of range를 주의해야 한다.
    ```
    
3. 삭제
    
    ```swift
    remove(at:), removeAll(), removeFirst(), popLast(),
    removeLast(), dropFirst(), dropLast()
    ```
    
    - popLast()는 nil도 없애기 때문에, removeLast()를 사용하는 것이 안전하다.
        - nil을 없앤다는 소리는 메모리 공간에서도 해제한다는 건가...? 한 번 찾아보자
    - dropFirst(), dropLast()는 프린트도 함께 해준다.
        
        == 배열을 리턴한다 !
        
4. 배열 값 접근

```swift
startIndex, endIndex, first, last, min(), max()

// endIndex는 개수만큼 출력한다... 이건 또 왜 그런거임?

// first, last는 값에 직접 접근 !
```
