#include "pch.h"
#include "CppUnitTest.h"
#include "../CFGMSAPlugin/CCGPlugin_h.h"
#include "atlbase.h"

using namespace std;
using namespace Microsoft::VisualStudio::CppUnitTestFramework;

namespace CFGMSAPluginTests
{
	TEST_CLASS(CFGMSAPluginTests)
	{
	public:
		
        TEST_METHOD(HappyPathTest)
        {
            std::wstring pluginInput = L"domain:username:password";

            LPWSTR domain;
            LPWSTR username;
            LPWSTR password;

            CComPtr<ICcgDomainAuthCredentials> ccgPlugin;
            HRESULT hr = ccgPlugin.CoCreateInstance(__uuidof(CCGPlugin));
            hr = ccgPlugin->GetPasswordCredentials(&pluginInput[0], &domain, &username, &password);
            
            Assert::AreEqual(S_OK, hr);
            Assert::AreEqual(domain, L"domain");
            Assert::AreEqual(username, L"username");
            Assert::AreEqual(password, L"password");
        }
	};
}
