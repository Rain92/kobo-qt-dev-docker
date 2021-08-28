#ifndef SCRIBBLEAREA_H
#define SCRIBBLEAREA_H

#include <QDebug>
#include <QMouseEvent>
#include <QPainter>
#include <QWidget>

class ScribbleArea : public QWidget
{
    Q_OBJECT

public:
    ScribbleArea(QWidget *parent = nullptr);

    bool saveImage(const QString &fileName, const char *fileFormat);

public slots:
    void clearImage();

protected:
    void mousePressEvent(QMouseEvent *event) override;
    void mouseMoveEvent(QMouseEvent *event) override;
    void mouseReleaseEvent(QMouseEvent *event) override;
    void paintEvent(QPaintEvent *event) override;
    void resizeEvent(QResizeEvent *event) override;
    void keyPressEvent(QKeyEvent *event) override;

private:
    void drawLineTo(const QPoint &endPoint);
    void resizeImage(QImage *image, const QSize &newSize);

    bool scribbling = false;
    int myPenWidth = 1;
    QColor myPenColor = Qt::black;
    QImage image;
    QPoint lastPoint;
};

#endif
