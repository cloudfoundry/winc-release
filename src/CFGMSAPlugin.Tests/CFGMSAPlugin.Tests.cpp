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

		TEST_METHOD(HappyPath)
		{
			std::wstring pluginInput = L"domain:username:password";

			LPWSTR domain;
			LPWSTR username;
			LPWSTR password;

			CComPtr<ICcgDomainAuthCredentials> ccgPlugin;
			HRESULT hr = ccgPlugin.CoCreateInstance(__uuidof(CCGPlugin));
			Assert::AreEqual(S_OK, hr);

			hr = ccgPlugin->GetPasswordCredentials(&pluginInput[0], &domain, &username, &password);

			Assert::AreEqual(S_OK, hr);
			Assert::AreEqual(domain, L"domain");
			Assert::AreEqual(username, L"username");
			Assert::AreEqual(password, L"password");
		}

		TEST_METHOD(NullOuput)
		{
			std::wstring pluginInput = L"domain:username:password";


			CComPtr<ICcgDomainAuthCredentials> ccgPlugin;
			HRESULT hr = ccgPlugin.CoCreateInstance(__uuidof(CCGPlugin));
			Assert::AreEqual(S_OK, hr);

			hr = ccgPlugin->GetPasswordCredentials(&pluginInput[0], NULL, NULL, NULL);

			Assert::AreEqual(STG_E_INVALIDPARAMETER, hr);
		}

		TEST_METHOD(InputInvalidFormat)
		{
			std::wstring pluginInput = L"invalid-input";

			LPWSTR domain;
			LPWSTR username;
			LPWSTR password;

			CComPtr<ICcgDomainAuthCredentials> ccgPlugin;
			HRESULT hr = ccgPlugin.CoCreateInstance(__uuidof(CCGPlugin));
			Assert::AreEqual(S_OK, hr);

			hr = ccgPlugin->GetPasswordCredentials(&pluginInput[0], &domain, &username, &password);

			Assert::AreEqual(CO_E_NOT_SUPPORTED, hr);
		}
	};
}
