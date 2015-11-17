using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EngineeringAnalysisStatistics1
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine("a1 = " + a()[1]);
            Console.WriteLine("a0 = " + a()[0]);
            Console.WriteLine("r^2 = " + rSquared());
            Console.ReadKey();
        }



        // Solves for a1, and a0 with linear regression methods.
        public static double[] a()
        {
            const int n = 6;
            double sumx = 0;
            double sumy = 0;
            double sumxy = 0;
            double xSquared = 0;
            
            double[] x = new double[n] { 1, 2, 3, 4, 5, 6 };
            double[] y = new double[n] { 9.4, 14.05, 19.46, 25.11, 31.15, 35.98 };
            
            for (int i = 0; i < n; i++)
            {
                sumx += x[i];
                sumy += y[i];
                sumxy += x[i] * y[i];
                xSquared += Math.Pow(x[i], 2);

            }
            double meanx = sumx/n;
            double meany = sumy/n;
            double sumxsumy = sumx * sumy;
            double sumxSquared = Math.Pow(sumx,2);

            double a1 = (n * (sumxy) - sumxsumy) / (n * (xSquared) - sumxSquared);
            double a0 = meany - a1 * meanx;

            double[] a = new double[2] { a0, a1 };
            return a;
        }


        // Calculates and returns r^2 value.
        public static double rSquared()
        {
            const int n = 6;
            double sumx = 0;
            double sumy = 0;
            double[] x = new double[n] { 1, 2, 3, 4, 5, 6 };
            double[] y = new double[n] { 9.4, 14.05, 19.46, 25.11, 31.15, 35.98 };

            // Create the mean of x and y.
            for (int i = 0; i < n; i++)
            {
                sumx += x[i];
                sumy += y[i];
            }
            double meanx = sumx / n;
            double meany = sumy / n;

            double St = 0;
            double Sr = 0;

            for (int i = 0; i < n; i++)
            {
                St += Math.Pow((y[i] - meany), 2);
                Sr += Math.Pow((y[i] - a()[0] - (a()[1] * x[i])),2);
            }
            double rSquared = (St - Sr) / St;
            return rSquared;
        }

    }
}
