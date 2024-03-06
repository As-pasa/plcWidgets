#ifndef KEYBOARDBINDER_H
#define KEYBOARDBINDER_H

#include <QObject>
#include <QMap>
#include <QDebug>
#include <QList>
#include "ikeyboardstate.h"
#include "keyboardconsumer.h"
#include "../view/screencontroller.h"
#include "../keyboard/time/keybinderroles.h"
class KeyboardBinder : public QObject
{
    Q_OBJECT
private:
    QMap<int,IKeyboardState*> m_states;
    QMap<int,QList<KeyboardConsumer*>> m_acceptConsumers;
    QMap<int,QList<KeyboardConsumer*>> m_cancelConsumers;
    ScreenController* m_controller;
public:
    explicit KeyboardBinder(ScreenController* controller,  QObject *parent = nullptr);
    void addConsumer(int role,KeyboardConsumer* consumer);
    void addState(int role, IKeyboardState* state);

public slots:
    void process(int role,QString ch);
    void clear(int role);
    QString getState(int role);
    bool apply(int role);
signals:
    void stateChanged();
};

#endif // KEYBOARDBINDER_H
