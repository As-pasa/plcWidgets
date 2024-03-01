#ifndef SCREENHISTORYMODEL_H
#define SCREENHISTORYMODEL_H

#include <QStack>
class screenHistoryModel
{
private:
    int m_current=-1;
    QStack<int> m_stack;
public:
    screenHistoryModel(int current);
    void add(int);
    int current();
    void back();
    int top();
};

#endif // SCREENHISTORYMODEL_H
