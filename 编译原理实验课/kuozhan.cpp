#include<iostream>
#include<string> 
using namespace std;
void E();
void T();
void F();
string s;
int i, l, r;
bool ERR;//记录是否有错误
bool isNum(char ch)
{
    return ch >= '0' && ch <= '9';
}
bool isA(char ch)
{
    return ch >= 'a' && ch <= 'z';
}
bool isI(char ch)//判断是否位数字或者字母
{
    if (isA(ch))
    {
        while (isA(s[i])||isNum(s[i]))i++;
        return true;
    }
    if(isNum(ch))
    {
        while (isNum(s[i]))i++;
        if (s[i] != 'e'&&s[i]!='.')return true;
        else i++;
        if (s[i] == '-' && s[i-1] != '.')i++;
        else if (s[i] == '-' && s[i - 1] == '.')
        {
            ERR = 1;
            return false;
        }
        while (isNum(s[i]))i++;
        return true;
    }
    return false;
}
int main()
{
    i = 0;
    ERR = 0;
    cin >> s;
    // if (isI(s[0]))cout << "SB" << endl;
    // cout << i << endl;

    s += '#';
    E();
    if (s[i] == '#' && !ERR)
        cout << "true" << endl;
    else cout << "false" << endl;
    return 0;
}
void E()
{
    //cout << "E:" << s[i] << endl;

    T();
flag1:
    if (s[i] != '-' && s[i] != '+')
    {
        return;
    }
    i++;
    T();
    goto flag1;
}

void T()
{
    F();
flag2:
    if (s[i] != '*' && s[i] != '/')
    {
        return;
    }
    i++;
    F();
    goto flag2;
}

void F()
{
    if (isI(s[i]))
    {
    }

    else if (s[i] == '(')
    {
        i++;
        E();
        if (s[i] != ')')
        {
            ERR = 1;
            return;
        }
        i++;
    }
    else
    {
        ERR = 1;
        return;
    }
}