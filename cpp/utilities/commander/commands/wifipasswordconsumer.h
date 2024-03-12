#ifndef WIFIPASSWORDCONSUMER_H
#define WIFIPASSWORDCONSUMER_H
#include "cpp/utilities/keyboard/keyboardconsumer.h"
#include "cpp/wifiModel/wifimodel.h"
#include "cpp/utilities/view/screencontroller.h"

class WifiPasswordConsumer:public KeyboardConsumer
{
private:
    ScreenController* m_controller;
    WifiModel* m_model;
public:
    WifiPasswordConsumer(ScreenController* controller,WifiModel* model);

    // KeyboardConsumer interface
public:
    void consume(IKeyboardState *st);
};

#endif // WIFIPASSWORDCONSUMER_H
