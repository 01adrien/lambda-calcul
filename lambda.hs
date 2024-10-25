id x = x

selfApply f = f f

apply f args = f args

main :: IO ()
main = do
  print (id selfApply)
