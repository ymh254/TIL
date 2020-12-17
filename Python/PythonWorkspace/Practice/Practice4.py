def std_weight(height, gender):    # 키 단위: m
    if gender == "남자":
        return height * height * 22
    else:
        return height * height * 21


height = 175  # cm
gender = "남자"
weight = round(std_weight(height / 100, gender), 2)    # 소주점 둘째자리까지 표시
print("키 {0}cm {1}의 표준 체중은 {2}kg 입니다".format(height, gender, weight))
