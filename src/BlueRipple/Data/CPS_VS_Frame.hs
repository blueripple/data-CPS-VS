{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
module BlueRipple.Data.CPS_VS_Frame
  (
    module BlueRipple.Data.CPS_VS_Path
  , module BlueRipple.Data.CPS_VS_Frame
  ) where

import           BlueRipple.Data.CPS_VS_Path

import qualified Frames.Streamly.TH                     as F

F.tableTypes' cpsVoterPUMSRowGen
