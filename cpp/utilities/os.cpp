#include "os.h"

bool os::System(const QString cmd, bool elevation, QString *pOutput)
{
    QProcess proc;
    proc.setProcessChannelMode(QProcess::MergedChannels);
    elevation = false;
    auto sl = cmd.split(' ');
    if(sl.empty()) return false;
//for pc
//    if(elevation)
//    {
//        //proc.startCommand("sudo -S " + cmd);
//        sl.insert(0, "-S");
//        proc.start("sudo", sl);
//        proc.write(SUDO_PASS"\n");
//    }
//    else
//    {
        //proc.startCommand(cmd);
       // proc.start(sl.first(), sl.mid(1));
  //  }

    //for plc
    proc.start(sl.first(), sl.mid(1));

    if(!proc.waitForFinished(3000))
    {
        if(pOutput) pOutput->operator+=(proc.errorString());
        return false;
    }

    if(pOutput) pOutput->operator+=(proc.readAll());
    return true;
}

bool os::System2(const QString cmd, const QStringList args, bool elevation, QString *pOutput)
{
    QProcess proc;
    proc.setProcessChannelMode(QProcess::MergedChannels);
//for pc
//    if(elevation)
//    {
//        proc.start("sudo", QStringList{ "-S", cmd } + args);
//        proc.write(SUDO_PASS"\n");
//    }
//    else
 //   {
        //proc.startCommand(cmd);
      //  proc.start(cmd, args);
  //  }

         //for plc
     proc.start(cmd, args);

    if(!proc.waitForFinished(3000))
    {
        if(pOutput) pOutput->operator+=(proc.errorString());
        return false;
    }

    if(pOutput) pOutput->operator+=(proc.readAll());
    return true;
}

