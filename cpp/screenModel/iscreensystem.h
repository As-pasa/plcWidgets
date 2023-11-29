#ifndef ISCREENSYSTEM_H
#define ISCREENSYSTEM_H


class IScreenSystem
{
public:
    IScreenSystem();
    virtual void setScreenBrightness(int value)=0;
    virtual int getCurrentScreenBrightness()=0;
    virtual void calibrate()=0;

};

#endif // ISCREENSYSTEM_H
