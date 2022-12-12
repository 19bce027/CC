#include <bits/stdc++.h>
#define ANSI_COLOR_RED "\x1b[1;31m"
#define ANSI_COLOR_GREEN "\x1b[1;32m"
#define ANSI_COLOR_RESET "\x1b[0m"
using namespace std;
int main()
{
    int n, i, k, flag = 0;
    char var[10], typ[10], b[10], c;
    cout << "Enter number of variables:";
    cin >> n;
    for (i = 0; i < n; i++)
    {
        char t;
        cout << "var-" << i << ": ";
        cin >> t;
        var[i] = t;
        cout << "type of var-" << i << ": ";
        cin >> t;
        typ[i] = t;
        if (typ[i] == 'f')
            flag = 1;
    }
    cout << "Enter the Expression ending with \';\' :";
    i = 0;
    getchar();
    while ((c = getchar()) != ';')
    {
        b[i] = c;
        i++;
    }
    k = i;

    for (i = 0; i < k; i++)
    {
        if (b[i] == '/')
        {
            flag = 1;
            break;
        }
    }
    for (i = 0; i < n; i++)
    {
        if (b[0] == var[i])
        {
            if (flag == 1)
            {
                if (typ[i] == 'f')
                {
                    cout << ANSI_COLOR_GREEN "The Data-type is correct\n" ANSI_COLOR_RESET;
                    break;
                }
                else
                {
                    cout << ANSI_COLOR_RED "\'" << var[i] << "\'"
                         << " must be a float type.. \n " ANSI_COLOR_RESET;
                            break;
                }
            }
            else
            {
                cout << ANSI_COLOR_GREEN "The Data-type is correct\n" ANSI_COLOR_RESET;
                break;
            }
        }
    }
    return 0;
}