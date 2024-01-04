require "date"

seireki = 1926
showa = 1
heisei = 0
reiwa = 0

while seireki <= (Date.today.year + 1)
  puts "%s\t%s\t%s\t%s" % [seireki, showa, heisei, reiwa].map { |i| i.zero? ? nil : i.to_s }

  seireki += 1
  showa += 1
  heisei += 1 if seireki >= 1989
  reiwa += 1 if seireki >= 2019
end
