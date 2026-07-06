#include<bits/stdc++.h>
using namespace std;
int k = 0;
int p = 0;
int i = 0;
int c = 0;

map<string, int>K, P, I, C1,C2,CT,ST;
string s;int position=0;
void pre()
{
    K["int"] = ++k;
    K["void"] = ++k;
    K["break"] = ++k;
    K["float"] = ++k;
    K["while"] = ++k;
    K["do"] = ++k;
    K["struct"] = ++k;
    K["const"] = ++k;
    K["case"] = ++k;
    K["for"] = ++k;
    K["return"] = ++k;
    K["if"] = ++k;
    K["default"] = ++k;
    K["else"] = ++k;

    P["-"] = ++p;
    P["/"] = ++p;
    P["("] = ++p;
    P[")"] = ++p;
    P["=="] = ++p;
    P["<="] = ++p;
    P["<"] = ++p;
    P["+"] = ++p;
    P["*"] = ++p;
    P[">"] = ++p;
    P["="] = ++p;
    P[","] = ++p;
    P[";"] = ++p;
    P["++"] = ++p;
    P["{"] = ++p;
    P["}"] = ++p;
}
char ch;
bool IsLetter(char ch)   //英文字母
{
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'z');
}
bool IsNumber(char ch) //数字
{
    return ch >= '0' && ch <= '9';
}

int  ReadNumber(string&token)   //识别算数常数
{
    int status = 1;
    while (1) {
        if (ch == '#') {
            if (status == 2) return 0;
            else if (status == 4 || status == 7) return 1;
            else return -1;
        }
        if (status == 1) {
            if (IsNumber(ch)) {
                token += ch, ch = s[position++];
                status = 2;
            }
            else return -1;
        }
        else if (status == 2) {
            if (IsNumber(ch)) {
                token += ch, ch = s[position++];
            }
            else if (ch == '.') {
                token += ch, ch = s[position++];
                status = 3;
            }
            else if (ch == 'e') {
                token += ch, ch = s[position++];
                status = 5;
            }
            else if (ch == 'x') {
                if (token.size() == 1) {
                    token += ch, ch = s[position++];
                    status = 8;
                }
                else return -1;
            }
            else return 0;
        }
        else if (status == 3) {
            if (IsNumber(ch)) {
                token += ch, ch = s[position++];
                status = 4;
            }
            else return -1;
        }
        else if (status == 4) {
            if (IsNumber(ch)) {
                token += ch, ch = s[position++];
            }
            else if (ch == 'e') {
                token += ch, ch = s[position++];
                status = 5;
            }
            else return 1;
        }
        else if (status == 5) {
            if (IsNumber(ch)) {
                token += ch, ch = s[position++];
                status = 7;
            }
            else if (ch == '+' || ch == '-') {
                token += ch, ch = s[position++];
                status = 6;
            }
            else return -1;
        }
        else if (status == 6) {
            if (IsNumber(ch)) {
                token += ch, ch = s[position++];
                status = 7;
            }
            else return -1;
        }
        else if (status == 7) {
            if (IsNumber(ch)) {
                token += ch, ch = s[position++];
            }
            else return 1;
        }
        else if (status == 8) {
            if (IsNumber(ch)) {
                token += ch, ch = s[position++];
                status = 9;
            }
            else return -1;
        }
        else if (status == 9) {
            if (IsNumber(ch)) {
                token += ch, ch = s[position++];
            }
            else if (ch >= 'A' && ch <= 'F') {
                token += ch, ch = s[position++];
            }
            else if (ch >= 'a' && ch <= 'f') {
                token += ch, ch = s[position++];
            }
            else {
                long long a = 0;
                for (int i = 2; i < (int)token.size(); i++)
                    if (IsNumber(token[i])) a = a * 16 + token[i] - '0';
                    else if (token[i] >= 'A' && token[i] <= 'Z') a = a * 16 + 10 + token[i] - 'A';
                    else a = a * 16 + 10 + token[i] - 'a';
                token = to_string(a);
                return 0;
            }
        }
    }

    
}

int ReadToken(string& token) {
    token.clear();
    while (ch != '#' && ch == ' ') ch = s[position++];
    if (ch == '#') return 0;
    if (IsLetter(ch)) { // 关键字、标识符
        while (IsLetter(ch) || IsNumber(ch)) {
            token += ch, ch = s[position++];
            if (ch == '#') return 1;
        }
        return 1;
    }
    else if (IsNumber(ch)) { // 数字
        int t = ReadNumber(token);
        if (t == -1) return -1;
        return 2 + t;
    }
    else if (ch == '\'') { // 字符常量
        ch = s[position++];
        if (ch == '#') return -1;
        token += ch, ch = s[position++];
        if (ch != '\'') return -1;
        ch = s[position++];
        return 4;
    }
    else if (ch == '\"') { // 字符串常量
        ch = s[position++];
        while (ch != '\"') {
            if (ch == '#') return -1;
            token += ch, ch = s[position++];
        }
        ch = s[position++];
        return 5;
    }
    else { // 界符
        token += ch, ch = s[position++];
        if (ch == '#') return 6;
        if (P[token+ch])
            token += ch, ch = s[position++];
        return 6;
    }
}

string a = "";
vector<string>i1, c1, c2, ct, st;
int c02, ct1, st1;
void first()
{
    ostringstream out;
    pre();
    int t;
    getline(cin, s);
    s += '#';
    string token;

    out << "Token :";
    
    while (t=ReadToken(token))
    {

        if (token.size() == 0)break;
        if (t == -1)
        {
            cout << "ERROR" << endl;
            return;
        }
        
        if (t == 1) //关键字，标识符
        {
            if (K[token] != 0)//出现过的关键字
                out << "(K " << K[token] << ")";
            else if (I[token] != 0)//出现过的标识符
                out << "(I " << I[token] << ")";
            else    //未出现的标识符
            {
                I[token] = ++i;
                i1.push_back(token);
                out << "(I " << I[token] << ")";
            }
        }

        else if (t == 2)//整数
        {
            if (C1[token] != 0)//出现过的整数
                out << "(C " << C1[token] << ")";
            else //未出现的整数
            {
                C1[token] = ++c;
                c1.push_back(token);
                out << "(C " << C1[token] << ")";
            }
        }

        else if (t == 3)//浮点数
        {
            if (C2[token] != 0)//出现过的浮点数
                out << "(C2 " << C2[token] << ")";
            else
            {
                C2[token] = ++c02;
                c2.push_back(token);
                out << "(C2 " << C2[token] << ")";
            }
        }

        else if (t == 4)//字符
        {
            if (CT[token] != 0)//出现过
                out << "(CT " << CT[token] << ")";
            else
            {
                CT[token] = ++ct1;
                ct.push_back(token);
                out << "(CT " << CT[token] << ")";
            }

        }

        else if (t == 5)
        {
            if (ST[token] != 0)//出现过
                out << "(ST " << ST[token] << ")";
            else
            {
                ST[token] = ++st1;
                st.push_back(token);
                out << "(ST " << ST[token] << ")";
            }
        }
        else if(P[token])//界符
            out << "(P " << P[token] << ")";
        if (ch == '#')break;
    }

    out << "\nI :";
    for(int j=0;j<i1.size();j++)
    {
      out<<i1[j];
      if (j!=i1.size()-1)
      out <<" ";
    }
    
    out << "\nC :";
    for(int j=0;j<c1.size();j++)
    {
      out<<c1[j];
      if(j!=c1.size()-1) out<<" ";
    }


    cout << out.str();
}

int main()
{
    first();
}