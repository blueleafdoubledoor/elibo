import Html exposing (Html, Attribute, div, input, text)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String

main =
  App.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model =
  { content : String }

-- デフォルトの設定
model : Model
model =
  { content = "" }

-- UPDATE
type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }

-- VIEW
view : Model -> Html Msg
view model =
  div []
  [ input [ placeholder "入力してください", onInput Change ] []
  , div [] [ text (String.reverse model.content) ]
  ]
