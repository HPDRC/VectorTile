using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Threading;
using System.Diagnostics;

namespace VectorTilePerformanceTest
{
    class Program
    {
        const int prefillMaxZoom = 8;

        static void Main(string[] args)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            //PrefillCache("map", new string[] { "all" });
            PrefillCache("http://131.94.133.190/TileService/vector.aspx?projection=bing&styleset=", "hybrid", new string[] { "all" });
            watch.Stop();
            Console.WriteLine("Done in " + watch.Elapsed);
            Console.ReadKey();
        }
        
        static void PrefillCache(string prefillUrl, string styleSet, string[] layers)
        {
            int sum = 0;
            for (int z = 0; z <= prefillMaxZoom; z++)
            {
                sum += (1 << z) * (1 << z);
            }
            Console.WriteLine("Start prefilling cache...");
            Console.WriteLine("Tile total count: " + sum);

            foreach (string layer in layers)
            {
                Console.WriteLine("Start requesting " + layer);
                Stopwatch watch = new Stopwatch();
                watch.Start();
                long slowest = 0;
                int count = 0;
                for (int z = 0; z <= prefillMaxZoom; z++)
                {
                    int xmax = 1 << z;
                    for (int x = 0; x < xmax; x++)
                    {
                        for (int y = 0; y < xmax; y++)
                        {
                            TileRequest ut = new TileRequest(prefillUrl + styleSet + "&x=" + x + "&y=" + y + "&z=" + z + "&layers=" + layer);
                            ut.Send();
                            slowest = Math.Max(slowest, ut.milliSeconds);
                            count++;
                            if (count % 100 == 0)
                                Console.Write(count + " ");
                        }
                    }
                }
                watch.Stop();
                Console.WriteLine("\r\nFinish in " + watch.Elapsed + ", avg/" + (watch.ElapsedMilliseconds/count) + ", high/" + slowest + "\r\n");
            }
        }
    }
}
