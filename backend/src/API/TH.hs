module API.TH where

import Data.Aeson.TH

jsonOptions = defaultOptions { omitNothingFields = True }
