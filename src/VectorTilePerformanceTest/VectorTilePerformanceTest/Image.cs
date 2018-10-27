using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.IO;

namespace VectorTilePerformanceTest
{
    public static class Image
    {
        public static byte[] Merge(List<byte[]> buffers)
        {
            // prepare final image
            Bitmap final = new Bitmap(256, 256, System.Drawing.Imaging.PixelFormat.Format32bppPArgb);
            Graphics g = Graphics.FromImage(final);
            g.Clear(ColorTranslator.FromHtml("#a1c3de"));
            g.CompositingMode = CompositingMode.SourceOver;

            // copy images onto the final image
            Point origin = new Point(0, 0);
            foreach (byte[] buffer in buffers)
            {
                using (MemoryStream stream = new MemoryStream(buffer))
                {
                    using (System.Drawing.Image tmp = System.Drawing.Image.FromStream(stream, false, false))
                        g.DrawImage(tmp, origin);
                }
            }
            return BitMapToArray(final);
        }

        private static byte[] BitMapToArray(Bitmap bm)
        {
            byte[] byteArray = null;
            using (MemoryStream stream = new MemoryStream())
            {
                bm.Save(stream, ImageFormat.Png);
                stream.Close();
                byteArray = stream.ToArray();
            }
            return byteArray;
        }
    }
}