#include<bits/stdc++.h>
using namespace std;
map<char, int>mp;
int H[10][10];
string s[10];
stack<char>ss;
string s1;
set<char>vt, vn;
void Pre()
{
      mp['E'] = 1, mp['A'] = 2, mp['T'] = 3, mp['B'] = 4, mp['F'] = 5;
      mp['i']=1, mp['w'] = 2,mp['e']=3,mp['('] = 4, mp[')'] = 5, mp['#'] = 6;

      for (int i = 0;i < 10;i++)
            for (int j = 0;j < 10;j++)
                  H[i][j] = -1;
      
      H[1][1] = 1, H[1][4] = 1;
      H[2][2] = 2, H[2][5] = 3, H[2][6] = 3;
      H[3][1] = 4, H[3][4] = 4;
      H[4][2] = 6, H[4][3] = 5, H[4][5]=H[4][6] = 6;
      H[5][1] = 7, H[5][4] = 8;

      s[1] = "AT";
      s[2] = "ATw", s[3] = "k";
      s[4] = "BF";
      s[5] = "BFe", s[6] = "k";
      s[7] = "i", s[8] = ")E(";

      vt.insert('i'), vt.insert('w'), vt.insert('e'), vt.insert('('), vt.insert(')');
      vn.insert('E'), vn.insert('A'), vn.insert('T'), vn.insert('B'), vn.insert('F');
}
char Jude(int &pos)
{
      while (s1[pos] == ' ')pos++;
      
      //括号
      if (s1[pos] == '(' || s1[pos] == ')')return s1[pos++];
      //数字或字母
      if (s1[pos] >= '0' && s1[pos] <= '9' || s1[pos] >= 'a' && s1[pos] <= 'z')
      {
            while (s1[pos] >= '0' && s1[pos] <= '9' || s1[pos] >= 'a' && s1[pos] <= 'z')pos++;
            //pos++;
            return 'i';
      }
      //加减
      if (s1[pos] == '+' || s1[pos] == '-')
      {
            pos++;
            return 'w';
      }
      //乘除
      if (s1[pos] == '*' || s1[pos] == '/')
      {
            pos++;
            return 'e';
      }
      //#号
      else return s1[pos++];
}

void Solve()
{
      getline(cin, s1);
      s1 += '#';
      int pos = 0;

      ss.push('#');
      ss.push('E');
flag1:
      char w = Jude(pos);
flag2:
      char x = ss.top();
      ss.pop();

      //判断是否为终结符
      if (vt.find(x) != vt.end())
      {
            if (x == w)
                  goto flag1;
            else
            {
            
                  cout << "False\n";
                  return;
            }
      }
      else
      {
            //判断是否为非终结符
            if (vn.find(x) != vn.end())
            {
                  int t = H[mp[x]][mp[w]];
                  //LL(1)表对应位置为空，则错误
                  if (t == -1)
                  {
                    
                        cout << "False\n";
                        return;
                  }

                  if(s[t][0]!='k')
                        for (int i = 0;i < (int)s[t].size();i++)
                              ss.push(s[t][i]);
                  goto flag2;
            }

            else if (w == '#')
            {
                  cout << "True\n";
                  return;
            }
            else
            {
                  cout << "False\n";
                  return;
            }

      }
}

int main()
{
      Pre();
      while (!ss.empty())
        ss.pop();
        Solve();
      
}