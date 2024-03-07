#ifndef EXPORTCOMMAND_H
#define EXPORTCOMMAND_H

#include "cpp/utilities/keyboard/keyboardbinder.h"
#include "cpp/fileModel/filemodel.h"
class ExportCommand:public KeyboardConsumer
{
private:
    KeyboardBinder* m_binder;
    ScreenController* m_controller;
    FileModel* m_model;
    QString m_path;
    int m_role;
public:
    ExportCommand(int s_role,KeyboardBinder* binder, ScreenController *controller, FileModel *model,QString path);

    // KeyboardConsumer interface
public:
    void consume(IKeyboardState *st);
};

#endif // EXPORTCOMMAND_H
