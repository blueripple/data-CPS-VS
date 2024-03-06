{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE TemplateHaskell #-}

module BlueRipple.Data.CPS_VS_Path
  (
    module BlueRipple.Data.CPS_VS_Path
  )
where

import qualified Frames.Streamly.TH as F
import qualified Frames.Streamly.ColumnUniverse         as FCU
import qualified Language.Haskell.TH.Env as Env

dataDir :: [Char]
dataDir = fromMaybe "../bigData/IPUMS/" $$(Env.envQ "BR_CPS_VS_DATA_DIR")

cpsVoterPUMSCSV :: FilePath
cpsVoterPUMSCSV = dataDir ++ "CPS_Voting_2006to2022.csv"

cpsVoterPUMSRowGen :: F.RowGen F.DefaultStream 'F.ColumnByName FCU.CommonColumns
cpsVoterPUMSRowGen = (F.rowGen cpsVoterPUMSCSV) { F.tablePrefix = "CPS"
                                                , F.separator = F.CharSeparator ','
                                                , F.rowTypeName = "CPSVoterPUMS_Raw"
                                                }
