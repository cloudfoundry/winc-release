using System;
using Xunit;

namespace CfCcgPlugin.Tests
{
    public class CcgCredProviderTest
    {
        private readonly ICcgDomainAuthCredentials credProvider;

        public CcgCredProviderTest()
        {
            credProvider = (ICcgDomainAuthCredentials)Activator.CreateInstance(Type.GetTypeFromCLSID(new Guid("8019A64C-3F4E-4DE3-AD2B-9A544290E2C3")));
        }

        [Fact(DisplayName = "Correctly sets the values")]
        public void CorrectlySetsTheValues()
        {
            credProvider.GetPasswordCredentials("domain:username:password", out string domain, out string username, out string password);

            Assert.Equal("domain", domain);
            Assert.Equal("username", username);
            Assert.Equal("password", password);
        }

        [Fact(DisplayName = "It throws an exception when the input provided is invalid")]
        public void ItThrowsExceptionWhenInputInvalid()
        {
            var ex = Assert.Throws<ArgumentException>(() => credProvider.GetPasswordCredentials("invalid-plugin-input", out string domain, out string username, out string password));
            Assert.Equal("Plugin input must be in the format domain:username:password", ex.Message);
        }

        [Fact(DisplayName = "It throws an exception when the input provided is null")]
        public void ItThrowsExceptionWhenInputNull()
        {
            var ex = Assert.Throws<System.Runtime.InteropServices.COMException>(() => credProvider.GetPasswordCredentials(null, out string domain, out string username, out string password));
            Assert.Equal("A null reference pointer was passed to the stub. (0x800706F4)", ex.Message);
        }
    }
}
