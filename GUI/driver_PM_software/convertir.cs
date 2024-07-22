using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace driver_PM_software
{
    class convertir
    {
        int i;
        double Valor0;
        int lmax;
        string String0;
        public char Punto = ',';
        public bool ReadyString2doble = false;

        public byte[] int2byte(uint valor)
        {
            byte[] byte01 = new byte[4];
            uint num0 = 0, num1 = 0, num2 = 0, num3 = 0;
            num3 = (valor / 16777216);
            num2 = (valor - 16777216 * num3) / 65536;
            num1 = (valor - 16777216 * num3 - 65536 * num2) / 256;
            num0 = (valor - 16777216 * num3 - 65536 * num2 - 256 * num1);
            byte01[3] = (byte)num3;
            byte01[2] = (byte)num2;
            byte01[1] = (byte)num1;
            byte01[0] = (byte)num0;
            return byte01;
        }

        public byte[] long2byte(long valor)
        {
            byte[] byte01 = new byte[8];
            long num0 = 0, num1 = 0, num2 = 0, num3 = 0, num4 = 0, num5 = 0, num6 = 0, num7 = 0;
            num7 = (valor / 72057594037927936);
            num6 = (valor - 72057594037927936 * num7) / 281474976710656;
            num5 = (valor - 72057594037927936 * num7 - 281474976710656 * num6) / 1099511627776;
            num4 = (valor - 72057594037927936 * num7 - 281474976710656 * num6 - 1099511627776 * num5) / 4294967296;
            num3 = (valor - 72057594037927936 * num7 - 281474976710656 * num6 - 1099511627776 * num5 - 4294967296 * num4) / 16777216;
            num2 = (valor - 72057594037927936 * num7 - 281474976710656 * num6 - 1099511627776 * num5 - 4294967296 * num4 - 16777216 * num3) / 65536;
            num1 = (valor - 72057594037927936 * num7 - 281474976710656 * num6 - 1099511627776 * num5 - 4294967296 * num4 - 16777216 * num3 - 65536 * num2) / 256;
            num0 = (valor - 72057594037927936 * num7 - 281474976710656 * num6 - 1099511627776 * num5 - 4294967296 * num4 - 16777216 * num3 - 65536 * num2 - 256 * num1);

            byte01[7] = (byte)num7;
            byte01[6] = (byte)num6;
            byte01[5] = (byte)num5;
            byte01[4] = (byte)num4;
            byte01[3] = (byte)num3;
            byte01[2] = (byte)num2;
            byte01[1] = (byte)num1;
            byte01[0] = (byte)num0;
            return byte01;
        }

        public int[] VectorByte2VectorInt(byte[] VectorIn)
        {
            int[] VectorOut = new int[1000];
            int lmax = VectorIn[1] + VectorIn[2] * 256;
            int k = 3;
            for (int i = 1; i < lmax + 1; i++)
            {
                VectorOut[i] = VectorIn[k] + VectorIn[k + 1] * 256;
                k += 2;
            }
            VectorOut[0] = lmax;
            return VectorOut;
        }

        public int[] VectorByte_NESO_Vout_APD_COUNTER_2VectorInt(byte[] VectorIn)
        {
            int[] VectorOut = new int[18];

            VectorOut[0] = VectorIn[0] * 256 + VectorIn[1];
            
            int k = 2;
            for (int i = 1; i < 5; i++)
            {
                VectorOut[i] = VectorIn[k] * 256 + VectorIn[k + 1];
                k += 2;
            }
            for (int i = 5; i < 12; i++)
            {
                VectorOut[i] = VectorIn[k] * 16777216 + VectorIn[k + 1] * 65536 + VectorIn[k +2] * 256 + VectorIn[k + 3];
                k += 4;
            }
            for (int i = 12; i < 16; i++)
            {
                VectorOut[i] = VectorIn[k];
                k += 1;
            }

            return VectorOut;
            
        }

        public int[] VectorByte_NexysA7_COUNTER_Vout_2VectorInt(byte[] VectorIn)
        {
            int[] VectorOut = new int[18];

            VectorOut[0] = VectorIn[5] * 256 + VectorIn[6];

            int k = 7;
            for (int i = 1; i < 5; i++)
            {
                VectorOut[i] = VectorIn[k] * 256 + VectorIn[k + 1];
                k += 2;
            }
            
            for (int i = 5; i < 11; i++)
            {
                VectorOut[i] = VectorIn[k];
                k += 1;
            }

            return VectorOut;

        }

        public int[] VectorByte_NexysA7_APD_2VectorInt(byte[] VectorIn)
        {
            int[] VectorOut = new int[18];

            int k = 5;
            for (int i = 0; i < 7; i++)
            {
                VectorOut[i] = VectorIn[k] * 16777216 + VectorIn[k + 1] * 65536 + VectorIn[k + 2] * 256 + VectorIn[k + 3];
                k += 4;
            }

            for (int i = 7; i < 13; i++)
            {
                VectorOut[i] = VectorIn[k];
                k += 1;
            }

            return VectorOut;

        }

        public int[] VectorByte32_2VectorInt(byte[] VectorIn)
        {
            int[] VectorOut = new int[2000];
            int lmax = VectorIn[1] + VectorIn[2] * 256 + VectorIn[3] * 65536 + VectorIn[4] * 16777216;
            int k = 5;
            for (int i = 1; i < lmax + 1; i++)
            {
                VectorOut[i] = VectorIn[k] + VectorIn[k + 1] * 256 + VectorIn[k + 2] * 65536 + VectorIn[k + 3] * 16777216;
                k += 4;
            }
            VectorOut[0] = lmax;
            return VectorOut;
        }


        public double String2Double(string dataIn, double ValorAnt, double Pasos)
        {
            ReadyString2doble = false;
            Valor0 = 0;
            lmax = dataIn.Length;
            String0 = "0";
            bool Onepunto = true;
            bool BoolSumar = false;
            bool BoolResta = false;
            for (i = 0; i < lmax; i++)
            {
                if (dataIn[i] == '*')
                {
                    BoolSumar = true;
                    ReadyString2doble = true;

                    break;
                }
                if (dataIn[i] == '/')
                {
                    BoolResta = true;
                    ReadyString2doble = true;
                    break;
                }
                if ((byte)dataIn[i] == 10)
                {
                    ReadyString2doble = true;
                }
                if ((byte)dataIn[i] == 44 || (byte)dataIn[i] == 46)
                {
                    //if ((byte)dataIn[i] == 45) 
                    //{
                    //    String0 += "-0"; 
                    //}
                    if (Onepunto)
                    {
                        String0 += Punto;
                        Onepunto = false;
                    }
                }
                if ((byte)dataIn[i] == 45)
                {
                    if (i == 0)
                    {
                        String0 = "-";
                    }

                }
                if ((byte)dataIn[i] > 47 && (byte)dataIn[i] < 58)
                {
                    String0 += dataIn[i];
                }
            }
            if (BoolSumar)
            {
                Valor0 = ValorAnt + Pasos;
                //ReadyString2doble = true;
            }
            else if (BoolResta)
            {
                Valor0 = ValorAnt - Pasos;
                //ReadyString2doble = true;
            }
            else
                Valor0 = Convert.ToDouble(String0);


            return Valor0;
        }

        public void reset()
        {
            string num1 = "0.1";
            string num2 = "0,1";
            double d1, d2;
            d1 = Convert.ToDouble(num1);
            d2 = Convert.ToDouble(num2);
            if (d1 < d2)
            {
                Punto = '.';
            }
            else
            {
                Punto = ',';
            }
        }
    }
}
