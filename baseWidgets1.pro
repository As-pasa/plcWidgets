QT += widgets quick

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
    cpp/devinfoModel/devinfomodel.cpp \
    cpp/devinfoModel/plcdevicesystem.cpp \
    cpp/fileModel/debugfilesystem.cpp \
    cpp/fileModel/filemodel.cpp \
    cpp/fileModel/filesystemtimestamper.cpp \
    cpp/fileModel/ifilesystem.cpp \
    cpp/fileModel/plcfilesystem.cpp \
    cpp/fileModel/savedeviceentry.cpp \
    cpp/passwordModel/debugpasswordsysteml.cpp \
    cpp/passwordModel/ipasswordsystem.cpp \
    cpp/passwordModel/passwordmodel.cpp \
    cpp/passwordModel/plcpaswordsystem.cpp \
    cpp/pingModel/debugpingsystem.cpp \
    cpp/pingModel/ipingsystem.cpp \
    cpp/pingModel/pingmodel.cpp \
    cpp/pingModel/plcpingsystem.cpp \
    cpp/screenModel/plcscreensystem.cpp \
    cpp/timeModel/debugtimesystem.cpp \
    cpp/timeModel/itimesystem.cpp \
    cpp/timeModel/plctimesystem.cpp \
    cpp/timeModel/timechangepackage.cpp \
    cpp/timeModel/timemodel.cpp \
    cpp/utilities/confirmationDisplayer/commandconfirmator.cpp \
    cpp/utilities/confirmationDisplayer/confirmatorstate.cpp \
    cpp/utilities/messagedisplayer.cpp \
    cpp/utilities/mylogger.cpp \
    cpp/utilities/view/headerbarmodel.cpp \
    cpp/utilities/view/screencontroller.cpp \
    cpp/utilities/view/screenview.cpp \
    cpp/wifiModel/debugwifisystem.cpp \
    cpp/wifiModel/iwifisystem.cpp \
    cpp/wifiModel/plcwifisystem.cpp \
    cpp/wifiModel/wificonnection.cpp \
    cpp/wifiModel/wifimodel.cpp \
    cpp/netModel/debugnetsystem.cpp \
    cpp/netModel/inetsystem.cpp \
    cpp/netModel/interfacecredential.cpp \
    cpp/netModel/netmodel.cpp \
    cpp/netModel/plcnetsystem.cpp \
    cpp/screenModel/debugscreensystem.cpp \
    cpp/screenModel/iscreensystem.cpp \
    cpp/screenModel/screenmodel.cpp \
    cpp/utilities/os.cpp \
    main.cpp\


RESOURCES += qml.qrc \
    translations.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    cpp/devinfoModel/devinfomodel.h \
    cpp/devinfoModel/plcdevicesystem.h \
    cpp/fileModel/debugfilesystem.h \
    cpp/fileModel/filemodel.h \
    cpp/fileModel/filesystemtimestamper.h \
    cpp/fileModel/ifilesystem.h \
    cpp/fileModel/plcfilesystem.h \
    cpp/fileModel/savedeviceentry.h \
    cpp/passwordModel/debugpasswordsysteml.h \
    cpp/passwordModel/ipasswordsystem.h \
    cpp/passwordModel/passwordmodel.h \
    cpp/passwordModel/plcpaswordsystem.h \
    cpp/pingModel/debugpingsystem.h \
    cpp/pingModel/ipingsystem.h \
    cpp/pingModel/pingmodel.h \
    cpp/pingModel/plcpingsystem.h \
    cpp/screenModel/plcscreensystem.h \
    cpp/timeModel/debugtimesystem.h \
    cpp/timeModel/itimesystem.h \
    cpp/timeModel/plctimesystem.h \
    cpp/timeModel/timechangepackage.h \
    cpp/timeModel/timemodel.h \
    cpp/utilities/confirmationDisplayer/commandconfirmator.h \
    cpp/utilities/messagedisplayer.h \
    cpp/utilities/mylogger.h \
    cpp/utilities/view/headerbarmodel.h \
    cpp/utilities/view/screencontroller.h \
    cpp/utilities/view/screenview.h \
    cpp/wifiModel/debugwifisystem.h \
    cpp/wifiModel/iwifisystem.h \
    cpp/wifiModel/plcwifisystem.h \
    cpp/wifiModel/wificonnection.h \
    cpp/wifiModel/wifimodel.h \
    cpp/netModel/debugnetsystem.h \
    cpp/netModel/inetsystem.h \
    cpp/netModel/interfacecredential.h \
    cpp/netModel/netmodel.h \
    cpp/netModel/plcnetsystem.h \
    cpp/screenModel/debugscreensystem.h \
    cpp/screenModel/iscreensystem.h \
    cpp/screenModel/screenmodel.h \
    cpp/utilities/os.h\