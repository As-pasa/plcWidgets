#ifndef KEYBOARDBINDER_H
#define KEYBOARDBINDER_H

#include <QObject>
#include <QMap>
#include <QDebug>
#include <QList>
#include "ikeyboardstate.h"
#include "keyboardconsumer.h"
class KeyboardBinder : public QObject
{
    Q_OBJECT
private:
    QMap<int,IKeyboardState*> m_states;
    QMap<int,QList<KeyboardConsumer*>> m_consumers;
public:
    explicit KeyboardBinder(QObject *parent = nullptr);
    enum Roles{
        Minute=1,
        Hour=2,
        Day=3,
        Month=4,
        Year=5
    };
    Q_ENUM(Roles)
    void addConsumer(int role,KeyboardConsumer* consumer);
    void addState(int role, IKeyboardState* state);

public slots:
    void process(int role,QString ch);
    void clear(int role);
    QString getState(int role);
    void apply(int role);
signals:
    void stateChanged();
};

#endif // KEYBOARDBINDER_H
