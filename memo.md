## 勉強のメモ  

### elm lang

構文は、Haskell に似ている。  
構文については、 elm を勉強することで、Haskell の勉強にもなりそう。  

## Elm アーキテクチャ  
Elm アーキテクチャのには対応する２つのバージョンがある。  
* beginnerProgram 関数  
* program 関数  

beginnerProgram 関数が基本になるらしい。  

```elm
type alias Model = ...  
type Msg = ...  

model : model
view : model -> Html msg
update : msg -> model -> model
```

program 関数は、Cmd/Sub(旧Effects) が入ったバージョン  

* Cmd/Sub とは、  
	非同期処理、並行処理、副作用処理を表す。  

* Cmd/Sub バージョンは基本バージョンを含むので、実用的なアプリケーションの実装なら  
	こちらを採用する。  

```elm
type alias Model = ...  
type Msg = ...  

init : (model, Cmd msg)  
update : msg -> model -> (model, Cmd msg)  
view : model -> Sub msg  
subscription : model -> Sub msg  
```

program と beginnerProgram の違いは、  
model が、 init に代わり、 init と update が、 Model と Cmd Msg をタプルで  
返すようになっている。  
Cmd は、「Elm 内から起きる」非同期、副作用処理を表している。  
(init にあるのは Elm がロードされたタイミングに update にあるのは何かイベントが起きたタイミングに実行される。)  
Cmd/Sub バージョンの例として、マウスの座標を画面に表示するとようのをやっている。  


elm のインデントは、スペース２つなのでタブが挿入されるとコンパイルエラーとなる。  
