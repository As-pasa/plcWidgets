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


bool os::writeToFile(QString path, QString string)
{
    QFileInfo a(path);
    QString parentDir= a.absolutePath();
    QString tmpPath= QDir::cleanPath(parentDir+QDir::separator()+"psv_plc_tmp_file");
    QFile tempFile(tmpPath);
    tempFile.open(QIODevice::WriteOnly);
    QTextStream tmpTextStream(&tempFile);
    tmpTextStream<<string;
    tempFile.close();
    QFile aa(path);
    aa.remove();
    QFile::rename(tmpPath,path);
    return true;
}

bool os::readFromFile(QString path, QString &output)
{

    QFile file(path);
    if(!file.exists()){
        return false;

    }
    file.open(QIODevice::ReadOnly);
    QTextStream readStream(&file);
    QString line;
    while(readStream.readLineInto(&line)){
        output.append(line+"\n");
    }
    file.close();
    return true;
}
