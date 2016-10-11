{- 練習 1
  ＋ ボタンと ー ボタン押下で数値を変更するプログラム
-}
import Html exposing (Html, button, div, text)
import Html.App as App
import Html.Events exposing (onClick)

-- エントリポイント
main =
  App.beginnerProgram { model = 0, view = view, update = update }

-- Increment と Decrement の値を持つ Msg 型を定義
type Msg = Increment | Decrement

-- アプリケーションの更新
-- msg が Increment なら model を 1 増加し、Decrement なら 1 減少する
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

-- アプリケーションの表示内容
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text ( toString model ) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
