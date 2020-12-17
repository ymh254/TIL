# url = "http://naver.com"
# var = url[7:16]    # http:// 부분을 제외
# var = var[0:5]     # .이후 제외
# psw = var[:3] + str(len(var)) + str(var.count("e")) + "!"
# print(psw)


# 같은 결과값을 갖는 코드
url = "http://naver.com"
var = url.replace("http://", "")
var = var[:var.index(".")]
psw = var[:3] + str(len(var)) + str(var.count("e")) + "!"
print("{0}의 비밀번호는 {1}입니다".format(url, psw))
