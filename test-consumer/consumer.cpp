#include <node_api.h>

#include <vector>

#ifdef _WIN32
#include <windows.h>
#else
#include <dlfcn.h>
#endif

void fail(napi_env env, const char *message) {
	napi_throw_error(env, nullptr, message);
}

napi_value probe(napi_env env, napi_callback_info info) {
	size_t argc = 1;
	napi_value argv[1];
	napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
	if (argc != 1) {
		fail(env, "Expected the Qt GUI library path");
		return nullptr;
	}

#ifdef _WIN32
	size_t length = 0;
	napi_get_value_string_utf16(env, argv[0], nullptr, 0, &length);
	std::vector<char16_t> path(length + 1);
	napi_get_value_string_utf16(env, argv[0], path.data(), path.size(), &length);
	HMODULE library = LoadLibraryW(reinterpret_cast<const wchar_t *>(path.data()));
	if (library == nullptr) {
		fail(env, "Unable to load the packaged Qt6Gui.dll");
		return nullptr;
	}
#else
	size_t length = 0;
	napi_get_value_string_utf8(env, argv[0], nullptr, 0, &length);
	std::vector<char> path(length + 1);
	napi_get_value_string_utf8(env, argv[0], path.data(), path.size(), &length);
	void *library = dlopen(path.data(), RTLD_NOW | RTLD_LOCAL);
	if (library == nullptr) {
		fail(env, dlerror());
		return nullptr;
	}
#endif

	napi_value result;
	napi_get_boolean(env, true, &result);

#ifdef _WIN32
	FreeLibrary(library);
#else
	dlclose(library);
#endif

	return result;
}

napi_value init(napi_env env, napi_value exports) {
	napi_value function;
	napi_create_function(env, "probe", NAPI_AUTO_LENGTH, probe, nullptr, &function);
	napi_set_named_property(env, exports, "probe", function);
	return exports;
}

NAPI_MODULE(NODE_GYP_MODULE_NAME, init)
