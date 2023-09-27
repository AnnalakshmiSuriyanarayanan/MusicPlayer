#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>
#include <QDateTime>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QDate currentDate READ currentDate NOTIFY currentDateChanged)
public:
    explicit System(QObject *parent = nullptr);

    QString currentTime() const;

    QString userName() const;

    QDate currentDate() const;

signals:

    void currentTimeChanged();
    void userNameChanged();

    void currentDateChanged();

public slots:
    void setcurrentTime(const QString &newCurrentTime);
    void currentTimeTimeout();
    void setuserName(const QString &newUserName);


private:
    QString m_currentTime;
    QTimer *m_currentTimeTimer;

    QString m_userName;
    QDate m_currentDate;
};

#endif // SYSTEM_H
