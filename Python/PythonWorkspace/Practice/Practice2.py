from random import *

users = range(1, 21)
users = list(users)
# print(users)

shuffle(users)

winners = sample(users, 4)

print("-- 당첨자 발표--")
print("치킨 당첨자 : {0}".format(winners[0]))
print("커피 당첨자 : {0}".format(winners[1:4]))
print("-- 축하합니다 --")
