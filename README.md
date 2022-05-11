## 로그인 / 회원가입
FirebaseAuth로 간단하게 구현하였다. 로그인을 한번 하면 자동 로그인이 되도록 하였다. 
1. 로그인과 동시에 아이디와 회원가입 그리고 로그인 여부가 UserDefaults을 통해 저장한다. 

2. UILifeCycle을 담당하는 SceneDelegate에서 LoginViewModel객체를 가져온다. 

3. viewmodel에서 UserDefaults에 저장한 로그인여부를 가져와서 로그인이 true이면 어플을 켰을 때 바로 메인화면으로 넘어가고,
false이면, 로그인화면으로 넘어간다.

## 프로필 셋팅  
처음 로그인을 하게 되면 프로필 셋팅 화면으로 넘어간다. 

1. 프로필사진, 닉네임, 현재직무, 사용언어 4가지로 구성되어있다.

2. 현재직무와 사용언어는 pickerview를 통해서 정해진 내용만 클릭할 수 있다.

3. 이미지는 PHPicker를 통해 갤러리에서 사진을 가져올 수 있게 했다.

PHPickerConfiguration() 프로퍼티를 만들어주고 selectionLimit을 지정해주고, filter는 image로 해주었다. PHPickerViewController configuration에 만들어준 프로퍼티를 넣어준다. picker delegete를 self로 지정해주고, present해준다.

사진을 선택했으면 dismiss해준다음, 선택된 asset의 representationdmf 가져온다. provider가 내가 지정한 타입을 로드할 수 있는 체크한 뒤 로드할 수 있으면 로드한다.

4. 저장버튼을 누르면 이미지주소, 닉네임, 직무, 언어, 4가지의 정보가 firestore (UserInfo)에 저장된다. 이미지는 storage에 저장된 후 url로 생성되어 저장된다.

5. 프로필셋팅이 완성되면 메인 화면으로 넘어간다.

<img src="https://user-images.githubusercontent.com/88191880/167785407-4e767a14-f795-4881-a56a-39ec677ac9a9.png" width="200" height="400"/> <img src="https://user-images.githubusercontent.com/88191880/167785526-deeead6f-15e9-45e1-a641-e0367014e99f.png" width="200" height="400"/>

## MainViewController
메인화면에서는 기능구현은 거의 없고 보여지는 ui만 그려줬다(?)

1. 서버에 저장된 사용자 닉네임을 가져와 닉네임을 보여준다.

2. 첫번째 컨테이너에서는 프로그래밍 언어 강의를 보여준다. DropDown을 통해 Swfit, Kotlin, Java 중 한가지를 선택하면
collectionView reload를 하고, 해당하는 타이틀과 이미지를 가진 cell로 업데이트 해준다.

3. 두번째 컨테이너에서는 인기 게시물을 보여준다. 기능 구현은 cell을 보여주는 정도로만 구현했다.

## ReCommandViewController
선택한 카테고리를 토대로 실시간으로 바뀌는 추천 collectionView
1. (직업, 학습필요기간, 프로그래밍 언어, 기타 용품)카테고리를 알맞게 선택한다.

2. 카테고리를 선택하면 서버에 저장된다. 

3. 서버에 저장됨과 동시에 화면을 업로드해줘서 카테고리를 업데이트 시켜준다.

4. job, trem 컨테이너에서는 선택한 내용에 따라 cell의 타이틀과 image가 업로드된다.

5. 네이버 오픈 검색 api를 alamofire를 통해서 서버에서 데이터를 가져왔다. 
선택한 기타(pc, 책상, 안경, 의자) 즉, 해당 아이템을 서버에 요청하고 데이터가 있으면 해당 데이터의 이미지와 타이틀을 가져왔다.

<img src="https://user-images.githubusercontent.com/88191880/167789055-dfd54b62-857d-4c7a-b3ca-36bb8ca51e52.mp4" width="200" height="400"/>

## CommunityViewController / NewPostViewController / ReplyViewController
게시물을 올리고 해당 게시물에 좋아요를 누르며 댓글을 달 수 있다.

1. 새로운 게시물을 올리면 서버에 저장되고, 서버에 저장된 데이터의 개수와 데이터를 가져와서 보여준다. 해당 게시판에 들어갈 때 collectionView를 reload해주고, 게시물을 새로 만들 때 reload해준다.

2. 새로운 게시물을 저장하면 NotificationCenter에 등록된 이벤트가 발생하도록 해서 메세지를 전달하고 해당 이벤트에 대한 행동을 취한다.

3. transaction을 통해 좋아요 기능을 구현하였다. 공감 버튼을 누를 때마다 firestore like 필드 값을 +1 시켜준다.

4. 댓글을 올리면 실시간으로 댓글이 올라가도록 viewmodel에서 서버에 있는 데이터와 파라미터로 받은 데이터가 동일하면 서버에 있는 데이터를 배열에 저장한 후
데이터타입으로 디코딩해 클로져를 통해 비동기처리로 데이터를 viewcontroller에 넘거주고 tableview를 reload해준다.

<img src="https://user-images.githubusercontent.com/88191880/167790486-26f76759-acef-4851-9170-fc93d5f5dea4.png" width="200" height="400"/> <img src="https://user-images.githubusercontent.com/88191880/167790581-305dda72-2044-4191-9192-88c6360d41ea.png" width="200" height="400"/>

<img src="https://user-images.githubusercontent.com/88191880/167790668-ec6dab9e-1776-4eed-b105-8860cb49f76d.png" width="200" height="400"/> <img src="https://user-images.githubusercontent.com/88191880/167790673-d9405977-0352-4aff-b7d7-543a220db227.png" width="200" height="400"/>
