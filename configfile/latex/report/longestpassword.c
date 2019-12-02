/*************************************************************************
    > File Name: longestpassword.c
    > Author: ShiGuangzhao
    > Mail: Guangzhao_Shi@163.com 
    > Created Time: 2019年12月02日 星期一 21时34分10秒
 ************************************************************************/

#include <stdbool.h>
#include <stdio.h>

int solution(char *S) {
    int MaxLength = 0;
    int CharCount = 0;
    int NumberCount = 0;
    bool PassWord = true;
    for(int i = 0; S[i] != 0; i++) {
        // 0--48, 9--57; A--66, Z--90; a--97, z--122, 空格--32
        // 遇到空格或此字符串不合法
        if(PassWord && S[i] != ' ') {
            if(S[i] <= '9' && S[i] >= '0') {
                NumberCount++;
            }
            else if((S[i] >= 'a' && S[i] <= 'z') \
                    || (S[i] >= 'A' && S[i] <= 'Z')) {
                CharCount++;
            }
            else {
                PassWord = false;
                NumberCount = 0;
                CharCount = 0;
            }
        }
        else {
            // 合法字符串遇到空格
            if(PassWord) {
                if(MaxLength < NumberCount + CharCount \
                        && NumberCount % 2 == 1 \
                        && CharCount % 2 == 0)
                    MaxLength = NumberCount + CharCount;
                NumberCount = 0;
                CharCount = 0;
                PassWord = true;
            }
            // 不合法字符串空格
            else if(S[i] == ' ') {
                PassWord = true;
            }
            // 不合法字符串非空格
        }
    }

    // 最后一个字符串是否合格
    if(PassWord) {
        if(MaxLength < NumberCount + CharCount \
                && NumberCount % 2 == 1 \
                && CharCount % 2 == 0)
            MaxLength = NumberCount + CharCount;
    }
    return MaxLength == 0? -1 : MaxLength;
}

int main(void) {
   char str[] = "test aa1 a0A pass007 ?xy1";
   printf("%s\n", str);
   printf("%d\n", solution(str));
   return 0;
}
