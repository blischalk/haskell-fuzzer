module Lib
    ( fuzz
    ) where

import qualified Data.ByteString as BS
import Network.Simple.TCP

host :: String
host = "127.0.0.1"

port :: String
port = "4444"

payload :: BS.ByteString
payload = BS.pack $ take 500 $ repeat 0x41

fuzz :: IO ()
fuzz = do
  putStrLn $ "About to fuzz " ++ host
  connect host port $ \(connectionSocket, remoteAddr) -> do
    putStrLn $ "Connection established to " ++ show remoteAddr
    send connectionSocket payload
