using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;
using System.Windows.Forms.DataVisualization.Charting;

namespace driver_PM_software
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            ChartLoad();
        }

        void ChartLoad()
        {
            var chart = chart1.ChartAreas[0];
            //chart.AxisX.IntervalType = System.Windows.Forms.DataVisualization.Charting.DateTimeIntervalType.Number;
            chart.AxisX.LabelStyle.Format = "";
            chart.AxisY.LabelStyle.Format = "";
            chart1.ChartAreas[0].AxisX.Title = "Medicion";
            chart1.ChartAreas[0].AxisY.Title = "Counts";
            chart.AxisX.LabelStyle.IsEndLabelVisible = false;
            chart.AxisY.LabelStyle.IsEndLabelVisible = false;
            chart.AxisX.Minimum = 0;
            chart.AxisY.Minimum = 0;
            //chart.AxisX.Interval = 0.5;
            //chart.AxisY.Interval = 10;
            chart1.Series[0].IsVisibleInLegend = false;

            chart1.Series.Add("Counts1");
            chart1.Series["Counts1"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["Counts1"].Color = Color.Red;

            chart1.Series.Add("Counts2");
            chart1.Series["Counts2"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["Counts2"].Color = Color.Green;

            chart1.Series.Add("Counts3");
            chart1.Series["Counts3"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["Counts3"].Color = Color.Blue;

            chart1.Series.Add("Counts4");
            chart1.Series["Counts4"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["Counts4"].Color = Color.Black;

            /*comento para tener solo 4 APDs
            chart1.Series.Add("Counts5");
            chart1.Series["Counts5"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["Counts5"].Color = Color.Gray;

            chart1.Series.Add("Counts6");
            chart1.Series["Counts6"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["Counts6"].Color = Color.DarkOrange;

            chart1.Series.Add("Counts7");
            chart1.Series["Counts7"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["Counts7"].Color = Color.DarkOrchid;*/

            chart1.Series.Add("APD1");
            chart1.Series["APD1"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["APD1"].Color = Color.Red;
            labelAPD1.ForeColor = Color.Red;
            chart1.Series["APD1"].MarkerSize = 3;

            chart1.Series.Add("APD2");
            chart1.Series["APD2"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["APD2"].Color = Color.Green;
            labelAPD2.ForeColor = Color.Green;
            chart1.Series["APD2"].MarkerSize = 3;

            chart1.Series.Add("APD3");
            chart1.Series["APD3"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["APD3"].Color = Color.Blue;
            labelAPD3.ForeColor = Color.Blue;
            chart1.Series["APD3"].MarkerSize = 3;

            chart1.Series.Add("APD4");
            chart1.Series["APD4"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["APD4"].Color = Color.Black;
            labelAPD4.ForeColor = Color.Black;
            chart1.Series["APD4"].MarkerSize = 3;

            /*comento para tener solo 4 APDs
            chart1.Series.Add("APD5");
            chart1.Series["APD5"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["APD5"].Color = Color.Gray;
            labelAPD5.ForeColor = Color.Gray;
            chart1.Series["APD5"].MarkerSize = 3;

            chart1.Series.Add("APD6");
            chart1.Series["APD6"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["APD6"].Color = Color.DarkOrange;
            labelAPD6.ForeColor = Color.DarkOrange;
            chart1.Series["APD6"].MarkerSize = 3;

            chart1.Series.Add("APD7");
            chart1.Series["APD7"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart1.Series["APD7"].Color = Color.DarkOrchid;
            labelAPD7.ForeColor = Color.DarkOrchid;
            chart1.Series["APD7"].MarkerSize = 3;*/


            var chart2 = chart2Voltage.ChartAreas[0];
            //chart.AxisX.IntervalType = System.Windows.Forms.DataVisualization.Charting.DateTimeIntervalType.Number;
            chart2.AxisX.LabelStyle.Format = "";
            chart2.AxisY.LabelStyle.Format = "";
            chart2Voltage.ChartAreas[0].AxisX.Title = "Medicion";
            chart2Voltage.ChartAreas[0].AxisY.Title = "Voltage";
            chart2.AxisX.LabelStyle.IsEndLabelVisible = false;
            chart2.AxisY.LabelStyle.IsEndLabelVisible = false;
            chart2.AxisX.Minimum = 0;
            chart2.AxisY.Minimum = 0;
            //chart.AxisX.Interval = 0.5;
            //chart.AxisY.Interval = 10;
            chart2Voltage.Series[0].IsVisibleInLegend = false;

            chart2Voltage.Series.Add("V1");
            chart2Voltage.Series["V1"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart2Voltage.Series["V1"].Color = Color.Red;

            chart2Voltage.Series.Add("V2");
            chart2Voltage.Series["V2"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart2Voltage.Series["V2"].Color = Color.Green;

            chart2Voltage.Series.Add("V3");
            chart2Voltage.Series["V3"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart2Voltage.Series["V3"].Color = Color.Blue;

            chart2Voltage.Series.Add("V4");
            chart2Voltage.Series["V4"].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            chart2Voltage.Series["V4"].Color = Color.Black;

            var chart3 = chart3BARS.ChartAreas[0];
            //chart.AxisX.IntervalType = System.Windows.Forms.DataVisualization.Charting.DateTimeIntervalType.Number;
            /*chart3BARS.AxisX.LabelStyle.Format = "";
            chart3BARS.
            chart3BARS.AxisY.LabelStyle.Format = "";*/
            chart3BARS.ChartAreas[0].AxisX.Title = "BS output";
            chart3BARS.ChartAreas[0].AxisY.Title = "Prob";
            /*chart3BARS.AxisX.LabelStyle.IsEndLabelVisible = false;
            chart3BARS.AxisY.LabelStyle.IsEndLabelVisible = false;
            chart3BARS.AxisX.Minimum = 0;
            chart3BARS.AxisY.Minimum = 0;
            //chart.AxisX.Interval = 0.5;
            //chart.AxisY.Interval = 10;*/
            chart3BARS.Series[0].IsVisibleInLegend = false;
            chart3BARS.Series.Add("APD");
            chart3BARS.Series.Add("Theory");
            chart3.AxisY.Maximum = 1.0;
            chart3.AxisY.Minimum = 0;
            chart3.AxisX.Maximum = 5;
            chart3.AxisX.Minimum = 0;

        }

        private async void SoftBlink(Control ctrl, Color c1, Color c2, short CycleTime_ms, bool BkClr)
        {
            var sw = new Stopwatch(); sw.Start();
            short halfCycle = (short)Math.Round(CycleTime_ms * 0.5);
            while (true)
            {
                await Task.Delay(1);
                var n = sw.ElapsedMilliseconds % CycleTime_ms;
                var per = (double)Math.Abs(n - halfCycle) / halfCycle;
                var red = (short)Math.Round((c2.R - c1.R) * per) + c1.R;
                var grn = (short)Math.Round((c2.G - c1.G) * per) + c1.G;
                var blw = (short)Math.Round((c2.B - c1.B) * per) + c1.B;
                var clr = Color.FromArgb(red, grn, blw);
                if (BkClr) ctrl.BackColor = clr; else ctrl.ForeColor = clr;
            }
        }

        ////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////DEFINICIONES///////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////

        Utilidades objetoUtilidades = new Utilidades();
        IO_Propiedades ObjetoIOP = new IO_Propiedades();
        convertir ObjetoConvertir = new convertir();

        byte[] byteRx = new byte[1];
        int controlRx = 0;
        ListBox Listbox_identificadorPalabra = new ListBox();
        string RxString_txt = "";
        byte[] VectorByte3 = new byte[120];
        int indexVectorByte = 0;
        public int[] Vect_Vout_APD = new int[50];
        public int[] Vect_NexysA7_Vout = new int[50];
        public int[] Vect_NexysA7_APD = new int[50];
        public string direccion_guardar2 = "";
        public string foldermedicion = "Mediciones";
        public int enPM1_reg = 0;
        public int enPM2_reg = 0;
        public int enPM3_reg = 0;
        public int enPM4_reg = 0;
        public int enPM_reg = 0;
        public double fidelity = 1;
        int MUBS = 2;
        public double[,] states_prob = new double[4, 5] {   {1,0,0,0,0.25},
                                                            {0,1,0,0,0.25},
                                                            {0,0,1,0,0.25},
                                                            {0,0,0,1,0.25},
        };
        public double max_fidelity = 0;



        private void cOMToolStripMenuItem_MouseEnter(object sender, EventArgs e)
        {
            conectarToolStripMenuItem.Enabled = objetoUtilidades.VerPuertosUSB(20, toolStripComboBox_COMPORTS);
        }


        private void conectarToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            serialPort_FPGA.PortName = toolStripComboBox_COMPORTS.Text;
            serialPort_FPGA.Open();
            serialPort_FPGA.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(RecepcionSerial);
            toolStripStatusLabel1.Text = "Conectado a " + serialPort_FPGA.PortName;
            //cargo la configuracion anterior
            numericUpDown1.Enabled = true;
            numericUpDown2.Enabled = true;
            numericUpDown3.Enabled = true;
            numericUpDown4.Enabled = true;
            numericUpDown6.Enabled = true;
            numericUpDown7.Enabled = true;
            numericUpDown5.Enabled = true;
            numericUpDown8.Enabled = true;
            numericUpDown9.Enabled = true;
            checkBoxPM1.Enabled = true;
            checkBoxPM2.Enabled = true;
            checkBoxPM3.Enabled = true;
            checkBoxPM4.Enabled = true;
            enPM_reg = Convert.ToInt32(ObjetoIOP.matrixPropiedades[25, 1]);
            enPM4_reg = enPM_reg / 8;
            enPM3_reg = (enPM_reg - 8 * (enPM4_reg))/4;
            enPM2_reg = (enPM_reg - 8 * (enPM4_reg) - 4 * (enPM3_reg))/2;
            enPM1_reg = (enPM_reg - 8 * (enPM4_reg) - 4 * (enPM3_reg) - 2 * (enPM2_reg));
            checkBoxPM1.Checked = Convert.ToBoolean(enPM1_reg);
            checkBoxPM2.Checked = Convert.ToBoolean(enPM2_reg);
            checkBoxPM3.Checked = Convert.ToBoolean(enPM3_reg);
            checkBoxPM4.Checked = Convert.ToBoolean(enPM4_reg);
            numericUpDown10.Enabled = true;
            numericUpDown11.Enabled = true;
            numericUpDown12.Enabled = true;
            numericUpDown13.Enabled = true;
            numericUpDown14.Enabled = true;
            numericUpDown15.Enabled = true;
            numericUpDown18.Enabled = true;
            numericUpDown19.Enabled = true;
            numericUpDown20.Enabled = true;
            numericUpDown17.Enabled = true;
            numericUpDown16.Enabled = true;
            numericUpDown22.Enabled = true;
            numericUpDown21.Enabled = true;
            numericUpDown27.Enabled = true;
            numericUpDown26.Enabled = true;
            numericUpDown25.Enabled = true;
            numericUpDown24.Enabled = true;
            numericUpDown28.Enabled = true;
            numericUpDown29.Enabled = true;
            numericUpDown30.Enabled = true;
            numericUpDown31.Enabled = true;
            numericUpDown32.Enabled = true;
            numericUpDown34.Enabled = true;
            numericUpDown33.Enabled = true;
            numericUpDown36.Enabled = true;
            numericUpDown35.Enabled = true;
            numericUpDown40.Enabled = true;
            numericUpDown60.Enabled = true;
            numericUpDown61.Enabled = true;
            numericUpDown62.Enabled = true;
            numericUpDown63.Enabled = true;
            numericUpDown64.Enabled = true;
            numericUpDown65.Enabled = true; 
            radioButton15.Enabled = true;
            radioButton17.Enabled = true;
            radioButton19.Enabled = true;
            radioButton20.Enabled = true;
            radioButton18.Enabled = true;
            //numericUpDown39.Enabled = true;
            numericUpDown38.Enabled = true;
            button1.Enabled = true;
            button2.Enabled = true;
            checkBox4.Enabled = true;
            numericUpDown43.Enabled = true;
            numericUpDown42.Enabled = true;
            numericUpDown41.Enabled = true;
            numericUpDown37.Enabled = true;
            checkBox1.Enabled = true;
            numericUpDown44.Enabled = true;
            numericUpDown45.Enabled = true;
            numericUpDown46.Enabled = true;
            numericUpDown47.Enabled = true;
            numericUpDown51.Enabled = true;
            numericUpDown50.Enabled = true;
            numericUpDown49.Enabled = true;
            numericUpDown48.Enabled = true;
            numericUpDown55.Enabled = true;
            numericUpDown54.Enabled = true;
            numericUpDown53.Enabled = true;
            numericUpDown52.Enabled = true;
            numericUpDown59.Enabled = true;
            numericUpDown58.Enabled = true;
            numericUpDown57.Enabled = true;
            numericUpDown56.Enabled = true;
            checkBox2.Enabled = true;
            if (serialPort_FPGA.IsOpen)
            {
                foreach (Control ctrl in this.Controls)
                {

                    string ctrl_Name = ctrl.Name;
                    for (int index = 0; index < controles.Length; index++)
                    {
                        if (ctrl_Name == controles[index])
                        {
                            if (ctrl is CheckBox)
                            {
                                (ctrl as CheckBox).Checked = Convert.ToBoolean(ObjetoIOP.matrixPropiedades[orden[index], 1]);
                                break;
                            }
                            if (ctrl is NumericUpDown)
                            {
                                (ctrl as NumericUpDown).Value = Convert.ToDecimal(ObjetoIOP.matrixPropiedades[orden[index], 1]);
                                break;
                            }

                        }
                    }

                }
            }
            else
            {
                MessageBox.Show("Conectar COM");
            }
        }


        ////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////

        ////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////RECEPCION SERIAL///////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////



        private void RecepcionSerial(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            while (serialPort_FPGA.BytesToRead != 0)
            {
                switch (controlRx)
                {
                    case 0:
                        //voy recibiendo los datos seriales de la FPGA, si cumple con la condicion del protocolo, entonces guardo el valor
                        //el protocolo para recibir un dato correcto es recibir los siguientes numeros
                        //0 255 0 255 identificador dato
                        Listbox_identificadorPalabra.Items.Insert(0, (byte)serialPort_FPGA.ReadByte());
                        //listBox1.Items.Insert(0, (byte)serialPort_FPGA.ReadByte());
                        

                        if (Listbox_identificadorPalabra.Items.Count > 4)
                        {
                            //
                            for (int i = 0; i < 5; i++)
                            {
                                VectorByte3[4-i] = (byte)Listbox_identificadorPalabra.Items[i];
                            }

                            if (VectorByte3[0] == 0 && VectorByte3[1] == 255 && VectorByte3[2] == 0 && VectorByte3[3] == 255)
                            {

                                if (VectorByte3[4] == 16)
                                {
                                    controlRx = 1;
                                    Listbox_identificadorPalabra.Items.Clear();
                                    indexVectorByte = 5;
                                }

                                if (VectorByte3[4] == 34)
                                {
                                    controlRx = 2;
                                    Listbox_identificadorPalabra.Items.Clear();
                                    indexVectorByte = 5;
                                }
                            }

                        }
                        break;

                    case 1:
          
                        if (indexVectorByte < 21)//antes era 30 pero sume 12 por los 3 APD de 4 bytes que agregue
                        {
                            VectorByte3[indexVectorByte] = (byte)serialPort_FPGA.ReadByte();
                            indexVectorByte++;
                        }
                        else
                        {
                            Vect_NexysA7_Vout = ObjetoConvertir.VectorByte_NexysA7_COUNTER_Vout_2VectorInt(VectorByte3);
                            //this.Invoke(new EventHandler(actulizarRx));
                            controlRx = 0;
                            indexVectorByte = 0;
                        }
                        break;

                    case 2:

                        if (indexVectorByte < 39)//antes era 30 pero sume 12 por los 3 APD de 4 bytes que agregue
                        {
                            VectorByte3[indexVectorByte] = (byte)serialPort_FPGA.ReadByte();
                            indexVectorByte++;
                        }
                        else
                        {
                            Vect_NexysA7_APD = ObjetoConvertir.VectorByte_NexysA7_APD_2VectorInt(VectorByte3);
                            this.Invoke(new EventHandler(actulizarRx));
                            controlRx = 0;
                            indexVectorByte = 0;
                        }
                        break;
                }

            }



        }

        public int SUM_counts = 0;
        private void actulizarRx(object sender, EventArgs e1)
        {
            //if (button1.Text == "Measurement in process")
            {
                if (Vect_NexysA7_Vout[7] == 1 && Vect_NexysA7_Vout[8] == 254 && Vect_NexysA7_Vout[9] == 1 && Vect_NexysA7_Vout[10] == 254)
                {
                    if (Vect_NexysA7_APD[9] == 1 && Vect_NexysA7_APD[10] == 254 && Vect_NexysA7_APD[11] == 1 && Vect_NexysA7_APD[12] == 254)
                    {
                        //////////////////////////////////
                        ///
                        Vect_NexysA7_APD[0] = Vect_NexysA7_APD[0] - darkCounts1;
                        if (Vect_NexysA7_APD[0] < 0) { Vect_NexysA7_APD[0] = 0; }
                        Vect_NexysA7_APD[1] = Vect_NexysA7_APD[1] - darkCounts2;
                        if (Vect_NexysA7_APD[1] < 0) { Vect_NexysA7_APD[1] = 0; }
                        Vect_NexysA7_APD[2] = Vect_NexysA7_APD[2] - darkCounts3;
                        if (Vect_NexysA7_APD[2] < 0) { Vect_NexysA7_APD[2] = 0; }
                        Vect_NexysA7_APD[3] = Vect_NexysA7_APD[3] - darkCounts4;
                        if (Vect_NexysA7_APD[3] < 0) { Vect_NexysA7_APD[3] = 0; }
                        SUM_counts = Vect_NexysA7_APD[0] + Vect_NexysA7_APD[1] + Vect_NexysA7_APD[2] + Vect_NexysA7_APD[3] + Vect_NexysA7_APD[4] + Vect_NexysA7_APD[5] + Vect_NexysA7_APD[6];
                        chart3BARS.Series["Theory"].Points.Clear();
                        chart3BARS.Series["APD"].Points.Clear();
                        if (button1.Text == "Measurement in process")
                        {
                            RxString_txt = "";
                            for (int i = 0; i < 5; i++)//
                            {
                                RxString_txt = RxString_txt + Convert.ToString(Vect_NexysA7_Vout[i]) + "\t";
                                //listBox1.Items.Add(VectMascaras01[i]);
                            }
                            for (int i = 0; i < 7; i++)//
                            {
                                RxString_txt = RxString_txt + Convert.ToString(Vect_NexysA7_APD[i]) + "\t";
                                if (numericUpDown9.Value == 4) { RxString_txt = RxString_txt + "MUB" + Convert.ToString(MUBS) + "\t"; }
                                //listBox1.Items.Add(VectMascaras01[i]);
                            }
                            RxString_txt = RxString_txt + "\r\n";

                            StreamWriter sw = new StreamWriter(direccion_guardar2, true);
                            sw.Write(RxString_txt);
                            sw.Close();
                            RxString_txt = "";
                            chart1.ChartAreas[0].AxisX.Minimum = 0;


                        }
                        else
                        {
                            chart1.ChartAreas[0].AxisX.Minimum = Vect_NexysA7_Vout[0] - 50;
                        }
                        chart3BARS.Series["Theory"].Points.AddXY(1, numericUpDown17.Value);
                        chart3BARS.Series["Theory"].Points.AddXY(2, numericUpDown16.Value);
                        chart3BARS.Series["Theory"].Points.AddXY(3, numericUpDown22.Value);
                        chart3BARS.Series["Theory"].Points.AddXY(4, numericUpDown21.Value);
                        /*comento para tener solo 4 APDs
                            chart3BARS.Series["Theory"].Points.AddXY(5, numericUpDown28.Value);
                            chart3BARS.Series["Theory"].Points.AddXY(6, numericUpDown29.Value);
                            chart3BARS.Series["Theory"].Points.AddXY(7, numericUpDown30.Value);*/
                        //chart3BARS.Series["Theory"].Points.AddXY(8, 0.8);

                        chart1.Series["Counts1"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_APD[0]);
                        chart1.Series["Counts2"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_APD[1]);
                        chart1.Series["Counts3"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_APD[2]);
                        chart1.Series["Counts4"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_APD[3]);
                        /*comento para tener solo 4 APDs
                            chart1.Series["Counts5"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_APD[4]);
                            chart1.Series["Counts6"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_APD[5]);
                            chart1.Series["Counts7"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_APD[6]);
                        */

                        labelAPD1.Text = "APD1:  " + Convert.ToString(Vect_NexysA7_APD[0]);
                        labelAPD2.Text = "APD2:  " + Convert.ToString(Vect_NexysA7_APD[1]);
                        labelAPD3.Text = "APD3:  " + Convert.ToString(Vect_NexysA7_APD[2]);
                        labelAPD4.Text = "APD4:  " + Convert.ToString(Vect_NexysA7_APD[3]);
                        /*comento para tener solo 4 APDs
                            labelAPD5.Text = "APD5:  " + Convert.ToString(Vect_NexysA7_APD[4]);
                            labelAPD6.Text = "APD6:  " + Convert.ToString(Vect_NexysA7_APD[5]);
                            labelAPD7.Text = "APD7:  " + Convert.ToString(Vect_NexysA7_APD[6]);
                        */
                        double P1 = (double)Vect_NexysA7_APD[0] / SUM_counts;
                        double P2 = (double)Vect_NexysA7_APD[1] / SUM_counts;
                        double P3 = (double)Vect_NexysA7_APD[2] / SUM_counts;
                        double P4 = (double)Vect_NexysA7_APD[3] / SUM_counts;
                        double P5 = (double)Vect_NexysA7_APD[4] / SUM_counts;
                        double P6 = (double)Vect_NexysA7_APD[5] / SUM_counts;
                        double P7 = (double)Vect_NexysA7_APD[6] / SUM_counts;
                        fidelity = Math.Sqrt((double)(numericUpDown17.Value) * (P1)) + Math.Sqrt((double)(numericUpDown16.Value) * (P2)) + Math.Sqrt((double)(numericUpDown22.Value) * (P3)) + Math.Sqrt((double)(numericUpDown21.Value) * (P4)) + Math.Sqrt((double)(numericUpDown28.Value) * (P5)) + Math.Sqrt((double)(numericUpDown29.Value) * (P6)) + Math.Sqrt((double)(numericUpDown30.Value) * (P7));
                        if (fidelity > max_fidelity)
                        {
                            max_fidelity = fidelity;
                            label63.Text = "Max Fid: " + String.Format("{0:0.00000}", max_fidelity);
                            label64.Text = "Prob: " + String.Format("{0:0.000}", P1) + " " + String.Format("{0:0.000}", P2) + " " + String.Format("{0:0.000}", P3) + " " + String.Format("{0:0.000}", P4);
                        }
                        labelSUM.Text = "SUM:  " + Convert.ToString(SUM_counts);
                        label50.Text = "Fid: " + String.Format("{0:0.00000}", fidelity);


                        //chart1.ChartAreas[0].AxisX.Maximum = VectNESO_Vout_APD[0] + 10;
                        chart1.ChartAreas[0].AxisX.Interval = 50;


                        chart2Voltage.Series["V1"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_Vout[1]);
                        chart2Voltage.Series["V2"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_Vout[2]);
                        chart2Voltage.Series["V3"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_Vout[3]);
                        chart2Voltage.Series["V4"].Points.AddXY(Vect_NexysA7_Vout[0], Vect_NexysA7_Vout[4]);
                        chart2Voltage.ChartAreas[0].AxisX.Minimum = Vect_NexysA7_Vout[0] - 50;
                        chart2Voltage.ChartAreas[0].AxisY.Minimum = 31065;
                        //chart2Voltage.ChartAreas[0].AxisY.Maximum = 34465;
                        //chart2Voltage.ChartAreas[0].AxisX.Maximum = VectNESO_Vout_APD[0] + 10;
                        chart2Voltage.ChartAreas[0].AxisX.Interval = 50;

                        chart3BARS.Series["APD"].Points.AddXY(1, (double)Vect_NexysA7_APD[0] / SUM_counts);
                        chart3BARS.Series["APD"].Points.AddXY(2, (double)Vect_NexysA7_APD[1] / SUM_counts);
                        chart3BARS.Series["APD"].Points.AddXY(3, (double)Vect_NexysA7_APD[2] / SUM_counts);
                        chart3BARS.Series["APD"].Points.AddXY(4, (double)Vect_NexysA7_APD[3] / SUM_counts);
                        /*comento para tener solo 4 APDs
                            chart3BARS.Series["APD"].Points.AddXY(5, (double)Vect_NexysA7_APD[4] / SUM_counts);
                            chart3BARS.Series["APD"].Points.AddXY(6, (double)Vect_NexysA7_APD[5] / SUM_counts);
                            chart3BARS.Series["APD"].Points.AddXY(7, (double)Vect_NexysA7_APD[6] / SUM_counts);
                        */
                        ParametroSerial(62, 8, 1, 0);
                        if(numericUpDown9.Value == 4)
                        {
                            switch (MUBS)
                            {
                                case 2:
                                    radioButton4.Checked = true;//preparo MUB 3
                                    MUBS = 3;//preparo la siguiente medicion
                                    break;
                                case 3:
                                    radioButton5.Checked = true;//preparo MUB 4
                                    MUBS = 4;//preparo la siguiente medicion
                                    break;
                                case 4:
                                    radioButton3.Checked = true;//preparo MUB 5
                                    MUBS = 5;//preparo la siguiente medicion
                                    break;
                                case 5:
                                    radioButton2.Checked = true;//preparo MUB 2
                                    MUBS = 2;//preparo la siguiente medicion
                                    break;
                            }
                        }
                        
                    }
                }
            }
            
        }

        ////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////

        ////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////TRANSMISION SERIAL/////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////

        private void EnviarNum(int num)
        {
            if (serialPort_FPGA.IsOpen == true)
            {
                byteRx[0] = (byte)num;
                serialPort_FPGA.Write(byteRx, 0, 1);
                System.Threading.Thread.Sleep(1);
            }
            else
            {
                MessageBox.Show("Puerto no abierto");
            }

        }

        private void ParametroSerial(uint orden, int bits, uint valor, long valor_long)
        {
            if (bits < 33)
            {
                byte[] valor32bits = new byte[4];
                valor32bits = ObjetoConvertir.int2byte(valor);

                byte[] orden32bits = new byte[4];
                orden32bits = ObjetoConvertir.int2byte(orden);

                switch (bits)
                {
                    case 8:
                        EnviarNum(8);
                        EnviarNum(valor32bits[0]);
                        break;

                    case 16:
                        EnviarNum(7);
                        EnviarNum(valor32bits[1]);
                        EnviarNum(valor32bits[0]);
                        break;

                    case 24:
                        EnviarNum(6);
                        EnviarNum(valor32bits[2]);
                        EnviarNum(valor32bits[1]);
                        EnviarNum(valor32bits[0]);
                        break;

                    default:
                        EnviarNum(5);
                        EnviarNum(valor32bits[3]);
                        EnviarNum(valor32bits[2]);
                        EnviarNum(valor32bits[1]);
                        EnviarNum(valor32bits[0]);
                        break;
                }

                EnviarNum(orden32bits[1]);
                EnviarNum(orden32bits[0]);
            }
            else
            {
                byte[] valor64bits = new byte[8];
                valor64bits = ObjetoConvertir.long2byte(valor_long);

                byte[] orden32bits = new byte[4];
                orden32bits = ObjetoConvertir.int2byte(orden);

                switch (bits)
                {
                    case 40:
                        EnviarNum(4);
                        EnviarNum(valor64bits[4]);
                        EnviarNum(valor64bits[3]);
                        EnviarNum(valor64bits[2]);
                        EnviarNum(valor64bits[1]);
                        EnviarNum(valor64bits[0]);
                        break;

                    case 48:
                        EnviarNum(3);
                        EnviarNum(valor64bits[5]);
                        EnviarNum(valor64bits[4]);
                        EnviarNum(valor64bits[3]);
                        EnviarNum(valor64bits[2]);
                        EnviarNum(valor64bits[1]);
                        EnviarNum(valor64bits[0]);
                        break;

                    case 56:
                        EnviarNum(2);
                        EnviarNum(valor64bits[6]);
                        EnviarNum(valor64bits[5]);
                        EnviarNum(valor64bits[4]);
                        EnviarNum(valor64bits[3]);
                        EnviarNum(valor64bits[2]);
                        EnviarNum(valor64bits[1]);
                        EnviarNum(valor64bits[0]);
                        break;

                    default:
                        EnviarNum(1);
                        EnviarNum(valor64bits[7]);
                        EnviarNum(valor64bits[6]);
                        EnviarNum(valor64bits[5]);
                        EnviarNum(valor64bits[4]);
                        EnviarNum(valor64bits[3]);
                        EnviarNum(valor64bits[2]);
                        EnviarNum(valor64bits[1]);
                        EnviarNum(valor64bits[0]);
                        break;
                }

                EnviarNum(orden32bits[1]);
                EnviarNum(orden32bits[0]);

            }

        }


        

      


        ////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////


        ////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////MANEJO DE CONTROLES DE  WINDOWS FORM/////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////

        public String[] controles = new string[] {
                                                    "numericUpDown1","numericUpDown2","numericUpDown3","numericUpDown4", "numericUpDown9",
                                                    "checkBoxPM1","checkBoxPM2","checkBoxPM3","checkBoxPM4",
                                                    "numericUpDown10","button1",
                                                    "numericUpDown8","numericUpDown7","numericUpDown6","numericUpDown5",
                                                    "numericUpDown14","numericUpDown13","numericUpDown12","numericUpDown11",
                                                    "numericUpDown15","numericUpDown18","numericUpDown19","numericUpDown20",
                                                    "numericUpDown17","numericUpDown16","numericUpDown22","numericUpDown21",
                                                    "numericUpDown23",
                                                    "numericUpDown27","numericUpDown26","numericUpDown25","numericUpDown24",
                                                    "numericUpDown28","numericUpDown29","numericUpDown30",
                                                    "numericUpDown31","numericUpDown32","numericUpDown34","numericUpDown33","numericUpDown36","numericUpDown35",
                                                    "numericUpDown40","numericUpDown39","numericUpDown38",
                                                    "numericUpDown43","numericUpDown42","numericUpDown41","numericUpDown37",
                                                    "numericUpDown44","numericUpDown45","numericUpDown46","numericUpDown47",
                                                    "numericUpDown51","numericUpDown50","numericUpDown49","numericUpDown48",
                                                    "numericUpDown55","numericUpDown54","numericUpDown53","numericUpDown52",
                                                    "numericUpDown59","numericUpDown58","numericUpDown57","numericUpDown56",
                                                    "numericUpDown62","numericUpDown61","numericUpDown60",
                                                    "numericUpDown63","numericUpDown64","numericUpDown65",


                                                };

        public int[] orden = new int[] {
                                            20,21,22,23,24,
                                            25,25,25,25,
                                            26,27,
                                            28,29,30,31,
                                            32,33,34,35,
                                            36,39,40,41,
                                            92,93,94,95,
                                            96,
                                            42,43,44,45,
                                            97,98,99,
                                            46,47,48,49,50,51,
                                            52,53,54,
                                            100,101,102,103,
                                            104,105,106,107,
                                            108,109,110,111,
                                            112,113,114,115,
                                            116,117,118,119,
                                            59,60,61,
                                            56,57,58,
                                        };


        private void evento_click_actualizarFPGA(object sender, EventArgs e,int bits)
        {
            string ctrlName = ((Control)sender).Name;
            Control[] ctrl = new Control[] { };
            ctrl = this.Controls.Find(ctrlName, true);

            for (int index = 0; index < orden.Length; index++)
            {

                if (ctrlName == controles[index])
                {
                    if (ctrl[0] is CheckBox)
                    {
                        ObjetoIOP.guardarPropiedades(orden[index], ctrlName, Convert.ToString((ctrl[0] as CheckBox).Checked));
                        ParametroSerial((uint)orden[index], bits, (uint)((ctrl[0] as CheckBox).Checked ? 1 : 0), 0);
                    }


                    if (ctrl[0] is NumericUpDown)
                    {
                        ObjetoIOP.guardarPropiedades(orden[index], ctrlName, (ctrl[0] as NumericUpDown).Value.ToString());
                        uint numUdUint = (uint)(ctrl[0] as NumericUpDown).Value;
                        ParametroSerial((uint)orden[index], bits, (uint)(ctrl[0] as NumericUpDown).Value,0);
                        //label1.Text = (ctrl[0] as NumericUpDown).Value.ToString();
                        //label2.Text = Convert.ToString(orden[index]);

                        //decimal numUpdown_ToFPGA2 = Decimal.Multiply(((ctrl[0] as NumericUpDown).Value + 10), Decimal.Divide(65536, 20));
                        //label_atomic_clk.Text = Convert.ToString((int)numUpdown_ToFPGA2);
                        //ParametroSerial(orden[index], 32, (int)(numUpdown_ToFPGA2));
                    }

                }
            }
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e,16);
        }

        private void numericUpDown2_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown3_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown4_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            ObjetoIOP.leerPropiedades();
            ObjetoConvertir.reset();
            SoftBlink(label16, Color.FromArgb(30, 30, 30), Color.Red, 2000, true);
            SoftBlink(label17, Color.FromArgb(30, 30, 30), Color.Red, 2000, true);
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (serialPort_FPGA.IsOpen)
            {
                ParametroSerial(27, 8, 0, 0);
                ParametroSerial(55, 8, 0, 0);
                serialPort_FPGA.Close();
            }
            System.Windows.Forms.Application.Exit();
        }

        private void numericUpDown8_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);

        }

        private void numericUpDown7_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown6_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown5_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown9_ValueChanged(object sender, EventArgs e)
        {
            pictureBox1.Visible = false;
            
            if(button1.Text == "Measurement in process")
            {
                if (numericUpDown9.Value == 0)
                {
                    label16.Visible = true;
                    label17.Visible = false;
                }
                else
                {
                    if (numericUpDown9.Value == 1)
                    {
                        label16.Visible = false;
                        label17.Visible = true;
                    }
                }
            }
            if(numericUpDown9.Value == 0)
            { label43.Text = "All DACS V0"; this.evento_click_actualizarFPGA(sender, e, 8); }
            else 
            {
                if (numericUpDown9.Value == 1)
                { label43.Text = "DACS V0 then V1 V2 V3 V4"; this.evento_click_actualizarFPGA(sender, e, 8); }
                else
                {
                    if (numericUpDown9.Value == 2)
                    { label43.Text = "Ramp"; this.evento_click_actualizarFPGA(sender, e, 8); }
                    else
                    {
                        if (numericUpDown9.Value == 3)
                        { label43.Text = "DACS V1 V2 V3 V4, fixed"; this.evento_click_actualizarFPGA(sender, e, 8); }
                        else
                        {
                            if (numericUpDown9.Value == 4)
                            {
                                label43.Text = "";
                                label43.Text = "Instant Tomography";
                                ParametroSerial(24, 8, 1, 0);
                                radioButton2.Checked = true;
                                MUBS = 2;
                                //instant_tomo_voltages();
                            }
                            else
                            {
                                if (numericUpDown9.Value == 5)
                                {
                                    label43.Text = "";
                                    //label43.Text = "Instant Tomo 2 random st";
                                    //instant_tomo_voltages_2st();
                                }
                                else
                                {
                                    if (numericUpDown9.Value == 6)
                                    {
                                        label43.Text = "";
                                        //label43.Text = "Decoy state meas";
                                        //decoy_state_process();
                                    }
                                    else 
                                    {
                                        if(numericUpDown9.Value == 7)
                                        {
                                            label43.Text = "Decoy amp control";
                                            this.evento_click_actualizarFPGA(sender, e, 8);
                                            decoy_amp_control();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        private void instant_tomo_voltages()
        { }

        private void instant_tomo_voltages_2st()
        { }

        private void decoy_state_process()
        { }
        private void decoy_amp_control()
        {
            pictureBox1.Visible = true;
        }

        private void checkBoxPM1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxPM1.Checked == true)
            {
                enPM1_reg = 1;
            }
            else
            {
                enPM1_reg = 0;
            }
            enPM_reg = enPM1_reg + 2*enPM2_reg + 4*enPM3_reg + 8*enPM4_reg;
            ObjetoIOP.guardarPropiedades(25, "checkBoxPMs", Convert.ToString(enPM_reg));
            ParametroSerial(25, 8, (uint)enPM_reg, 0);
        }

        private void checkBoxPM2_CheckedChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 8);
            if (checkBoxPM2.Checked == true)
            {
                enPM2_reg = 1;
            }
            else
            {
                enPM2_reg = 0;
            }
            enPM_reg = enPM1_reg + 2 * enPM2_reg + 4 * enPM3_reg + 8 * enPM4_reg;
            ObjetoIOP.guardarPropiedades(25, "checkBoxPMs", Convert.ToString(enPM_reg));
            ParametroSerial(25, 8, (uint)enPM_reg, 0);
        }

        private void checkBoxPM3_CheckedChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 8);
            if (checkBoxPM3.Checked == true)
            {
                enPM3_reg = 1;
            }
            else
            {
                enPM3_reg = 0;
            }
            enPM_reg = enPM1_reg + 2 * enPM2_reg + 4 * enPM3_reg + 8 * enPM4_reg;
            ObjetoIOP.guardarPropiedades(25, "checkBoxPMs", Convert.ToString(enPM_reg));
            ParametroSerial(25, 8, (uint)enPM_reg, 0);
        }

        private void checkBoxPM4_CheckedChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 8);
            if (checkBoxPM4.Checked == true)
            {
                enPM4_reg = 1;
            }
            else
            {
                enPM4_reg = 0;
            }
            enPM_reg = enPM1_reg + 2 * enPM2_reg + 4 * enPM3_reg + 8 * enPM4_reg;
            ObjetoIOP.guardarPropiedades(25, "checkBoxPMs", Convert.ToString(enPM_reg));
            ParametroSerial(25, 8, (uint)enPM_reg, 0);
        }

        private void numericUpDown10_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (button1.Text == "Start Measurement")
            {
                button2.Enabled = false;
                button1.BackColor = Color.Chartreuse;
                button1.Text = "Measurement in process";
                ParametroSerial(55, 8, 0, 0);
                ParametroSerial(27, 8, 1, 0);
                if (checkBox2.Checked == true)
                {
                    string MUB_ident = "";
                    if (radioButton1.Checked == true)
                    { MUB_ident = "MUB1"; }
                    else
                        if (radioButton2.Checked == true)
                        { MUB_ident = "MUB2"; }
                        else
                            if (radioButton4.Checked == true)
                            { MUB_ident = "MUB3"; }
                            else
                                if (radioButton5.Checked == true)
                                { MUB_ident = "MUB4"; }
                                else
                                    if(radioButton3.Checked == true)
                                    { MUB_ident = "MUB5"; }

                    direccion_guardar2 = foldermedicion + @"\FPGA_stored_data_" + DateTime.Now.ToString("yyyy-MM-dd_HH_mm_ss") + "_" + MUB_ident+".txt";
                }
                else
                {
                    direccion_guardar2 = foldermedicion + @"\FPGA_stored_data_" + DateTime.Now.ToString("yyyy-MM-dd_HH_mm_ss") + ".txt";
                }
                StreamWriter sw = new StreamWriter(direccion_guardar2);
                sw.Write("N \t V1 \t V2 \t V3 \t V4 \t C1 \t C2 \t C3 \t C4 \t C5 \t C6 \t C7\r\n");
                sw.Close();
                RxString_txt = "";
                foreach (var series in chart1.Series)
                {
                    series.Points.Clear();
                }
                foreach (var series in chart2Voltage.Series)
                {
                    series.Points.Clear();
                }
                if (numericUpDown9.Value == 1)
                {
                    label16.Visible = true;
                    label17.Visible = false;
                }
                else
                {
                    if (numericUpDown9.Value == 2)
                    {
                        label16.Visible = false;
                        label17.Visible = true;
                    }
                    RxString_txt = "";
                }
            }
            else
            {
                button2.Enabled = true;
                button1.BackColor = Color.DarkGray;
                button1.Text = "Start Measurement";
                ParametroSerial(27, 8, 0, 0);
                label16.Visible = false;
                label17.Visible = false;
                RxString_txt = "";
                for (int index = 0; index < 18; index++)
                {
                    Vect_NexysA7_APD[index] = 0;
                    Vect_NexysA7_Vout[index] = 0;
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (button2.Text == "Start Alignment")
            {
                button1.Enabled = false;
                button2.BackColor = Color.Chartreuse;
                button2.Text = "Alignment in process";
                ParametroSerial(27, 8, 0, 0);
                ParametroSerial(55, 8, 1, 0);
                foreach (var series in chart1.Series)
                {
                    series.Points.Clear();
                }
                foreach (var series in chart3BARS.Series)
                {
                    series.Points.Clear();
                }
                foreach (var series in chart2Voltage.Series)
                {
                    series.Points.Clear();
                }
            }
            else
            {
                button1.Enabled = true;
                button2.BackColor = Color.DarkGray;
                button2.Text = "Start Alignment";
                ParametroSerial(55, 8, 0, 0);
            }

        }

        private void numericUpDown15_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown14_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown13_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown12_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown11_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown16_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(93, numericUpDown16.Name, numericUpDown16.Value.ToString());
        }

        private void numericUpDown17_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(92, numericUpDown17.Name, numericUpDown17.Value.ToString());
        }

        private void numericUpDown18_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown19_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown20_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown22_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(94, numericUpDown22.Name, numericUpDown22.Value.ToString());
        }

        private void numericUpDown21_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(95, numericUpDown21.Name, numericUpDown21.Value.ToString());
        }

        private void numericUpDown23_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(96, numericUpDown23.Name, numericUpDown23.Value.ToString());
        }

        private void numericUpDown27_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown26_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown25_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown24_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown28_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(97, numericUpDown28.Name, numericUpDown28.Value.ToString());
        }

        private void numericUpDown29_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(98, numericUpDown29.Name, numericUpDown29.Value.ToString());
        }

        private void numericUpDown30_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(99, numericUpDown30.Name, numericUpDown30.Value.ToString());
        }

        private void numericUpDown31_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown32_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown34_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown33_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown36_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown35_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown40_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown39_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown38_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void label43_Click(object sender, EventArgs e)
        {

        }


        private void radioButton15_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown17.Value = (decimal)states_prob[0, 0];
            numericUpDown16.Value = (decimal)states_prob[1, 0];
            numericUpDown22.Value = (decimal)states_prob[2, 0];
            numericUpDown21.Value = (decimal)states_prob[3, 0];
        }
        private void radioButton17_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown17.Value = (decimal)states_prob[0, 1];
            numericUpDown16.Value = (decimal)states_prob[1, 1];
            numericUpDown22.Value = (decimal)states_prob[2, 1];
            numericUpDown21.Value = (decimal)states_prob[3, 1];
        }

        private void radioButton19_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown17.Value = (decimal)states_prob[0, 2];
            numericUpDown16.Value = (decimal)states_prob[1, 2];
            numericUpDown22.Value = (decimal)states_prob[2, 2];
            numericUpDown21.Value = (decimal)states_prob[3, 2];
        }

        private void radioButton20_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown17.Value = (decimal)states_prob[0, 3];
            numericUpDown16.Value = (decimal)states_prob[1, 3];
            numericUpDown22.Value = (decimal)states_prob[2, 3];
            numericUpDown21.Value = (decimal)states_prob[3, 3];
         }

         private void radioButton18_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown17.Value = (decimal)states_prob[0, 4];
            numericUpDown16.Value = (decimal)states_prob[1, 4];
            numericUpDown22.Value = (decimal)states_prob[2, 4];
            numericUpDown21.Value = (decimal)states_prob[3, 4];
        }


        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox4.Checked == true)
            {
                radioButton15.Enabled = true;
                radioButton17.Enabled = true;
                radioButton19.Enabled = true;
                radioButton20.Enabled = true;
                radioButton18.Enabled = true;

            }
            else
            {
                {
                    radioButton15.Enabled = false;
                    radioButton17.Enabled = false;
                    radioButton19.Enabled = false;
                    radioButton20.Enabled = false;
                    radioButton18.Enabled = false;

                }
            }
        }

        private void chart1_Click(object sender, EventArgs e)
        {
            chart1.ChartAreas[0].AxisY.Maximum = Vect_NexysA7_APD.Max()*1.2;
        }

        private void checkBox5_CheckedChanged(object sender, EventArgs e)
        {

        }

        public int darkCounts1 = 0;
        public int darkCounts2 = 0;
        public int darkCounts3 = 0;
        public int darkCounts4 = 0;
        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true)
            {
                darkCounts1 = (int)numericUpDown43.Value;
                darkCounts2 = (int)numericUpDown42.Value;
                darkCounts3 = (int)numericUpDown41.Value;
                darkCounts4 = (int)numericUpDown37.Value;
            }
            else
            {
                darkCounts1 = 0;
                darkCounts2 = 0;
                darkCounts3 = 0;
                darkCounts4 = 0;
            }
                
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked == true)
            {
                radioButton1.Enabled = true;
                radioButton2.Enabled = true;
                radioButton4.Enabled = true;
                radioButton5.Enabled = true;
                radioButton3.Enabled = true;

            }
            else
            {
                {
                    radioButton1.Enabled = false;
                    radioButton2.Enabled = false;
                    radioButton4.Enabled = false;
                    radioButton5.Enabled = false;
                    radioButton3.Enabled = false;

                }
            }
        }

        
        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown1.Value = (int)numericUpDown44.Value;
            numericUpDown2.Value = (int)numericUpDown51.Value;
            numericUpDown3.Value = (int)numericUpDown55.Value;
            //numericUpDown4.Value = (int)numericUpDown59.Value;
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown1.Value = (int)numericUpDown44.Value;
            numericUpDown2.Value = (int)numericUpDown51.Value;
            numericUpDown3.Value = (int)numericUpDown55.Value;
            //numericUpDown4.Value = (int)numericUpDown59.Value;
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown1.Value = (int)numericUpDown47.Value;
            numericUpDown2.Value = (int)numericUpDown50.Value;
            numericUpDown3.Value = (int)numericUpDown55.Value;
            //numericUpDown4.Value = (int)numericUpDown59.Value;
        }

        private void radioButton5_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown1.Value = (int)numericUpDown46.Value;
            numericUpDown2.Value = (int)numericUpDown50.Value;
            numericUpDown3.Value = (int)numericUpDown54.Value;
            //numericUpDown4.Value = (int)numericUpDown59.Value;
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            numericUpDown1.Value = (int)numericUpDown47.Value;
            numericUpDown2.Value = (int)numericUpDown51.Value;
            numericUpDown3.Value = (int)numericUpDown54.Value;
            //numericUpDown4.Value = (int)numericUpDown59.Value;
        }

        private void numericUpDown41_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(102, numericUpDown41.Name, numericUpDown41.Value.ToString());
        }

        private void numericUpDown43_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(100, numericUpDown43.Name, numericUpDown43.Value.ToString());
        }

        private void numericUpDown42_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(101, numericUpDown42.Name, numericUpDown42.Value.ToString());
        }

        private void numericUpDown37_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(103, numericUpDown37.Name, numericUpDown37.Value.ToString());
        }

        private void numericUpDown44_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(104, numericUpDown44.Name, numericUpDown44.Value.ToString());
        }

        private void numericUpDown45_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(105, numericUpDown45.Name, numericUpDown45.Value.ToString());
        }

        private void numericUpDown46_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(106, numericUpDown46.Name, numericUpDown46.Value.ToString());
        }

        private void numericUpDown47_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(107, numericUpDown47.Name, numericUpDown47.Value.ToString());
        }

        private void numericUpDown51_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(108, numericUpDown51.Name, numericUpDown51.Value.ToString());
        }

        private void numericUpDown50_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(109, numericUpDown50.Name, numericUpDown50.Value.ToString());
        }

        private void numericUpDown49_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(110, numericUpDown49.Name, numericUpDown49.Value.ToString());
        }

        private void numericUpDown48_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(111, numericUpDown48.Name, numericUpDown48.Value.ToString());
        }

        private void numericUpDown55_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(112, numericUpDown55.Name, numericUpDown55.Value.ToString());
        }

        private void numericUpDown54_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(113, numericUpDown54.Name, numericUpDown54.Value.ToString());
        }

        private void numericUpDown53_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(114, numericUpDown53.Name, numericUpDown53.Value.ToString());
        }

        private void numericUpDown52_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(115, numericUpDown52.Name, numericUpDown52.Value.ToString());
        }

        private void numericUpDown59_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(116, numericUpDown59.Name, numericUpDown59.Value.ToString());
        }

        private void numericUpDown58_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(117, numericUpDown58.Name, numericUpDown58.Value.ToString());
        }

        private void numericUpDown57_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(118, numericUpDown57.Name, numericUpDown57.Value.ToString());
        }

        private void numericUpDown56_ValueChanged(object sender, EventArgs e)
        {
            ObjetoIOP.guardarPropiedades(119, numericUpDown56.Name, numericUpDown56.Value.ToString());
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void label63_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            max_fidelity = 0;
            label63.Text = "Max Fid: 0";
        }

        private void label59_Click(object sender, EventArgs e)
        {

        }

        private void label68_Click(object sender, EventArgs e)
        {

        }

        private void label20_Click(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void chart3BARS_Click(object sender, EventArgs e)
        {

        }

        private void numericUpDown62_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown61_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown60_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 16);
        }

        private void numericUpDown63_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown64_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void numericUpDown65_ValueChanged(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void label71_Click(object sender, EventArgs e)
        {
            this.evento_click_actualizarFPGA(sender, e, 32);
        }

        private void label60_Click(object sender, EventArgs e)
        {

        }
    }
}
