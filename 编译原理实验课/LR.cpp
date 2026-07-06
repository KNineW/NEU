#include<bits/stdc++.h>
using namespace std;
map<char, int>mp;
struct Node
{
    char ch;int num;
}has[20][20];
stack<char>s1;//符号
stack<int>s2;//状态
string s;
string ss[7] = { "","EEwT","ET","TTeF","TF","F(E)","Fi" };
void Pre()
{
    //w 加减，e 乘除
    mp['i'] = 1, mp['w'] = 2, mp['e'] = 3, mp['('] = 4, mp[')'] = 5, mp['#'] = 6;
    mp['E'] = 7, mp['T'] = 8, mp['F'] = 9;
    for (int i = 0;i < 20;i++)
        for (int j = 0;j < 20;j++)
            has[i][j] = { 'a',-1 };

    has[0][1] = { 's',5 }, has[0][4] = { 's',4 }, has[0][mp['E']] = { 'a',1 }, has[0][mp['T']] = { 'a',2 }, has[0][mp['F']] = { 'a',3 };
    has[1][2] = { 's',6 }, has[1][mp['#']] = { 'c',100 };//终止
    has[2][2] = { 'r', 2 }, has[2][3] = { 's',7 }, has[2][5] = { 'r',2 }, has[2][6] = { 'r', 2 };
    has[3][2] = { 'r',4 }, has[3][3] = { 'r',4 }, has[3][5] = { 'r', 4 }, has[3][6] = { 'r', 4 };
    has[4][1] = { 's',5 }, has[4][4] = { 's',4 }, has[4][mp['E']] = { 'a',8 }, has[4][mp['T']] = { 'a',2 }, has[4][mp['F']] = { 'a',3 };
    has[5][2] = { 'r',6 }, has[5][3] = { 'r',6 }, has[5][5] = { 'r',6 }, has[5][6] = { 'r',6 };
    has[6][1] = { 's',5 }, has[6][4] = { 's',4 }, has[6][mp['T']] = { 'a',9 }, has[6][mp['F']] = { 'a',3 };
    has[7][1] = { 's',5 }, has[7][4] = { 's',4 }, has[7][mp['F']] = { 'a',10 };
    has[8][2] = { 's',6 }, has[8][5] = { 's',11 };
    has[9][2] = { 'r',1 }, has[9][3] = { 's',7 }, has[9][5] = { 'r',1 }, has[9][6] = { 'r',1 };
    has[10][2] = { 'r',3 }, has[10][3] = { 'r',3 }, has[10][5] = { 'r',3 }, has[10][6] = { 'r',3 };
    has[11][2] = { 'r',5 }, has[11][3] = { 'r',5 }, has[11][5] = { 'r',5 }, has[11][6] = { 'r',5 };
}
char Jude(int& pos)
{
    while (s[pos] == ' ')pos++;
    //括号
    if (s[pos] == '(' || s[pos] == ')')return s[pos++];
    //数字或字母
    if (s[pos] >= '0' && s[pos] <= '9' || s[pos] >= 'a' && s[pos] <= 'z' || s[pos] >= 'A' && s[pos] <= 'Z')
    {
        while (s[pos] >= '0' && s[pos] <= '9' || s[pos] >= 'a' && s[pos] <= 'z' || s[pos] >= 'A' && s[pos] <= 'Z')pos++;
        //pos++;
        return 'i';
    }
    //加减
    if (s[pos] == '+' || s[pos] == '-')
    {
        pos++;
        return 'w';
    }
    //乘除
    if (s[pos] == '*' || s[pos] == '/')
    {
        pos++;
        return 'e';
    }
    //#号
    else return s[pos++];
}

void Solve()
{
    getline(cin, s);
    s += '#';
    int pos = 0;
    s2.push(0);
    s1.push('#');
flag1:
    char ch = Jude(pos);
flag2:

    int st = s2.top();
    Node tmp = has[st][mp[ch]];
    if (tmp.ch == 's')
    {
        s2.push(tmp.num);
        s1.push(ch);
        goto flag1;
    }
    else if (tmp.ch == 'r')
    {
        string ts = ss[tmp.num];
        int tn = ts.size() - 1;
        while (tn--)
            s1.pop(), s2.pop();
        s1.push(ts[0]);

        int tx = has[s2.top()][mp[s1.top()]].num;
        if (tx != -1)
            s2.push(tx);
        goto flag2;

    }
    else if (tmp.ch == 'c')
    {
        cout << "true" << endl;
        return;
    }
    else
    {
        cout << "false" << endl;
        return;
    }

}

int main()
{
    Pre();
    Solve();
}