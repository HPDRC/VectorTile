using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace VectorTilePerformanceTest
{
    class BenchMark
    {
        const int total = 500;
        const int effective = 50;
        const int zMin = 9;
        const int zMax = 15;
        const string reportPath = "report.txt";

        public static void Run(string layers)
        {
            Console.WriteLine("Benchmarking " + layers);
            UrlGenerator urlGenerator = new UrlGenerator(layers);
            string result = "Layers: " + layers + "\r\n";
            string result2 = "";

            for (int z = zMin; z <= zMax; z++)
            {
                List<TileRequest> requests = new List<TileRequest>();
                for (int i = 0; i < total; i++)
                {
                    TileRequest request = new TileRequest(urlGenerator.Get(z));
                    request.Send();
                    requests.Add(request);
                }
                requests.Sort();

                // calc statistics
                long sum = 0;
                for (int i = 0; i < effective; i++)
                {
                    sum += requests[i].milliSeconds;
                }
                result += "zoom " + z + ": avg/" + (sum / effective) + " high/" + requests[0].milliSeconds + " low/" + requests[effective-1].milliSeconds + "\r\n";
                result2 += requests[0].url + "\r\n";
            }

            File.AppendAllText(reportPath, result + result2 + "\r\n");
        }
    }
}
