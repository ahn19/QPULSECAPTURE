#include "qsettingsdialog.h"
#include "ui_qsettingsdialog.h"

#define TIMER_INTERVAL 500

QSettingsDialog::QSettingsDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::QSettingsDialog)
{
    ui->setupUi(this);
}

QSettingsDialog::~QSettingsDialog()
{
    delete ui;
}

//--------------------------------------------
quint32 get_power_of_two(quint16 power)
{
    quint32 result = 1;
    while(power > 0)
    {
        result <<= 1;
        power--;
    }
    return result;
}
//--------------------------------------------


void QSettingsDialog::on_ButtonAccept_clicked()
{
    this->accept();
}

void QSettingsDialog::on_ButtonCancel_clicked()
{
    this->reject();
}

void QSettingsDialog::on_dialDatalength_valueChanged(int value)
{
    ui->lineEditDatalength->setText(QString::number(get_power_of_two(value)));
    ui->dialBufferlength->setMaximum(value);
}

void QSettingsDialog::on_dialBufferlength_valueChanged(int value)
{
    ui->lineEditBufferlength->setText(QString::number(get_power_of_two(value)));
}

void QSettingsDialog::on_ButtonCascade_clicked()
{
    QString str = QFileDialog::getOpenFileName(this, tr("Open File"), "/haarcascades", tr("Cascade (*.xml)"));
    if(str.length() != 0)
    {
        ui->lineEditCascade->setText(str);
    }
}

void QSettingsDialog::on_pushButtonRecord_clicked()
{
    QString str = QFileDialog::getSaveFileName(this, tr("Save File"), "/Records/Record.txt", tr("Text file (*.txt)"));
    if(!str.isNull())
    {
        ui->lineEditRecord->setText(str);
    }
}

void QSettingsDialog::on_ButtonDefault_clicked()
{
    ui->dialDatalength->setValue(8);
    ui->dialBufferlength->setValue(8);
    ui->checkBoxColor->setChecked(false);
    ui->checkBoxRecord->setChecked(false);
    ui->checkBoxCascade->setChecked(false);
    ui->lineEditCascade->setText("haarcascades/haarcascade_frontalface_alt.xml");
    ui->lineEditRecord->setText("Records/Record.txt");
    ui->checkBoxVideoFile->setChecked(false);
    ui->lineEditVideoFile->setText("Video/Sample.avi");
    ui->checkBoxFFT->setChecked(true);
    ui->horizontalSliderTimer->setValue(2); //
}

void QSettingsDialog::on_pushButtonVideoFile_clicked()
{
    QString str = QFileDialog::getOpenFileName(this, tr("Open file"), "/Video", tr("Video files(*.avi *.mp4 *.wmv)"));
    if(!str.isNull())
    {
        ui->lineEditVideoFile->setText(str);
    }
}

bool QSettingsDialog::get_flagColor() const
{
    return ui->checkBoxColor->isChecked();
}

bool QSettingsDialog::get_flagPCA() const
{
    return ui->checkBoxPCA->isChecked();
}

bool QSettingsDialog::get_flagCascade() const
{
    return ui->checkBoxCascade->isChecked();
}

bool QSettingsDialog::get_flagRecord() const
{
    return ui->checkBoxRecord->isChecked();
}

bool QSettingsDialog::get_flagVideoFile() const
{
    return ui->checkBoxVideoFile->isChecked();
}

QString QSettingsDialog::get_stringCascade() const
{
    return ui->lineEditCascade->text();
}

QString QSettingsDialog::get_stringRecord() const
{
    return ui->lineEditRecord->text();
}

QString QSettingsDialog::get_stringVideoFile() const
{
    return ui->lineEditVideoFile->text();
}

quint32 QSettingsDialog::get_datalength() const
{
    return get_power_of_two(ui->dialDatalength->value());
}

quint32 QSettingsDialog::get_bufferlength() const
{
    return get_power_of_two(ui->dialBufferlength->value());
}

void QSettingsDialog::on_checkBoxVideoFile_stateChanged(int arg1)
{
    switch(arg1)
    {
        case Qt::Checked:
            ui->groupBoxVideoFile->setEnabled(true);
            break;
        case Qt::Unchecked:
            ui->groupBoxVideoFile->setEnabled(false);
            break;
    }
}

void QSettingsDialog::on_checkBoxRecord_stateChanged(int arg1)
{
    switch(arg1)
    {
        case Qt::Checked:
            ui->groupBoxRecord->setEnabled(true);
            break;
        case Qt::Unchecked:
            ui->groupBoxRecord->setEnabled(false);
            break;
    }
}

void QSettingsDialog::on_checkBoxCascade_stateChanged(int arg1)
{
    switch(arg1)
    {
        case Qt::Checked:
            ui->groupBoxCascade->setEnabled(true);
            break;
        case Qt::Unchecked:
            ui->groupBoxCascade->setEnabled(false);
            break;
    }
}

void QSettingsDialog::on_checkBoxColor_stateChanged(int arg1)
{
    switch(arg1)
    {
        case Qt::Checked:
            ui->checkBoxPCA->setEnabled(true);
            break;
        case Qt::Unchecked:
            ui->checkBoxPCA->setChecked(false);
            ui->checkBoxPCA->setEnabled(false);
            break;

    }
}

void QSettingsDialog::on_horizontalSliderTimer_valueChanged(int value)
{
    ui->lineEditTimer->setText(QString::number(value * TIMER_INTERVAL) + " ms");
}

int QSettingsDialog::get_timerValue() const
{
    return (ui->horizontalSliderTimer->value() * TIMER_INTERVAL);
}

bool QSettingsDialog::get_FFTflag() const
{
    return ui->checkBoxFFT->isChecked();
}
