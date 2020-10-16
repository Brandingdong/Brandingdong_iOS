# Brandingdong_iOS

## 개요.
여성 의류 쇼핑몰 BRANDI의 iOS App Clone 프로젝트 입니다.

## 팀원.

- 이진욱 [[gitHub]](https://github.com/jwlee07)
- 윤병일 [[gitHub]](https://github.com/ByoungilYoun)

## use Library

```
- SnapKit
- SwiftLint
- Alamofire
```

## Architecture

```
- MVC
```
## Requirements

```
- Language
    - Swift 5.0

- FramWork
    - UIKit
    - CocoaPods

- IDE
    - Xcode
```

## Project

- 프로젝트 진행과정에 대한 설명입니다.

### 기획안

```
- MVP LIST
  - 로그인
  - 메인 홈 카테고리 (쇼핑몰마켓, 브랜드, 뷰티)
  - 상품상세정보
  - 상품구매
  - 장바구니
  - 찜
  - 마이페이지
```

- 1차 UI 기획


<img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/images/Brandingdong_1.jpg" width = "600" height = "400" />


- 2차 기획안

```
프로젝트 진행 중 예기치 못한 인원 감소로 인해 기획을 수정하였습니다.
```


<img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/images/Brandingdong_2.png" width = "400" height = "400" />     <img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/images/Brandingdong_3.png" width = "400" height = "400" />




<img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/images/Brandingdong_4.png" width = "400" height = "400" />     <img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/images/Brandingdong_5.png" width = "400" height = "400" />




<img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/images/Brandingdong_6.png" width = "400" height = "400" />     <img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/images/Brandingdong_7.png" width = "400" height = "400" />



## 스프린트 1차

- 로그인
- 메인 홈 카테고리 (쇼핑몰마켓, 브랜드, 뷰티)
- 상품상세정보

## 구현 내용

- 이진욱

```
- 로그인
    - View
        - 회원가입 2/3
        - 메인 홈 런처 스크린

    - Network
        - 회원가입 2/3 입력 시 조건사항에 이상이 없으면 해당 내용을 API에 POST 요청을 합니다.
        - 로그인 시 API에 저장되어 있는 ID/PASSWORD와 일치할 시 메인 뷰 진입이 되고,  아닐 시 로그인 되지 않습니다.

        - 메인 뷰 진입 전 메인 홈 런처스크린에서 메인 뷰에 보여야할 데이터(광고 배너 이미지, 상품(이미지, 판매자, 타이틀, 가격)를 API로 부터 Get 작업이 이뤄지게 됩.


- 메인 홈 카테고리
    - View
        - 메인 탭바
        - 서치바
        - 메인 카테고리
        - 광고 배너 이미지 삽입
        - 상품 데이터(이미지, 판매자, 타이틀, 가격) 삽입
    
    - Network
        - 상품을 클릭할 시 해당 상품의 제품키(product_key)를 사용하여 상품의 옵션(size, color)를 API에 Get 요청을 합니다.
    
- 상품상세 페이지

    - View
        - 상품상세 페이지의 모든 뷰 구현

    - Data
        - 메인 홈 런처 스크린에서 Get하였던 정보 중 해당 상품에 해당하는 데이터를 상품 명, 상품 키를 기준으로 데이터(상품이미지, 판매자, 상품명, 가격, 상품상세이미지)를 확보합니다. 이후 레이아웃의 용도에 맞게 데이터를 삽입하였습니다.

```

- 윤병일

```
```

```
왼쪽부터 순서대로 로그인, 메인 홈 카테고리(쇼핑몰마켓, 브랜드, 뷰티), 상품상세정보 입니다.
```



<img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/gifs/Brandingdong_Login.gif" width = "200" height = "400" />     <img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/gifs/Brandingdong_MainHome.gif" width = "200" height = "400" />     <img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/gifs/Brandingdong_ProductInfo.gif" width = "200" height = "400" />





## 스프린트 2차

- 상품구매
- 장바구니
- 찜
- 마이페이지

## 구현 내용

- 이진욱
```
- 상품구매

    - View
        - 구매하기 버튼 클릭 시 해당 상품에 해당하는 옵션(size, color) 데이터를 삽입 하였습니다.

        - 상품확정 뷰에서는 이전 구메하기 플로우 진행시 선택하였던 옵션(size, color) 데이터를 상품 목록에 삽입 하였습니다.

- 장바구니
    
    - View
        - 장바구니 View 구현
        - 구매하기 상품확정 플로우에서 확정한 상품 정보를 장바구니 구매 리스트 항목에 추가하였습니다.

- 찜
    - View 
        - 찜 View 구현

    - Data
        - 해당 찜은 로컬 데이터로 사용이 됩니다.
        - 추가된 데이터(상품이미지, 판매자, 상품명, 가격)는 찜한상품, 최근 본 상품 동일합니다.
        - 메인 뷰에서 하트 버튼을 클릭하였던 상품들을 찜한 상품에 추가합니다.
        - 메인 뷰에서 상품상세페이지로 진입이 되었던 상품을 최근 본 상품에 추가합니다

- 마이페이지
    - View
        - 마이페이지 View 구현
        - 포인트 View 구현
```

- 윤병일

```
```



```
왼쪽부터 순서대로 상품구매, 장바구니, 찜, 마이페이지 입니다.
```



<img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/gifs/Brandingdong_ProductBuy.gif" width = "200" height = "400" />     <img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/gifs/Brandingdong_ShoppingBasket.gif" width = "200" height = "400" />     <img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/gifs/Brandingdong_Favorite.gif" width = "200" height = "400" />     <img src = "https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/gifs/Brandingdong_Mypage.gif" width = "200" height = "400" />

## 최종 시현 영상




[![브랜딩동_시현영상](https://github.com/jwlee07/Brandingdong_iOS/blob/develop/Brandingdong/ReadMeImages/images/Brandingdong_8.png)](https://www.youtube.com/watch?v=_zR8TFKT3Jc)
  