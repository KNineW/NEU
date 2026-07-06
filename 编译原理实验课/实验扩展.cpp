#include<iostream>
#include<string> 
using namespace std;
void E();
void T();
void F();
string s;
int i, l, r;
bool ERROR;//记录是否有错误
bool IsNum(char ch)
{
      return ch >= '0' && ch <= '9';
}
bool IsA(char ch)
{
      return ch >= 'a' && ch <= 'z';
}
bool IsI(char ch)//判断是否时数字或者字母
{
      if (IsA(ch))
      {
            while (IsA(s[i])||IsNum(s[i]))i++;
            return true;
      }
      if(IsNum(ch))
      {
            while (IsNum(s[i]))i++;
            if (s[i] != 'e'&&s[i]!='.')return true;
            else i++;
            if (s[i] == '-' && s[i-1] != '.')i++;
            else if (s[i] == '-' && s[i - 1] == '.')
            {
                  ERROR = 1;
                  return false;
            }
            while (IsNum(s[i]))i++;
            return true;
      }
      return false;
}
int main()
{
      i = 0;
      ERROR = 0;
      cin >> s;
      s += '#';
      E();
      if (s[i] == '#' && !ERROR)
            cout << "True" << endl;
      else cout << "False" << endl;
      return 0;
}
void E()
{

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
      if (IsI(s[i]))
      {
      }

      else if (s[i] == '(')
      {
            i++;
            E();
            if (s[i] != ')')
            {
                  ERROR = 1;
                  return;
            }
            i++;
      }
      else
      {
            ERROR = 1;
            return;
      }
}