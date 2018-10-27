using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace VectorTilePerformanceTest
{
    class Spider
    {
        string outputDir;
        string urlTemplate;
        int xmin, xmax, ymin, ymax;
        const int zoom = 20;

        public Spider(string outputDir, string url, int zoomLevel, int xmin, int xmax, int ymin, int ymax)
        {
            this.outputDir = outputDir;
            this.urlTemplate = url;
            this.xmin = xmin << (zoom - zoomLevel);
            this.xmax = xmax << (zoom - zoomLevel);
            this.ymin = ymin << (zoom - zoomLevel);
            this.ymax = ymax << (zoom - zoomLevel);
        }

        public void Start(int maxZoom)
        {
            Console.WriteLine("Estimated file count: " + (int)((xmax-xmin)*(ymax-ymin)*1.333/(1<<(2*(zoom-maxZoom)))));
            int count = 0;
            for (int z = 0; z <= maxZoom; z++)
            {
                int shift = zoom - z;
                int x1 = Math.Max((xmin >> shift) - 4, 0);
                int x2 = Math.Min((xmax >> shift) + 4, (1 << z) - 1);
                int y1 = Math.Max((ymin >> shift) - 4, 0);
                int y2 = Math.Min((ymax >> shift) + 4, (1 << z) - 1);
                for (int x = x1; x <= x2; x++)
                {
                    for (int y = y1; y <= y2; y++)
                    {
                        if (count % 1000 == 0)
                            Console.Write(count + " ");
                        count++;
                        string url = urlTemplate.Replace("{z}", z.ToString()).Replace("{x}", x.ToString()).Replace("{y}", y.ToString());
                        TileRequest request = new TileRequest(url);
                        request.Send();
                        if (!request.success)
                            Console.WriteLine("Failed to access " + url);
                        else
                        {
                            Directory.CreateDirectory(XYZToFolder(x, y, z));
                            FileStream fileStream = new FileStream(XYZToPath(x,y,z), FileMode.Create);
                            request.imageStream.WriteTo(fileStream);
                            fileStream.Close();
                        }
                    }
                }
            }
            Console.WriteLine("\r\n" + count + " files are generated");
        }

        private string XYZToFolder(int x, int y, int z)
        {
            return outputDir + "\\" + z + "\\" + x;
        }

        private string XYZToPath(int x, int y, int z)
        {
            return outputDir + "\\" + z + "\\" + x + "\\" + y + ".png";
        }
    }
}
