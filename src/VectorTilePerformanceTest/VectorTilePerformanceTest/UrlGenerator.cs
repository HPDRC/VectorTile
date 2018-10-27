using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VectorTilePerformanceTest
{
    class UrlGenerator
    {
        struct XYZ { public int x, y, z;}
        private Random rand = new Random();
        private HashSet<XYZ> visited = new HashSet<XYZ>();

        private int xmin = 11892;
        private int xmax = 17916;
        private int ymin = 23640;
        private int ymax = 26880;
        private int zoom = 16;
        private string layers;

        public UrlGenerator(string layers)
        {
            this.layers = layers;
        }

        public string Get(int z)
        {
            int diff = zoom - z;
            XYZ loc = new XYZ();
            loc.x = 0;
            loc.y = 0;
            loc.z = z;

            for (int i = 0; i < 100; i++)
            {
                if (z >= 10)
                {
                    loc.x = rand.Next(xmin >> diff, xmax >> diff);
                    loc.y = rand.Next(ymin >> diff, ymax >> diff);
                }
                else
                {
                    loc.x = rand.Next(0, 1 << z);
                    loc.y = rand.Next(0, 1 << z);
                }
                loc.x = loc.x - loc.x % 4;
                loc.y = loc.y - loc.y % 4;
                if (visited.Contains(loc))
                    continue;
                else
                    visited.Add(loc);
            }
            return "http://131.94.133.205/VectorTileService/default.aspx?projection=bing&styleset=map&userendergroup=false&x=" + loc.x + "&y=" + loc.y + "&z=" + loc.z + "&layers=" + layers;
        }
    }
}
