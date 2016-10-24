{- 練習 1
  ＋ ボタンと ー ボタン押下で数値を変更するプログラム
-}
import Html exposing (Html, button, div, text)
import Html.App as App
import Html.Events exposing (onClick)

-- エントリポイント
main =
  App.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = Int

model : Model
model =
  0

-- UPDATE
-- Increment と Decrement の値を持つ Msg 型を定義
type Msg = Increment | Decrement

-- アプリケーションの更新
-- msg が Increment なら model を 1 増加し、Decrement なら 1 減少する
-- update だけが、model の状態を更新できる
update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

-- VIEW
-- アプリケーションの表示内容
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text ( toString model ) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
