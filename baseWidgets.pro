QT +=  quick widgets #virtualkeyboard

CONFIG += c++11
QT_OPENGL=angle
# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        cpp/models/appmodel.cpp \
        cpp/models/devinfomodel.cpp \
        cpp/models/filemodel.cpp \
        cpp/models/interfacecredentials.cpp \
        cpp/models/netmodel.cpp \
        cpp/models/screenmodel.cpp \
        cpp/models/timechangepackage.cpp \
        cpp/models/timemodel.cpp \
        cpp/models/wificonnection.cpp \
        cpp/models/wifimodel.cpp \
        cpp/systems/debugfilesystem.cpp \
        cpp/systems/debugnetsystem.cpp \
        cpp/systems/debugscreensystem.cpp \
        cpp/systems/debugtimesystem.cpp \
        cpp/systems/debugwifisystem.cpp \
        cpp/systems/ifilesystem.cpp \
        cpp/systems/inetsystem.cpp \
        cpp/systems/iscreensystem.cpp \
        cpp/systems/itimesystem.cpp \
        cpp/systems/iwifisystem.cpp \
        cpp/systems/plcnetsystem.cpp \
        cpp/systems/plctimesystem.cpp \
        cpp/systems/plcwifisystem.cpp \
        cpp/utilities/os.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    cpp/models/appmodel.h \
    cpp/models/devinfomodel.h \
    cpp/models/filemodel.h \
    cpp/models/interfacecredentials.h \
    cpp/models/netmodel.h \
    cpp/models/screenmodel.h \
    cpp/models/timechangepackage.h \
    cpp/models/timemodel.h \
    cpp/models/wificonnection.h \
    cpp/models/wifimodel.h \
    cpp/systems/debugfilesystem.h \
    cpp/systems/debugnetsystem.h \
    cpp/systems/debugscreensystem.h \
    cpp/systems/debugtimesystem.h \
    cpp/systems/debugwifisystem.h \
    cpp/systems/ifilesystem.h \
    cpp/systems/inetsystem.h \
    cpp/systems/iscreensystem.h \
    cpp/systems/itimesystem.h \
    cpp/systems/iwifisystem.h \
    cpp/systems/plcnetsystem.h \
    cpp/systems/plctimesystem.h \
    cpp/systems/plcwifisystem.h \
    cpp/utilities/os.h
