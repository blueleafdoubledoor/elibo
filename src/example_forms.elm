import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  App.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model =
  {
    name: String
    , password : String
    , passwordAgein : String
  }

model : Model
model =
  Model "" "" ""

-- UPDATE
type Msg
  = Name String
  | Password String
  | PasswordAgein String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgein passwordAgein ->
      { model | passwordAgein = passwordAgein }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ input [ type' "text", placeholder "Name", onInput Name ] []
    , input [ type' "password", placeholder "password", onInput Password ] []
    , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgein ] []
    , viewValidation model
    ]

viewValidation : Model -> Html Msg
viewValidation model =
  let
    (color, message) =
      if model.password == model.passwordAgein then
        ("green", "OK") -- 入力 OK
      else
        ("red", "パスワードが違います") -- 入力されたパスワードが間違っている場合
  in
    div [ style [ ("color", color) ] ] [ text message ]
