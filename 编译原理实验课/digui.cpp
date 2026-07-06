#include<iostream>
#include<string> 
using namespace std;
void E();
void T();
void F();
string s; 
int i, l, r;
bool ERROR;//记录是否有错误
bool IsI(char ch)
{
      return ch >= 'a' && s[i] <= 'z' || ch >= '0' && ch <= '9';
}
int main()
{
      i = 0;
      ERROR = 0;
      cin >> s;
      s += '#';
      E();
      
      if (s[i] == '#' && !ERROR)
            cout << "true" << endl;
      else cout << "false" << endl;
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
            while (IsI(s[i]))i++;
            
      }
      else if (s[i] == '(')
      {
            i++;
            E();
            if(s[i]!=')')
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