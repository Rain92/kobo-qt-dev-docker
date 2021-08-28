#include "mainwindow.h"

#include "scribblearea.h"

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent), scribbleArea(new ScribbleArea(this))
{
    setCentralWidget(scribbleArea);

    createActions();
    createMenus();

    qApp->installEventFilter(this);
}

void MainWindow::closeEvent(QCloseEvent *event)
{
    event->accept();
}

bool MainWindow::eventFilter(QObject *obj, QEvent *event)
{
    if (event->type() == QEvent::KeyPress || event->type() == QEvent::KeyRelease)
    {
        QKeyEvent *keyEvent = static_cast<QKeyEvent *>(event);

        if (keyEvent->key() == Qt::Key_PowerOff || keyEvent->key() == Qt::Key_PowerDown)
        {
            if (keyEvent->type() == QEvent::KeyPress)
                qDebug() << "Powerbutton Pressed!";
            this->close();

            return true;
        }
    }

    return false;
}

void MainWindow::save()
{
    QAction *action = qobject_cast<QAction *>(sender());
    QByteArray fileFormat = action->data().toByteArray();
    saveFile(fileFormat);
}

void MainWindow::about()
{
    QMessageBox::about(this, tr("About Scribble"), "This is a minimal scribble app sample.");
}

void MainWindow::createActions()
{
    const QList<QByteArray> imageFormats = QImageWriter::supportedImageFormats();
    for (const QByteArray &format : imageFormats)
    {
        QString text = tr("%1...").arg(QString::fromLatin1(format).toUpper());

        QAction *action = new QAction(text, this);
        action->setData(format);
        connect(action, &QAction::triggered, this, &MainWindow::save);
        saveAsActs.append(action);
    }

    exitAct = new QAction(tr("E&xit"), this);
    exitAct->setShortcuts(QKeySequence::Quit);
    connect(exitAct, &QAction::triggered, this, &MainWindow::close);

    clearScreenAct = new QAction(tr("&Clear Screen"), this);
    clearScreenAct->setShortcut(tr("Ctrl+L"));
    connect(clearScreenAct, &QAction::triggered, scribbleArea, &ScribbleArea::clearImage);

    aboutAct = new QAction(tr("&About"), this);
    connect(aboutAct, &QAction::triggered, this, &MainWindow::about);
}

void MainWindow::createMenus()
{
    saveAsMenu = new QMenu(tr("&Save As"), this);
    for (QAction *action : qAsConst(saveAsActs))
        saveAsMenu->addAction(action);

    fileMenu = new QMenu(tr("&File"), this);
    fileMenu->addMenu(saveAsMenu);
    fileMenu->addSeparator();
    fileMenu->addAction(exitAct);

    optionMenu = new QMenu(tr("&Options"), this);
    optionMenu->addAction(clearScreenAct);

    helpMenu = new QMenu(tr("&Help"), this);
    helpMenu->addAction(aboutAct);

    menuBar()->addMenu(fileMenu);
    menuBar()->addMenu(optionMenu);
    menuBar()->addMenu(helpMenu);
}

bool MainWindow::saveFile(const QByteArray &fileFormat)
{
    QString initialPath = QDir::currentPath() + "/untitled." + fileFormat;

    QString fileName = QFileDialog::getSaveFileName(this, tr("Save As"), initialPath,
                                                    tr("%1 Files (*.%2);;All Files (*)")
                                                        .arg(QString::fromLatin1(fileFormat.toUpper()))
                                                        .arg(QString::fromLatin1(fileFormat)));
    if (fileName.isEmpty())
        return false;
    return scribbleArea->saveImage(fileName, fileFormat.constData());
}
