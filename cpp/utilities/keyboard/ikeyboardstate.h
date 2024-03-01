#ifndef IKEYBOARDSTATE_H
#define IKEYBOARDSTATE_H

#include <QString>
#include <QList>
class IKeyboardState
{
private:
    QList<QString> specialSymbols{"back"};

    QString m_state;
    virtual bool validate(QString nstring)=0;
    QString processSpecial(QString old,QString addition);
public:

    QString getState();
    void clearState();
    bool add(QString ch);
    IKeyboardState();
    virtual ~IKeyboardState();
};

#endif // IKEYBOARDSTATE_H
