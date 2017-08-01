result = data.frame(y = input1 ^ 3)
readr::write_csv(x = result, "output/result.csv")