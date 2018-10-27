using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using System.Diagnostics;

namespace VectorTilePerformanceTest
{
    class TileRequest : IComparable<TileRequest>
    {
        public bool success = false;
        public string url;
        public long milliSeconds;
        public MemoryStream imageStream = new MemoryStream(4096);

        public TileRequest(string url)
        {
            this.url = url;
        }

        public void Send()
        {
            WebRequest request = WebRequest.Create(url);
            Stopwatch watch = new Stopwatch();
            watch.Start();
            try
            {

                WebResponse response = request.GetResponse();
                Stream stream = response.GetResponseStream();
                stream.CopyTo(imageStream);
                response.Close();
                success = true;
            }
            catch (Exception) { success = false; }
            watch.Stop();
            milliSeconds = watch.ElapsedMilliseconds;
        }

        public int CompareTo(TileRequest other)
        {
            return (int)(other.milliSeconds - milliSeconds);
        }

        public override string ToString()
        {
            return url.Replace("layers=all", "layers=");
        }
    }
}
