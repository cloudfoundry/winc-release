// pch.h: This is a precompiled header file.
// Files listed below are compiled only once, improving build performance for future builds.
// This also affects IntelliSense performance, including code completion and many code browsing features.
// However, files listed here are ALL re-compiled if any one of them is updated between builds.
// Do not add files here that you will be updating frequently as this negates the performance advantage.

#ifndef PCH_H
#define PCH_H

#define SECURITY_WIN32

// add headers that you want to pre-compile here
#include <algorithm>
#include <regex>
#include <string>
#include <memory>
#include <io.h> 
#include <fcntl.h>


// Disable 'macro redefinition' warning, caused because importing ntstatus
#pragma warning( disable : 4005 )

#include "framework.h"
#include <ntsecapi.h>
#include <ntstatus.h>
#include "wincred.h"
#include "sspi.h"

#include <wil\Resource.h>
#include <wil\com.h>
#include "CFGMSAPlugin.h"

#include <wrl/implements.h>
#include <wrl/module.h>
#include "CCGPlugin_h.h"
#include "winstring.h"

#endif //PCH_H
