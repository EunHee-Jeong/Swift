## API 명세서를 볼 때 주의깊게 보아야 할 정보들

### 1. BaseURL

- 가장 기본이 되는 경로

### 2. HTTP Method

- GET, PUT, POST, DELETE

### 3. Path

- BaseURL 뒤에 붙는 경로
- 주소를 확정하는 것
- 얻고자 하는 자원 (= 데이터) 의 위치가 각각 다르기 때문에, 원하는 자원을 얻기 위해 명세서에 나와 있는 정확한 경로로 요청해야 함

### 4. Request

- 요청 시 같이 넣어줘야 하는 정보들이자 서버가 요구하는 것
- `Header`, `parameter`, `body`

### 5. Response

- 요청의 성공과 실패에 따른 결과를 담은 `응답 body`
- `Status Code`, `Value` 를 확인하면 됨
