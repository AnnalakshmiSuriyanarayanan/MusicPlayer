#include "system.h"
//#include <QDateTime>


System::System(QObject *parent)
    : QObject{parent},m_userName("Annalakshmi S")
{
    m_currentTimeTimer= new QTimer(this);
    m_currentTimeTimer->setInterval(500);
    //m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer,&QTimer::timeout,this,&System::currentTimeTimeout);

    currentTimeTimeout();
    m_currentDate = QDate::currentDate();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setcurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void System::currentTimeTimeout()
{
    QDateTime dateTime;
    QString currentTime =dateTime.currentDateTime().toString("hh:mm ap");
    //qDebug()<<currentTime;
    setcurrentTime(currentTime);
    m_currentTimeTimer->start();
}

QString System::userName() const
{
    return m_userName;
}

void System::setuserName(const QString &newUserName)
{
    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

QDate System::currentDate() const
{
    return m_currentDate;
}
