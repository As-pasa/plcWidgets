#ifndef IMPORTCOMMAND_H
#define IMPORTCOMMAND_H
#include "cpp/fileModel/filemodel.h"
#include "cpp/utilities/keyboard/keyboardbinder.h"
#include "cpp/utilities/keyboard/keyboardconsumer.h"
class ImportCommand :public KeyboardConsumer
{
private:
    KeyboardBinder* m_binder;
    ScreenController* m_controller;
    FileModel* m_model;
    QString m_path;
    int m_role;
public:
    ImportCommand(int s_role,KeyboardBinder* binder,
                  ScreenController* controller,
                  FileModel* model,
                  QString path
                  );

    // KeyboardConsumer interface
public:
    void consume(IKeyboardState *st);
};

#endif // IMPORTCOMMAND_H
