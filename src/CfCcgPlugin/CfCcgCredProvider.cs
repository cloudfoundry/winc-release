using System;
using System.Diagnostics;
using System.EnterpriseServices;
using System.Runtime.InteropServices;

namespace CfCcgPlugin
{
    [Guid("6ECDA518-2010-4437-8BC3-46E752B7B172")]
    [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    [ComImport]
    public interface ICcgDomainAuthCredentials
    {
        void GetPasswordCredentials(
            [MarshalAs(UnmanagedType.LPWStr), In] string pluginInput,
            [MarshalAs(UnmanagedType.LPWStr)] out string domainName,
            [MarshalAs(UnmanagedType.LPWStr)] out string username,
            [MarshalAs(UnmanagedType.LPWStr)] out string password);
    }

    [Guid("8019A64C-3F4E-4DE3-AD2B-9A544290E2C3")]
    [ProgId("CfCcgCredProvider")]
    [ComVisible(true)]
    public class CfCcgCredProvider : ServicedComponent, ICcgDomainAuthCredentials
    {
        public CfCcgCredProvider()
        {
            Log("Plugin instantiated");
        }

        public void GetPasswordCredentials(
     [MarshalAs(UnmanagedType.LPWStr), In] string pluginInput,
     [MarshalAs(UnmanagedType.LPWStr)] out string domainName,
     [MarshalAs(UnmanagedType.LPWStr)] out string username,
     [MarshalAs(UnmanagedType.LPWStr)] out string password)
        {
            Log("Plugin invoked");
            if (pluginInput == null)
            {
                Log("Plugin input null", EventLogEntryType.Error);
                throw new ArgumentException("Plugin input must not be null");
            }

            var split = pluginInput.Split(':');
            if (split.Length < 3)
            {
                Log("Invalid plugin input format", EventLogEntryType.Error);
                throw new ArgumentException("Plugin input must be in the format domain:username:password");
            }

            domainName = split[0];
            username = split[1];
            password = split[2];
            Log("Sucessfully got password credentials");
        }
        private void Log(string message, EventLogEntryType level = EventLogEntryType.Information)
        {
            const string LogSource = "CfCcgPlugin";
            const string LogName = "Cloudfoundry-CCG-Plugin";

            using (var eventLog = new EventLog(LogName))
            {
                eventLog.Source = LogSource;
                eventLog.WriteEntry(message, level);
            }
        }
    }
}
