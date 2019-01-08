using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Windows.Forms;
using CIAutoUpdater.Logging;
using CIAutoUpdater.Properties;

namespace CIAutoUpdater
{
    public class AutoUpdate
    {
        private EventLogger _eventLogger = new EventLogger("CIAutoUpdater AutoUpdate");

        public string UpdateUrl { get; set; }
        public DateTime LastInstallTime { get; set; }
        public static string[] AllowedContentTypes { get; set; }

        public AutoUpdate(string updateUrl, DateTime lastInstallTime)
        {
            UpdateUrl = updateUrl;
            LastInstallTime = lastInstallTime;
            _eventLogger.Info($"Init: UpdateUrl={UpdateUrl} LastInstallTime={LastInstallTime}");

            ServicePointManager.ServerCertificateValidationCallback += new RemoteCertificateValidationCallback(AlwaysGoodCertificate);
        }

        private bool AlwaysGoodCertificate(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslpolicyerrors)
        {
            return true;
        }

        protected HttpWebResponse GetWebResponse()
        {
            // Creates an HttpWebRequest for the specified URL. 
            HttpWebRequest myHttpWebRequest = (HttpWebRequest)WebRequest.Create(UpdateUrl);

            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            //ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls;
            myHttpWebRequest.AllowAutoRedirect = true;

            _eventLogger.Info($"Getting web response from {UpdateUrl}...");
            HttpWebResponse myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();

            var headersText = "";
            foreach (string header in myHttpWebResponse.Headers)
            {
                headersText += header + "=" + myHttpWebResponse.Headers[header] + "\n";
            }

            _eventLogger.Info($"Web response headers = {headersText}");

            if (myHttpWebResponse.StatusCode != HttpStatusCode.OK && myHttpWebResponse.StatusCode != HttpStatusCode.Found)
                throw new WebException($"Could not get web response: {myHttpWebResponse.StatusDescription}");

            var isContentTypeAllowed = AllowedContentTypes
                                           ?.Any(x => x.Equals(myHttpWebResponse.ContentType, StringComparison.InvariantCultureIgnoreCase))
                                       ?? true;
            if (!isContentTypeAllowed)
                throw new InvalidDataException($"ContentType is invalid: {myHttpWebResponse.ContentType}. Should be application/octet-stream.");

            return myHttpWebResponse;
        }

        public bool IsNewUpdateAvailable()
        {
            _eventLogger.Info($"Checking for update... ({UpdateUrl})");

            HttpWebResponse myHttpWebResponse = GetWebResponse();

            Debug.WriteLine("LastInstallDateTime: " + LastInstallTime);
            //Debug.WriteLine("Response LastModified: " + myHttpWebResponse.LastModified);
            //var lastInstallUTCTime = LastInstallTime.ToUniversalTime();
            var lastModUTCTime = myHttpWebResponse.LastModified.ToUniversalTime();
            //Debug.WriteLine("UTC LastInstallDateTime: " + lastInstallUTCTime);
            Debug.WriteLine("UTC Response LastModified: " + lastModUTCTime);

            myHttpWebResponse.Close();

            var minutesDiff = (int)lastModUTCTime.Subtract(LastInstallTime).TotalMinutes -1;

            var result = (minutesDiff > 0);
            _eventLogger.Info($"Checking for update result={result} LastModifiedUTC={lastModUTCTime} LastInstallTime={LastInstallTime} (Minutes Diff={minutesDiff})");

            return result;
        }

        public void DownloadUpdate(string destinationFile)
        {
            _eventLogger.Info($"DownloadUpdate({destinationFile}) from {UpdateUrl}");

            HttpWebResponse myHttpWebResponse = GetWebResponse();
            var lastModDateTime = myHttpWebResponse.LastModified;
            myHttpWebResponse.Close();
            _eventLogger.Info($"DownloadUpdate GetWebResponse().LastModified = {lastModDateTime}");

            if (File.Exists(destinationFile))
            {
                _eventLogger.Info($"DownloadUpdate Delete file {destinationFile}...");
                File.Delete(destinationFile);
            }

            _eventLogger.Info($"DownloadUpdate Downloading file from {UpdateUrl} to {destinationFile}...");
            using (WebClient wc = new WebClient())
                wc.DownloadFile(UpdateUrl, destinationFile);

            _eventLogger.Info($"DownloadUpdate SetCreationTime file to {lastModDateTime}");
            File.SetCreationTime(destinationFile, lastModDateTime);
            File.SetLastWriteTime(destinationFile, lastModDateTime);

            _eventLogger.Info($"DownloadUpdate compelted.");
        }
    }
}
