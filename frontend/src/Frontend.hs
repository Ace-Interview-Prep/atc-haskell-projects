{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}

module Frontend where

import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import Language.Javascript.JSaddle (liftJSM, js, js1, jsg)

import Obelisk.Frontend
import Obelisk.Configs
import Obelisk.Route
import Obelisk.Generated.Static

import Reflex.Dom.Core

import Common.Api
import Common.Route

frontend :: Frontend (R FrontendRoute)
frontend = Frontend
  { _frontend_head = do
      el "title" $ text "Obelisk Minimal Example"
      elAttr "script" ("type" =: "application/javascript" <> "src" =: $(static "lib.js")) blank
      elAttr "script" ("src" =: "https://cdn.tailwindcss.com") blank
  , _frontend_body = do
      elClass "nav" "bg-blue-600 text-white p-4 flex justify-between items-center" $ do
        elClass "h1" "text-xl font-bold" $ text "Twitter Clone"
        elClass "div" "flex space-x-4" $ do
          elAttr "a" ("href" =: "/" <> "aria-label" =: "Go to Home page") $ text "Home"
          elAttr "a" ("href" =: "/profile" <> "aria-label" =: "Go to Profile page") $ text "Profile"
          elAttr "a" ("href" =: "/tweets" <> "aria-label" =: "Go to Tweets page") $ text "Tweets"
      elClass "div" "max-w-7xl text-center py-7 font-bold text-2xl text-gray-800" $ do
        el "p" $ text "Welcome! Sign up with us today!!"

  }
