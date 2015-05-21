# GRPC global makefile
# This currently builds C and C++ code.
# This file has been automatically generated from a template file.
# Please look at the templates directory instead.

# Copyright 2015, Google Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



# Basic platform detection
HOST_SYSTEM = $(shell uname | cut -f 1 -d_)
ifeq ($(SYSTEM),)
SYSTEM = $(HOST_SYSTEM)
endif
ifeq ($(SYSTEM),MSYS)
SYSTEM = MINGW32
endif
ifeq ($(SYSTEM),MINGW64)
SYSTEM = MINGW32
endif


ifndef BUILDDIR
BUILDDIR = .
endif

HAS_GCC = $(shell which gcc > /dev/null 2> /dev/null && echo true || echo false)
HAS_CC = $(shell which cc > /dev/null 2> /dev/null && echo true || echo false)
HAS_CLANG = $(shell which clang > /dev/null 2> /dev/null && echo true || echo false)

ifeq ($(HAS_CC),true)
DEFAULT_CC = cc
DEFAULT_CXX = c++
else
ifeq ($(HAS_GCC),true)
DEFAULT_CC = gcc
DEFAULT_CXX = g++
else
ifeq ($(HAS_CLANG),true)
DEFAULT_CC = clang
DEFAULT_CXX = clang++
else
DEFAULT_CC = no_c_compiler
DEFAULT_CXX = no_c++_compiler
endif
endif
endif


BINDIR = $(BUILDDIR)/bins
OBJDIR = $(BUILDDIR)/objs
LIBDIR = $(BUILDDIR)/libs
GENDIR = $(BUILDDIR)/gens

# Configurations

VALID_CONFIG_opt = 1
CC_opt = $(DEFAULT_CC)
CXX_opt = $(DEFAULT_CXX)
LD_opt = $(DEFAULT_CC)
LDXX_opt = $(DEFAULT_CXX)
CPPFLAGS_opt = -O2
LDFLAGS_opt =
DEFINES_opt = NDEBUG

VALID_CONFIG_basicprof = 1
CC_basicprof = $(DEFAULT_CC)
CXX_basicprof = $(DEFAULT_CXX)
LD_basicprof = $(DEFAULT_CC)
LDXX_basicprof = $(DEFAULT_CXX)
CPPFLAGS_basicprof = -O2 -DGRPC_BASIC_PROFILER -DGRPC_TIMERS_RDTSC
LDFLAGS_basicprof =
DEFINES_basicprof = NDEBUG

VALID_CONFIG_stapprof = 1
CC_stapprof = $(DEFAULT_CC)
CXX_stapprof = $(DEFAULT_CXX)
LD_stapprof = $(DEFAULT_CC)
LDXX_stapprof = $(DEFAULT_CXX)
CPPFLAGS_stapprof = -O2 -DGRPC_STAP_PROFILER
LDFLAGS_stapprof =
DEFINES_stapprof = NDEBUG

VALID_CONFIG_dbg = 1
CC_dbg = $(DEFAULT_CC)
CXX_dbg = $(DEFAULT_CXX)
LD_dbg = $(DEFAULT_CC)
LDXX_dbg = $(DEFAULT_CXX)
CPPFLAGS_dbg = -O0
LDFLAGS_dbg =
DEFINES_dbg = _DEBUG DEBUG

VALID_CONFIG_mutrace = 1
CC_mutrace = $(DEFAULT_CC)
CXX_mutrace = $(DEFAULT_CXX)
LD_mutrace = $(DEFAULT_CC)
LDXX_mutrace = $(DEFAULT_CXX)
CPPFLAGS_mutrace = -O0
LDFLAGS_mutrace = -rdynamic
DEFINES_mutrace = _DEBUG DEBUG

VALID_CONFIG_valgrind = 1
REQUIRE_CUSTOM_LIBRARIES_valgrind = 1
CC_valgrind = $(DEFAULT_CC)
CXX_valgrind = $(DEFAULT_CXX)
LD_valgrind = $(DEFAULT_CC)
LDXX_valgrind = $(DEFAULT_CXX)
CPPFLAGS_valgrind = -O0
OPENSSL_CFLAGS_valgrind = -DPURIFY
LDFLAGS_valgrind =
DEFINES_valgrind = _DEBUG DEBUG GRPC_TEST_SLOWDOWN_BUILD_FACTOR=20

VALID_CONFIG_tsan = 1
REQUIRE_CUSTOM_LIBRARIES_tsan = 1
CC_tsan = clang
CXX_tsan = clang++
LD_tsan = clang
LDXX_tsan = clang++
CPPFLAGS_tsan = -O1 -fsanitize=thread -fno-omit-frame-pointer
LDFLAGS_tsan = -fsanitize=thread
DEFINES_tsan = NDEBUG GRPC_TEST_SLOWDOWN_BUILD_FACTOR=10

VALID_CONFIG_asan = 1
REQUIRE_CUSTOM_LIBRARIES_asan = 1
CC_asan = clang
CXX_asan = clang++
LD_asan = clang
LDXX_asan = clang++
CPPFLAGS_asan = -O0 -fsanitize=address -fno-omit-frame-pointer
LDFLAGS_asan = -fsanitize=address
DEFINES_asan = GRPC_TEST_SLOWDOWN_BUILD_FACTOR=5

VALID_CONFIG_msan = 1
REQUIRE_CUSTOM_LIBRARIES_msan = 1
CC_msan = clang
CXX_msan = clang++-libc++
LD_msan = clang
LDXX_msan = clang++-libc++
CPPFLAGS_msan = -O0 -fsanitize=memory -fsanitize-memory-track-origins -fno-omit-frame-pointer -DGTEST_HAS_TR1_TUPLE=0 -DGTEST_USE_OWN_TR1_TUPLE=1
OPENSSL_CFLAGS_msan = -DPURIFY
LDFLAGS_msan = -fsanitize=memory -DGTEST_HAS_TR1_TUPLE=0 -DGTEST_USE_OWN_TR1_TUPLE=1
DEFINES_msan = NDEBUG GRPC_TEST_SLOWDOWN_BUILD_FACTOR=20

VALID_CONFIG_ubsan = 1
REQUIRE_CUSTOM_LIBRARIES_ubsan = 1
CC_ubsan = clang
CXX_ubsan = clang++
LD_ubsan = clang
LDXX_ubsan = clang++
CPPFLAGS_ubsan = -O1 -fsanitize=undefined -fno-omit-frame-pointer
OPENSSL_CFLAGS_ubsan = -DPURIFY
LDFLAGS_ubsan = -fsanitize=undefined
DEFINES_ubsan = NDEBUG GRPC_TEST_SLOWDOWN_BUILD_FACTOR=10

VALID_CONFIG_gcov = 1
CC_gcov = gcc
CXX_gcov = g++
LD_gcov = gcc
LDXX_gcov = g++
CPPFLAGS_gcov = -O0 -fprofile-arcs -ftest-coverage
LDFLAGS_gcov = -fprofile-arcs -ftest-coverage
DEFINES_gcov = _DEBUG DEBUG


# General settings.
# You may want to change these depending on your system.

prefix ?= /usr/local

PROTOC = protoc
DTRACE = dtrace
CONFIG ?= opt
CC = $(CC_$(CONFIG))
CXX = $(CXX_$(CONFIG))
LD = $(LD_$(CONFIG))
LDXX = $(LDXX_$(CONFIG))
AR = ar
ifeq ($(SYSTEM),Linux)
STRIP = strip --strip-unneeded
else
ifeq ($(SYSTEM),Darwin)
STRIP = strip -x
else
STRIP = strip
endif
endif
INSTALL = install
RM = rm -f

ifndef VALID_CONFIG_$(CONFIG)
$(error Invalid CONFIG value '$(CONFIG)')
endif

ifeq ($(SYSTEM),Linux)
TMPOUT = /dev/null
else
TMPOUT = `mktemp /tmp/test-out-XXXXXX`
endif

# Detect if we can use C++11
CXX11_CHECK_CMD = $(CXX) -std=c++11 -o $(TMPOUT) -c test/build/c++11.cc
HAS_CXX11 = $(shell $(CXX11_CHECK_CMD) 2> /dev/null && echo true || echo false)

# The HOST compiler settings are used to compile the protoc plugins.
# In most cases, you won't have to change anything, but if you are
# cross-compiling, you can override these variables from GNU make's
# command line: make CC=cross-gcc HOST_CC=gcc

HOST_CC = $(CC)
HOST_CXX = $(CXX)
HOST_LD = $(LD)
HOST_LDXX = $(LDXX)

CPPFLAGS += $(CPPFLAGS_$(CONFIG))
DEFINES += $(DEFINES_$(CONFIG)) INSTALL_PREFIX=\"$(prefix)\"
LDFLAGS += $(LDFLAGS_$(CONFIG))

ifdef EXTRA_DEFINES
DEFINES += $(EXTRA_DEFINES)
endif

CFLAGS += -std=c89 -pedantic
ifeq ($(HAS_CXX11),true)
CXXFLAGS += -std=c++11
else
CXXFLAGS += -std=c++0x
endif
CPPFLAGS += -g -Wall -Wextra -Werror -Wno-long-long -Wno-unused-parameter
LDFLAGS += -g

ifneq ($(SYSTEM),MINGW32)
PIC_CPPFLAGS = -fPIC
CPPFLAGS += -fPIC
LDFLAGS += -fPIC
endif

INCLUDES = . include $(GENDIR)
ifeq ($(SYSTEM),Darwin)
ifneq ($(wildcard /usr/local/ssl/include),)
INCLUDES += /usr/local/ssl/include
endif
ifneq ($(wildcard /opt/local/include),)
INCLUDES += /opt/local/include
endif
ifneq ($(wildcard /usr/local/include),)
INCLUDES += /usr/local/include
endif
LIBS = m z
ifneq ($(wildcard /usr/local/ssl/lib),)
LDFLAGS += -L/usr/local/ssl/lib
endif
ifneq ($(wildcard /opt/local/lib),)
LDFLAGS += -L/opt/local/lib
endif
ifneq ($(wildcard /usr/local/lib),)
LDFLAGS += -L/usr/local/lib
endif
endif

ifeq ($(SYSTEM),Linux)
LIBS = rt m z pthread
LDFLAGS += -pthread
endif

ifeq ($(SYSTEM),MINGW32)
LIBS = m z pthread
LDFLAGS += -pthread
endif

ifneq ($(wildcard /usr/src/gtest/src/gtest-all.cc),)
GTEST_LIB = /usr/src/gtest/src/gtest-all.cc -I/usr/src/gtest
else
GTEST_LIB = -lgtest
endif
GTEST_LIB += -lgflags
ifeq ($(V),1)
E = @:
Q =
else
E = @echo
Q = @
endif

VERSION = 0.9.0.0

CPPFLAGS_NO_ARCH += $(addprefix -I, $(INCLUDES)) $(addprefix -D, $(DEFINES))
CPPFLAGS += $(CPPFLAGS_NO_ARCH) $(ARCH_FLAGS)

LDFLAGS += $(ARCH_FLAGS)
LDLIBS += $(addprefix -l, $(LIBS))
LDLIBSXX += $(addprefix -l, $(LIBSXX))

HOST_CPPFLAGS = $(CPPFLAGS)
HOST_CFLAGS = $(CFLAGS)
HOST_CXXFLAGS = $(CXXFLAGS)
HOST_LDFLAGS = $(LDFLAGS)
HOST_LDLIBS = $(LDLIBS)


# These are automatically computed variables.
# There shouldn't be any need to change anything from now on.

ifeq ($(SYSTEM),MINGW32)
SHARED_EXT = dll
endif
ifeq ($(SYSTEM),Darwin)
SHARED_EXT = dylib
endif
ifeq ($(SHARED_EXT),)
SHARED_EXT = so.$(VERSION)
endif

ifeq ($(wildcard .git),)
IS_GIT_FOLDER = false
else
IS_GIT_FOLDER = true
endif

ifeq ($(SYSTEM),Linux)
OPENSSL_REQUIRES_DL = true
endif

ifeq ($(SYSTEM),Darwin)
OPENSSL_REQUIRES_DL = true
endif

ifeq ($(SYSTEM),MINGW32)
OPENSSL_LIBS = ssl32 eay32
else
OPENSSL_LIBS = ssl crypto
endif

OPENSSL_ALPN_CHECK_CMD = $(CC) $(CFLAGS) $(CPPFLAGS) -o $(TMPOUT) test/build/openssl-alpn.c $(addprefix -l, $(OPENSSL_LIBS)) $(LDFLAGS)
ZLIB_CHECK_CMD = $(CC) $(CFLAGS) $(CPPFLAGS) -o $(TMPOUT) test/build/zlib.c -lz $(LDFLAGS)
PERFTOOLS_CHECK_CMD = $(CC) $(CFLAGS) $(CPPFLAGS) -o $(TMPOUT) test/build/perftools.c -lprofiler $(LDFLAGS)
PROTOBUF_CHECK_CMD = $(CXX) $(CXXFLAGS) $(CPPFLAGS) -o $(TMPOUT) test/build/protobuf.cc -lprotobuf $(LDFLAGS)
PROTOC_CHECK_CMD = which protoc > /dev/null
PROTOC_CHECK_VERSION_CMD = protoc --version | grep -q libprotoc.3
DTRACE_CHECK_CMD = which dtrace > /dev/null
SYSTEMTAP_HEADERS_CHECK_CMD = $(CC) $(CFLAGS) $(CPPFLAGS) -o $(TMPOUT) test/build/systemtap.c $(LDFLAGS)

ifeq ($(OPENSSL_REQUIRES_DL),true)
OPENSSL_ALPN_CHECK_CMD += -ldl
endif

ifndef REQUIRE_CUSTOM_LIBRARIES_$(CONFIG)
HAS_SYSTEM_PERFTOOLS = $(shell $(PERFTOOLS_CHECK_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_SYSTEM_PERFTOOLS),true)
DEFINES += GRPC_HAVE_PERFTOOLS
LIBS += profiler
endif
endif

HAS_SYSTEM_PROTOBUF_VERIFY = $(shell $(PROTOBUF_CHECK_CMD) 2> /dev/null && echo true || echo false)
ifndef REQUIRE_CUSTOM_LIBRARIES_$(CONFIG)
HAS_SYSTEM_OPENSSL_ALPN = $(shell $(OPENSSL_ALPN_CHECK_CMD) 2> /dev/null && echo true || echo false)
HAS_SYSTEM_ZLIB = $(shell $(ZLIB_CHECK_CMD) 2> /dev/null && echo true || echo false)
HAS_SYSTEM_PROTOBUF = $(HAS_SYSTEM_PROTOBUF_VERIFY)
else
# override system libraries if the config requires a custom compiled library
HAS_SYSTEM_OPENSSL_ALPN = false
HAS_SYSTEM_ZLIB = false
HAS_SYSTEM_PROTOBUF = false
endif

HAS_PROTOC = $(shell $(PROTOC_CHECK_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_PROTOC),true)
HAS_VALID_PROTOC = $(shell $(PROTOC_CHECK_VERSION_CMD) 2> /dev/null && echo true || echo false)
else
HAS_VALID_PROTOC = false
endif

# Check for Systemtap (https://sourceware.org/systemtap/), first by making sure <sys/sdt.h> is present
# in the system and secondly by checking for the "dtrace" binary (on Linux, this is part of the Systemtap
# distribution. It's part of the base system on BSD/Solaris machines).
HAS_SYSTEMTAP_HEADERS = $(shell $(SYSTEMTAP_HEADERS_CHECK_CMD) 2> /dev/null && echo true || echo false)
HAS_DTRACE = $(shell $(DTRACE_CHECK_CMD) 2> /dev/null && echo true || echo false)
HAS_SYSTEMTAP = false
ifeq ($(HAS_SYSTEMTAP_HEADERS),true)
ifeq ($(HAS_DTRACE),true)
HAS_SYSTEMTAP = true
endif
endif

ifeq ($(wildcard third_party/openssl/ssl/ssl.h),)
HAS_EMBEDDED_OPENSSL_ALPN = false
else
HAS_EMBEDDED_OPENSSL_ALPN = true
endif

ifeq ($(wildcard third_party/zlib/zlib.h),)
HAS_EMBEDDED_ZLIB = false
else
HAS_EMBEDDED_ZLIB = true
endif

ifeq ($(wildcard third_party/protobuf/src/google/protobuf/descriptor.pb.h),)
HAS_EMBEDDED_PROTOBUF = false
ifneq ($(HAS_VALID_PROTOC),true)
NO_PROTOC = true
endif
else
HAS_EMBEDDED_PROTOBUF = true
endif

ifeq ($(HAS_SYSTEM_ZLIB),false)
ifeq ($(HAS_EMBEDDED_ZLIB),true)
ZLIB_DEP = $(LIBDIR)/$(CONFIG)/zlib/libz.a
CPPFLAGS += -Ithird_party/zlib
LDFLAGS += -L$(LIBDIR)/$(CONFIG)/zlib
else
DEP_MISSING += zlib
endif
endif

ifeq ($(HAS_SYSTEM_OPENSSL_ALPN),false)
ifeq ($(HAS_EMBEDDED_OPENSSL_ALPN),true)
OPENSSL_DEP = $(LIBDIR)/$(CONFIG)/openssl/libssl.a
OPENSSL_MERGE_LIBS += $(LIBDIR)/$(CONFIG)/openssl/libssl.a $(LIBDIR)/$(CONFIG)/openssl/libcrypto.a
# need to prefix these to ensure overriding system libraries
CPPFLAGS := -Ithird_party/openssl/include $(CPPFLAGS)
LDFLAGS := -L$(LIBDIR)/$(CONFIG)/openssl $(LDFLAGS)
ifeq ($(OPENSSL_REQUIRES_DL),true)
LIBS_SECURE = dl
endif
else
NO_SECURE = true
endif
else
LIBS_SECURE = $(OPENSSL_LIBS)
ifeq ($(OPENSSL_REQUIRES_DL),true)
LIBS_SECURE += dl
endif
endif

LDLIBS_SECURE += $(addprefix -l, $(LIBS_SECURE))

ifeq ($(HAS_SYSTEM_PROTOBUF),false)
ifeq ($(HAS_EMBEDDED_PROTOBUF),true)
PROTOBUF_DEP = $(LIBDIR)/$(CONFIG)/protobuf/libprotobuf.a
CPPFLAGS := -Ithird_party/protobuf/src $(CPPFLAGS)
LDFLAGS := -L$(LIBDIR)/$(CONFIG)/protobuf $(LDFLAGS)
PROTOC = $(BINDIR)/$(CONFIG)/protobuf/protoc
else
NO_PROTOBUF = true
endif
else
endif

LIBS_PROTOBUF = protobuf
LIBS_PROTOC = protoc protobuf

LDLIBS_PROTOBUF += $(addprefix -l, $(LIBS_PROTOBUF))
HOST_LDLIBS_PROTOC += $(addprefix -l, $(LIBS_PROTOC))

ifeq ($(MAKECMDGOALS),clean)
NO_DEPS = true
endif

INSTALL_OK = false
ifeq ($(HAS_VALID_PROTOC),true)
ifeq ($(HAS_SYSTEM_PROTOBUF_VERIFY),true)
INSTALL_OK = true
endif
endif

.SECONDARY = %.pb.h %.pb.cc

PROTOC_PLUGINS = $(BINDIR)/$(CONFIG)/grpc_cpp_plugin $(BINDIR)/$(CONFIG)/grpc_csharp_plugin $(BINDIR)/$(CONFIG)/grpc_objective_c_plugin $(BINDIR)/$(CONFIG)/grpc_python_plugin $(BINDIR)/$(CONFIG)/grpc_ruby_plugin
ifeq ($(DEP_MISSING),)
all: static shared plugins
dep_error:
	@echo "You shouldn't see this message - all of your dependencies are correct."
else
all: dep_error git_update stop

dep_error:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "You are missing system dependencies that are essential to build grpc,"
	@echo "and the third_party directory doesn't have them:"
	@echo
	@echo "  $(DEP_MISSING)"
	@echo
	@echo "Installing the development packages for your system will solve"
	@echo "this issue. Please consult INSTALL to get more information."
	@echo
	@echo "If you need information about why these tests failed, run:"
	@echo
	@echo "  make run_dep_checks"
	@echo
endif

git_update:
ifeq ($(IS_GIT_FOLDER),true)
	@echo "Additionally, since you are in a git clone, you can download the"
	@echo "missing dependencies in third_party by running the following command:"
	@echo
	@echo "  git submodule update --init"
	@echo
endif

openssl_dep_error: openssl_dep_message git_update stop

protobuf_dep_error: protobuf_dep_message git_update stop

protoc_dep_error: protoc_dep_message git_update stop

openssl_dep_message:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "The target you are trying to run requires OpenSSL with ALPN support."
	@echo "Your system doesn't have it, and neither does the third_party directory."
	@echo
	@echo "Please consult INSTALL to get more information."
	@echo
	@echo "If you need information about why these tests failed, run:"
	@echo
	@echo "  make run_dep_checks"
	@echo

protobuf_dep_message:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "The target you are trying to run requires protobuf 3.0.0+"
	@echo "Your system doesn't have it, and neither does the third_party directory."
	@echo
	@echo "Please consult INSTALL to get more information."
	@echo
	@echo "If you need information about why these tests failed, run:"
	@echo
	@echo "  make run_dep_checks"
	@echo

protoc_dep_message:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "The target you are trying to run requires protobuf-compiler 3.0.0+"
	@echo "Your system doesn't have it, and neither does the third_party directory."
	@echo
	@echo "Please consult INSTALL to get more information."
	@echo
	@echo "If you need information about why these tests failed, run:"
	@echo
	@echo "  make run_dep_checks"
	@echo

systemtap_dep_error:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "Under the '$(CONFIG)' configutation, the target you are trying "
	@echo "to build requires systemtap 2.7+ (on Linux) or dtrace (on other "
	@echo "platforms such as Solaris and *BSD). "
	@echo
	@echo "Please consult INSTALL to get more information."
	@echo

stop:
	@false

alarm_heap_test: $(BINDIR)/$(CONFIG)/alarm_heap_test
alarm_list_test: $(BINDIR)/$(CONFIG)/alarm_list_test
alarm_test: $(BINDIR)/$(CONFIG)/alarm_test
alpn_test: $(BINDIR)/$(CONFIG)/alpn_test
bin_encoder_test: $(BINDIR)/$(CONFIG)/bin_encoder_test
census_hash_table_test: $(BINDIR)/$(CONFIG)/census_hash_table_test
census_statistics_multiple_writers_circular_buffer_test: $(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_circular_buffer_test
census_statistics_multiple_writers_test: $(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_test
census_statistics_performance_test: $(BINDIR)/$(CONFIG)/census_statistics_performance_test
census_statistics_quick_test: $(BINDIR)/$(CONFIG)/census_statistics_quick_test
census_statistics_small_log_test: $(BINDIR)/$(CONFIG)/census_statistics_small_log_test
census_stats_store_test: $(BINDIR)/$(CONFIG)/census_stats_store_test
census_stub_test: $(BINDIR)/$(CONFIG)/census_stub_test
census_trace_store_test: $(BINDIR)/$(CONFIG)/census_trace_store_test
census_window_stats_test: $(BINDIR)/$(CONFIG)/census_window_stats_test
chttp2_status_conversion_test: $(BINDIR)/$(CONFIG)/chttp2_status_conversion_test
chttp2_stream_encoder_test: $(BINDIR)/$(CONFIG)/chttp2_stream_encoder_test
chttp2_stream_map_test: $(BINDIR)/$(CONFIG)/chttp2_stream_map_test
dualstack_socket_test: $(BINDIR)/$(CONFIG)/dualstack_socket_test
fd_posix_test: $(BINDIR)/$(CONFIG)/fd_posix_test
fling_client: $(BINDIR)/$(CONFIG)/fling_client
fling_server: $(BINDIR)/$(CONFIG)/fling_server
fling_stream_test: $(BINDIR)/$(CONFIG)/fling_stream_test
fling_test: $(BINDIR)/$(CONFIG)/fling_test
gen_hpack_tables: $(BINDIR)/$(CONFIG)/gen_hpack_tables
gpr_cancellable_test: $(BINDIR)/$(CONFIG)/gpr_cancellable_test
gpr_cmdline_test: $(BINDIR)/$(CONFIG)/gpr_cmdline_test
gpr_env_test: $(BINDIR)/$(CONFIG)/gpr_env_test
gpr_file_test: $(BINDIR)/$(CONFIG)/gpr_file_test
gpr_histogram_test: $(BINDIR)/$(CONFIG)/gpr_histogram_test
gpr_host_port_test: $(BINDIR)/$(CONFIG)/gpr_host_port_test
gpr_log_test: $(BINDIR)/$(CONFIG)/gpr_log_test
gpr_slice_buffer_test: $(BINDIR)/$(CONFIG)/gpr_slice_buffer_test
gpr_slice_test: $(BINDIR)/$(CONFIG)/gpr_slice_test
gpr_string_test: $(BINDIR)/$(CONFIG)/gpr_string_test
gpr_sync_test: $(BINDIR)/$(CONFIG)/gpr_sync_test
gpr_thd_test: $(BINDIR)/$(CONFIG)/gpr_thd_test
gpr_time_test: $(BINDIR)/$(CONFIG)/gpr_time_test
gpr_tls_test: $(BINDIR)/$(CONFIG)/gpr_tls_test
gpr_useful_test: $(BINDIR)/$(CONFIG)/gpr_useful_test
grpc_auth_context_test: $(BINDIR)/$(CONFIG)/grpc_auth_context_test
grpc_base64_test: $(BINDIR)/$(CONFIG)/grpc_base64_test
grpc_byte_buffer_reader_test: $(BINDIR)/$(CONFIG)/grpc_byte_buffer_reader_test
grpc_channel_stack_test: $(BINDIR)/$(CONFIG)/grpc_channel_stack_test
grpc_completion_queue_test: $(BINDIR)/$(CONFIG)/grpc_completion_queue_test
grpc_create_jwt: $(BINDIR)/$(CONFIG)/grpc_create_jwt
grpc_credentials_test: $(BINDIR)/$(CONFIG)/grpc_credentials_test
grpc_fetch_oauth2: $(BINDIR)/$(CONFIG)/grpc_fetch_oauth2
grpc_json_token_test: $(BINDIR)/$(CONFIG)/grpc_json_token_test
grpc_print_google_default_creds_token: $(BINDIR)/$(CONFIG)/grpc_print_google_default_creds_token
grpc_stream_op_test: $(BINDIR)/$(CONFIG)/grpc_stream_op_test
hpack_parser_test: $(BINDIR)/$(CONFIG)/hpack_parser_test
hpack_table_test: $(BINDIR)/$(CONFIG)/hpack_table_test
httpcli_format_request_test: $(BINDIR)/$(CONFIG)/httpcli_format_request_test
httpcli_parser_test: $(BINDIR)/$(CONFIG)/httpcli_parser_test
httpcli_test: $(BINDIR)/$(CONFIG)/httpcli_test
json_rewrite: $(BINDIR)/$(CONFIG)/json_rewrite
json_rewrite_test: $(BINDIR)/$(CONFIG)/json_rewrite_test
json_test: $(BINDIR)/$(CONFIG)/json_test
lame_client_test: $(BINDIR)/$(CONFIG)/lame_client_test
low_level_ping_pong_benchmark: $(BINDIR)/$(CONFIG)/low_level_ping_pong_benchmark
message_compress_test: $(BINDIR)/$(CONFIG)/message_compress_test
multi_init_test: $(BINDIR)/$(CONFIG)/multi_init_test
murmur_hash_test: $(BINDIR)/$(CONFIG)/murmur_hash_test
no_server_test: $(BINDIR)/$(CONFIG)/no_server_test
poll_kick_posix_test: $(BINDIR)/$(CONFIG)/poll_kick_posix_test
resolve_address_test: $(BINDIR)/$(CONFIG)/resolve_address_test
secure_endpoint_test: $(BINDIR)/$(CONFIG)/secure_endpoint_test
sockaddr_utils_test: $(BINDIR)/$(CONFIG)/sockaddr_utils_test
tcp_client_posix_test: $(BINDIR)/$(CONFIG)/tcp_client_posix_test
tcp_posix_test: $(BINDIR)/$(CONFIG)/tcp_posix_test
tcp_server_posix_test: $(BINDIR)/$(CONFIG)/tcp_server_posix_test
time_averaged_stats_test: $(BINDIR)/$(CONFIG)/time_averaged_stats_test
time_test: $(BINDIR)/$(CONFIG)/time_test
timeout_encoding_test: $(BINDIR)/$(CONFIG)/timeout_encoding_test
timers_test: $(BINDIR)/$(CONFIG)/timers_test
transport_metadata_test: $(BINDIR)/$(CONFIG)/transport_metadata_test
transport_security_test: $(BINDIR)/$(CONFIG)/transport_security_test
async_end2end_test: $(BINDIR)/$(CONFIG)/async_end2end_test
async_streaming_ping_pong_test: $(BINDIR)/$(CONFIG)/async_streaming_ping_pong_test
async_unary_ping_pong_test: $(BINDIR)/$(CONFIG)/async_unary_ping_pong_test
channel_arguments_test: $(BINDIR)/$(CONFIG)/channel_arguments_test
cli_call_test: $(BINDIR)/$(CONFIG)/cli_call_test
credentials_test: $(BINDIR)/$(CONFIG)/credentials_test
cxx_time_test: $(BINDIR)/$(CONFIG)/cxx_time_test
end2end_test: $(BINDIR)/$(CONFIG)/end2end_test
generic_end2end_test: $(BINDIR)/$(CONFIG)/generic_end2end_test
grpc_cli: $(BINDIR)/$(CONFIG)/grpc_cli
grpc_cpp_plugin: $(BINDIR)/$(CONFIG)/grpc_cpp_plugin
grpc_csharp_plugin: $(BINDIR)/$(CONFIG)/grpc_csharp_plugin
grpc_objective_c_plugin: $(BINDIR)/$(CONFIG)/grpc_objective_c_plugin
grpc_python_plugin: $(BINDIR)/$(CONFIG)/grpc_python_plugin
grpc_ruby_plugin: $(BINDIR)/$(CONFIG)/grpc_ruby_plugin
interop_client: $(BINDIR)/$(CONFIG)/interop_client
interop_server: $(BINDIR)/$(CONFIG)/interop_server
interop_test: $(BINDIR)/$(CONFIG)/interop_test
mock_test: $(BINDIR)/$(CONFIG)/mock_test
pubsub_client: $(BINDIR)/$(CONFIG)/pubsub_client
pubsub_publisher_test: $(BINDIR)/$(CONFIG)/pubsub_publisher_test
pubsub_subscriber_test: $(BINDIR)/$(CONFIG)/pubsub_subscriber_test
qps_driver: $(BINDIR)/$(CONFIG)/qps_driver
qps_test: $(BINDIR)/$(CONFIG)/qps_test
qps_worker: $(BINDIR)/$(CONFIG)/qps_worker
status_test: $(BINDIR)/$(CONFIG)/status_test
sync_streaming_ping_pong_test: $(BINDIR)/$(CONFIG)/sync_streaming_ping_pong_test
sync_unary_ping_pong_test: $(BINDIR)/$(CONFIG)/sync_unary_ping_pong_test
thread_pool_test: $(BINDIR)/$(CONFIG)/thread_pool_test
thread_stress_test: $(BINDIR)/$(CONFIG)/thread_stress_test
chttp2_fake_security_bad_hostname_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_bad_hostname_test
chttp2_fake_security_cancel_after_accept_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_test
chttp2_fake_security_cancel_after_accept_and_writes_closed_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_and_writes_closed_test
chttp2_fake_security_cancel_after_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_invoke_test
chttp2_fake_security_cancel_before_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_before_invoke_test
chttp2_fake_security_cancel_in_a_vacuum_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_in_a_vacuum_test
chttp2_fake_security_census_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_census_simple_request_test
chttp2_fake_security_disappearing_server_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_disappearing_server_test
chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test
chttp2_fake_security_early_server_shutdown_finishes_tags_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_tags_test
chttp2_fake_security_empty_batch_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_empty_batch_test
chttp2_fake_security_graceful_server_shutdown_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_graceful_server_shutdown_test
chttp2_fake_security_invoke_large_request_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_invoke_large_request_test
chttp2_fake_security_max_concurrent_streams_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_max_concurrent_streams_test
chttp2_fake_security_max_message_length_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_max_message_length_test
chttp2_fake_security_no_op_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_no_op_test
chttp2_fake_security_ping_pong_streaming_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_ping_pong_streaming_test
chttp2_fake_security_registered_call_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_registered_call_test
chttp2_fake_security_request_response_with_binary_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_binary_metadata_and_payload_test
chttp2_fake_security_request_response_with_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_metadata_and_payload_test
chttp2_fake_security_request_response_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_test
chttp2_fake_security_request_response_with_payload_and_call_creds_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_and_call_creds_test
chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test
chttp2_fake_security_request_with_large_metadata_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_large_metadata_test
chttp2_fake_security_request_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_payload_test
chttp2_fake_security_server_finishes_request_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_server_finishes_request_test
chttp2_fake_security_simple_delayed_request_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_delayed_request_test
chttp2_fake_security_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_test
chttp2_fake_security_simple_request_with_high_initial_sequence_number_test: $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_with_high_initial_sequence_number_test
chttp2_fullstack_bad_hostname_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_test
chttp2_fullstack_cancel_after_accept_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_test
chttp2_fullstack_cancel_after_accept_and_writes_closed_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_test
chttp2_fullstack_cancel_after_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_test
chttp2_fullstack_cancel_before_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_test
chttp2_fullstack_cancel_in_a_vacuum_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_test
chttp2_fullstack_census_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_test
chttp2_fullstack_disappearing_server_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_test
chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test
chttp2_fullstack_early_server_shutdown_finishes_tags_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_test
chttp2_fullstack_empty_batch_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_test
chttp2_fullstack_graceful_server_shutdown_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_test
chttp2_fullstack_invoke_large_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_test
chttp2_fullstack_max_concurrent_streams_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_test
chttp2_fullstack_max_message_length_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_test
chttp2_fullstack_no_op_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_test
chttp2_fullstack_ping_pong_streaming_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_test
chttp2_fullstack_registered_call_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_test
chttp2_fullstack_request_response_with_binary_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_test
chttp2_fullstack_request_response_with_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_test
chttp2_fullstack_request_response_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_test
chttp2_fullstack_request_response_with_payload_and_call_creds_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_and_call_creds_test
chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test
chttp2_fullstack_request_with_large_metadata_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_test
chttp2_fullstack_request_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_test
chttp2_fullstack_server_finishes_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_test
chttp2_fullstack_simple_delayed_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_test
chttp2_fullstack_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_test
chttp2_fullstack_simple_request_with_high_initial_sequence_number_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_test
chttp2_fullstack_uds_posix_bad_hostname_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_test
chttp2_fullstack_uds_posix_cancel_after_accept_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_test
chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_test
chttp2_fullstack_uds_posix_cancel_after_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_test
chttp2_fullstack_uds_posix_cancel_before_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_test
chttp2_fullstack_uds_posix_cancel_in_a_vacuum_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_test
chttp2_fullstack_uds_posix_census_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_test
chttp2_fullstack_uds_posix_disappearing_server_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_test
chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_test
chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_test
chttp2_fullstack_uds_posix_empty_batch_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_test
chttp2_fullstack_uds_posix_graceful_server_shutdown_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_test
chttp2_fullstack_uds_posix_invoke_large_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_test
chttp2_fullstack_uds_posix_max_concurrent_streams_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_test
chttp2_fullstack_uds_posix_max_message_length_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_test
chttp2_fullstack_uds_posix_no_op_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_test
chttp2_fullstack_uds_posix_ping_pong_streaming_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_test
chttp2_fullstack_uds_posix_registered_call_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_test
chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_test
chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_test
chttp2_fullstack_uds_posix_request_response_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_test
chttp2_fullstack_uds_posix_request_response_with_payload_and_call_creds_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_and_call_creds_test
chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_test
chttp2_fullstack_uds_posix_request_with_large_metadata_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_test
chttp2_fullstack_uds_posix_request_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_test
chttp2_fullstack_uds_posix_server_finishes_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_test
chttp2_fullstack_uds_posix_simple_delayed_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_test
chttp2_fullstack_uds_posix_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_test
chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_test
chttp2_simple_ssl_fullstack_bad_hostname_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_bad_hostname_test
chttp2_simple_ssl_fullstack_cancel_after_accept_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_test
chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test
chttp2_simple_ssl_fullstack_cancel_after_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_invoke_test
chttp2_simple_ssl_fullstack_cancel_before_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_before_invoke_test
chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test
chttp2_simple_ssl_fullstack_census_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_census_simple_request_test
chttp2_simple_ssl_fullstack_disappearing_server_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_disappearing_server_test
chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test
chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test
chttp2_simple_ssl_fullstack_empty_batch_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_empty_batch_test
chttp2_simple_ssl_fullstack_graceful_server_shutdown_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_graceful_server_shutdown_test
chttp2_simple_ssl_fullstack_invoke_large_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_invoke_large_request_test
chttp2_simple_ssl_fullstack_max_concurrent_streams_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_concurrent_streams_test
chttp2_simple_ssl_fullstack_max_message_length_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_message_length_test
chttp2_simple_ssl_fullstack_no_op_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_no_op_test
chttp2_simple_ssl_fullstack_ping_pong_streaming_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_ping_pong_streaming_test
chttp2_simple_ssl_fullstack_registered_call_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_registered_call_test
chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test
chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test
chttp2_simple_ssl_fullstack_request_response_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_test
chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test
chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test
chttp2_simple_ssl_fullstack_request_with_large_metadata_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_large_metadata_test
chttp2_simple_ssl_fullstack_request_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_payload_test
chttp2_simple_ssl_fullstack_server_finishes_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_server_finishes_request_test
chttp2_simple_ssl_fullstack_simple_delayed_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_delayed_request_test
chttp2_simple_ssl_fullstack_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_test
chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test
chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test
chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test
chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test
chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test
chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test
chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test
chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test
chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test
chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test
chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test
chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test
chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test
chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test
chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test
chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test
chttp2_simple_ssl_with_oauth2_fullstack_no_op_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_no_op_test
chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test
chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test
chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test
chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test
chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test
chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test
chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test
chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test
chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test
chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test
chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test
chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test
chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test: $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test
chttp2_socket_pair_bad_hostname_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_test
chttp2_socket_pair_cancel_after_accept_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_test
chttp2_socket_pair_cancel_after_accept_and_writes_closed_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_test
chttp2_socket_pair_cancel_after_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_test
chttp2_socket_pair_cancel_before_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_test
chttp2_socket_pair_cancel_in_a_vacuum_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_test
chttp2_socket_pair_census_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_test
chttp2_socket_pair_disappearing_server_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_test
chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test
chttp2_socket_pair_early_server_shutdown_finishes_tags_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_test
chttp2_socket_pair_empty_batch_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_test
chttp2_socket_pair_graceful_server_shutdown_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_test
chttp2_socket_pair_invoke_large_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_test
chttp2_socket_pair_max_concurrent_streams_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_test
chttp2_socket_pair_max_message_length_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_test
chttp2_socket_pair_no_op_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_test
chttp2_socket_pair_ping_pong_streaming_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_test
chttp2_socket_pair_registered_call_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_test
chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test
chttp2_socket_pair_request_response_with_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_test
chttp2_socket_pair_request_response_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_test
chttp2_socket_pair_request_response_with_payload_and_call_creds_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_and_call_creds_test
chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test
chttp2_socket_pair_request_with_large_metadata_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_test
chttp2_socket_pair_request_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_test
chttp2_socket_pair_server_finishes_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_test
chttp2_socket_pair_simple_delayed_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_test
chttp2_socket_pair_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_test
chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test
chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test
chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test
chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test
chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test
chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test
chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test
chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test
chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test
chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test
chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test
chttp2_socket_pair_one_byte_at_a_time_empty_batch_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_test
chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test
chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test
chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test
chttp2_socket_pair_one_byte_at_a_time_max_message_length_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_test
chttp2_socket_pair_one_byte_at_a_time_no_op_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_test
chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test
chttp2_socket_pair_one_byte_at_a_time_registered_call_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_test
chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test
chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test
chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test
chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test
chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test
chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test
chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test
chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test
chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test
chttp2_socket_pair_one_byte_at_a_time_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_test
chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test
chttp2_socket_pair_with_grpc_trace_bad_hostname_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_test
chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test
chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test
chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test
chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test
chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test
chttp2_socket_pair_with_grpc_trace_census_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_test
chttp2_socket_pair_with_grpc_trace_disappearing_server_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_test
chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test
chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test
chttp2_socket_pair_with_grpc_trace_empty_batch_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_test
chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test
chttp2_socket_pair_with_grpc_trace_invoke_large_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_test
chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test
chttp2_socket_pair_with_grpc_trace_max_message_length_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_test
chttp2_socket_pair_with_grpc_trace_no_op_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_test
chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test
chttp2_socket_pair_with_grpc_trace_registered_call_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_test
chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test
chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test
chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test
chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test
chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test
chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test
chttp2_socket_pair_with_grpc_trace_request_with_payload_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_test
chttp2_socket_pair_with_grpc_trace_server_finishes_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_test
chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test
chttp2_socket_pair_with_grpc_trace_simple_request_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_test
chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test
chttp2_fullstack_bad_hostname_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_unsecure_test
chttp2_fullstack_cancel_after_accept_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_unsecure_test
chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test
chttp2_fullstack_cancel_after_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_unsecure_test
chttp2_fullstack_cancel_before_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_unsecure_test
chttp2_fullstack_cancel_in_a_vacuum_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_unsecure_test
chttp2_fullstack_census_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_unsecure_test
chttp2_fullstack_disappearing_server_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_unsecure_test
chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test
chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test
chttp2_fullstack_empty_batch_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_unsecure_test
chttp2_fullstack_graceful_server_shutdown_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_unsecure_test
chttp2_fullstack_invoke_large_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_unsecure_test
chttp2_fullstack_max_concurrent_streams_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_unsecure_test
chttp2_fullstack_max_message_length_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_unsecure_test
chttp2_fullstack_no_op_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_unsecure_test
chttp2_fullstack_ping_pong_streaming_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_unsecure_test
chttp2_fullstack_registered_call_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_unsecure_test
chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test
chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test
chttp2_fullstack_request_response_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_unsecure_test
chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test
chttp2_fullstack_request_with_large_metadata_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_unsecure_test
chttp2_fullstack_request_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_unsecure_test
chttp2_fullstack_server_finishes_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_unsecure_test
chttp2_fullstack_simple_delayed_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_unsecure_test
chttp2_fullstack_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_unsecure_test
chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test
chttp2_fullstack_uds_posix_bad_hostname_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_unsecure_test
chttp2_fullstack_uds_posix_cancel_after_accept_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_unsecure_test
chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_unsecure_test
chttp2_fullstack_uds_posix_cancel_after_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_unsecure_test
chttp2_fullstack_uds_posix_cancel_before_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_unsecure_test
chttp2_fullstack_uds_posix_cancel_in_a_vacuum_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_unsecure_test
chttp2_fullstack_uds_posix_census_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_unsecure_test
chttp2_fullstack_uds_posix_disappearing_server_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_unsecure_test
chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_unsecure_test
chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_unsecure_test
chttp2_fullstack_uds_posix_empty_batch_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_unsecure_test
chttp2_fullstack_uds_posix_graceful_server_shutdown_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_unsecure_test
chttp2_fullstack_uds_posix_invoke_large_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_unsecure_test
chttp2_fullstack_uds_posix_max_concurrent_streams_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_unsecure_test
chttp2_fullstack_uds_posix_max_message_length_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_unsecure_test
chttp2_fullstack_uds_posix_no_op_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_unsecure_test
chttp2_fullstack_uds_posix_ping_pong_streaming_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_unsecure_test
chttp2_fullstack_uds_posix_registered_call_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_unsecure_test
chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_unsecure_test
chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_unsecure_test
chttp2_fullstack_uds_posix_request_response_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_unsecure_test
chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_unsecure_test
chttp2_fullstack_uds_posix_request_with_large_metadata_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_unsecure_test
chttp2_fullstack_uds_posix_request_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_unsecure_test
chttp2_fullstack_uds_posix_server_finishes_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_unsecure_test
chttp2_fullstack_uds_posix_simple_delayed_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_unsecure_test
chttp2_fullstack_uds_posix_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_unsecure_test
chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_unsecure_test
chttp2_socket_pair_bad_hostname_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_unsecure_test
chttp2_socket_pair_cancel_after_accept_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_unsecure_test
chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test
chttp2_socket_pair_cancel_after_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_unsecure_test
chttp2_socket_pair_cancel_before_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_unsecure_test
chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test
chttp2_socket_pair_census_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_unsecure_test
chttp2_socket_pair_disappearing_server_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_unsecure_test
chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test
chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test
chttp2_socket_pair_empty_batch_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_unsecure_test
chttp2_socket_pair_graceful_server_shutdown_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_unsecure_test
chttp2_socket_pair_invoke_large_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_unsecure_test
chttp2_socket_pair_max_concurrent_streams_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_unsecure_test
chttp2_socket_pair_max_message_length_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_unsecure_test
chttp2_socket_pair_no_op_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_unsecure_test
chttp2_socket_pair_ping_pong_streaming_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_unsecure_test
chttp2_socket_pair_registered_call_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_unsecure_test
chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test
chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test
chttp2_socket_pair_request_response_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_unsecure_test
chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test
chttp2_socket_pair_request_with_large_metadata_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_unsecure_test
chttp2_socket_pair_request_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_unsecure_test
chttp2_socket_pair_server_finishes_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_unsecure_test
chttp2_socket_pair_simple_delayed_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_unsecure_test
chttp2_socket_pair_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_unsecure_test
chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test
chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test
chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test
chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test
chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test
chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test
chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test
chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test
chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test
chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test
chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test
chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test
chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test
chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test
chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test
chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test
chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test
chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test
chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test
chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test
chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test
chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test
chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test
chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test
chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test
chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test
chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test
chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test
chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test
chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test: $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test

run_dep_checks:
	$(OPENSSL_ALPN_CHECK_CMD) || true
	$(ZLIB_CHECK_CMD) || true
	$(PERFTOOLS_CHECK_CMD) || true
	$(PROTOBUF_CHECK_CMD) || true
	$(PROTOC_CHECK_VERSION_CMD) || true

$(LIBDIR)/$(CONFIG)/zlib/libz.a:
	$(E) "[MAKE]    Building zlib"
	$(Q)(cd third_party/zlib ; CC="$(CC)" CFLAGS="$(PIC_CPPFLAGS) -fvisibility=hidden $(CPPFLAGS_$(CONFIG))" ./configure --static)
	$(Q)$(MAKE) -C third_party/zlib clean
	$(Q)$(MAKE) -C third_party/zlib
	$(Q)mkdir -p $(LIBDIR)/$(CONFIG)/zlib
	$(Q)cp third_party/zlib/libz.a $(LIBDIR)/$(CONFIG)/zlib

$(LIBDIR)/$(CONFIG)/openssl/libssl.a:
	$(E) "[MAKE]    Building openssl for $(SYSTEM)"
ifeq ($(SYSTEM),Darwin)
	$(Q)(cd third_party/openssl ; CC="$(CC) $(PIC_CPPFLAGS) -fvisibility=hidden $(CPPFLAGS_$(CONFIG)) $(OPENSSL_CFLAGS_$(CONFIG))" ./Configure darwin64-x86_64-cc)
else
ifeq ($(SYSTEM),MINGW32)
	@echo "We currently don't have a good way to compile OpenSSL in-place under msys."
	@echo "Please provide an ALPN-capable OpenSSL in your mingw32 system."
	@echo
	@echo "Note that you can find a compatible version of the libraries here:"
	@echo
	@echo "http://slproweb.com/products/Win32OpenSSL.html"
	@echo
	@echo "If you decide to install that one, take the full version. The light"
	@echo "version only contains compiled DLLs, without the development files."
	@echo
	@echo "When installing, chose to copy the OpenSSL dlls to the OpenSSL binaries"
	@echo "directory. This way we'll link to them directly."
	@echo
	@echo "You can then re-start the build the following way:"
	@echo
	@echo "  CPPFLAGS=-I/c/OpenSSL-Win64/include LDFLAGS=-L/c/OpenSSL-Win64 make"
	@false
else
	$(Q)(cd third_party/openssl ; CC="$(CC) $(PIC_CPPFLAGS) -fvisibility=hidden $(CPPFLAGS_$(CONFIG)) $(OPENSSL_CFLAGS_$(CONFIG))" ./config no-asm $(OPENSSL_CONFIG_$(CONFIG)))
endif
endif
	$(Q)$(MAKE) -C third_party/openssl clean
	$(Q)$(MAKE) -C third_party/openssl build_crypto build_ssl
	$(Q)mkdir -p $(LIBDIR)/$(CONFIG)/openssl
	$(Q)cp third_party/openssl/libssl.a third_party/openssl/libcrypto.a $(LIBDIR)/$(CONFIG)/openssl

third_party/protobuf/configure:
	$(E) "[AUTOGEN] Preparing protobuf"
	$(Q)(cd third_party/protobuf ; autoreconf -f -i -Wall,no-obsolete)

$(LIBDIR)/$(CONFIG)/protobuf/libprotobuf.a: third_party/protobuf/configure
	$(E) "[MAKE]    Building protobuf"
	$(Q)(cd third_party/protobuf ; CC="$(CC)" CXX="$(CXX)" LDFLAGS="$(LDFLAGS_$(CONFIG)) -g" CPPFLAGS="$(PIC_CPPFLAGS) $(CPPFLAGS_$(CONFIG)) -g" ./configure --disable-shared --enable-static)
	$(Q)$(MAKE) -C third_party/protobuf clean
	$(Q)$(MAKE) -C third_party/protobuf
	$(Q)mkdir -p $(LIBDIR)/$(CONFIG)/protobuf
	$(Q)mkdir -p $(BINDIR)/$(CONFIG)/protobuf
	$(Q)cp third_party/protobuf/src/.libs/libprotoc.a $(LIBDIR)/$(CONFIG)/protobuf
	$(Q)cp third_party/protobuf/src/.libs/libprotobuf.a $(LIBDIR)/$(CONFIG)/protobuf
	$(Q)cp third_party/protobuf/src/protoc $(BINDIR)/$(CONFIG)/protobuf

static: static_c static_cxx

static_c:  $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a

static_cxx:  $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a

shared: shared_c shared_cxx

shared_c:  $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.$(SHARED_EXT)

shared_cxx:  $(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.$(SHARED_EXT)

shared_csharp: shared_c  $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.$(SHARED_EXT)
grpc_csharp_ext: shared_csharp

plugins: $(PROTOC_PLUGINS)

privatelibs: privatelibs_c privatelibs_cxx

privatelibs_c:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a

privatelibs_cxx:  $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libinterop_client_helper.a $(LIBDIR)/$(CONFIG)/libinterop_client_main.a $(LIBDIR)/$(CONFIG)/libinterop_server_helper.a $(LIBDIR)/$(CONFIG)/libinterop_server_main.a $(LIBDIR)/$(CONFIG)/libqps.a

buildtests: buildtests_c buildtests_cxx

buildtests_c: privatelibs_c $(BINDIR)/$(CONFIG)/alarm_heap_test $(BINDIR)/$(CONFIG)/alarm_list_test $(BINDIR)/$(CONFIG)/alarm_test $(BINDIR)/$(CONFIG)/alpn_test $(BINDIR)/$(CONFIG)/bin_encoder_test $(BINDIR)/$(CONFIG)/census_hash_table_test $(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_circular_buffer_test $(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_test $(BINDIR)/$(CONFIG)/census_statistics_performance_test $(BINDIR)/$(CONFIG)/census_statistics_quick_test $(BINDIR)/$(CONFIG)/census_statistics_small_log_test $(BINDIR)/$(CONFIG)/census_stub_test $(BINDIR)/$(CONFIG)/census_window_stats_test $(BINDIR)/$(CONFIG)/chttp2_status_conversion_test $(BINDIR)/$(CONFIG)/chttp2_stream_encoder_test $(BINDIR)/$(CONFIG)/chttp2_stream_map_test $(BINDIR)/$(CONFIG)/dualstack_socket_test $(BINDIR)/$(CONFIG)/fd_posix_test $(BINDIR)/$(CONFIG)/fling_client $(BINDIR)/$(CONFIG)/fling_server $(BINDIR)/$(CONFIG)/fling_stream_test $(BINDIR)/$(CONFIG)/fling_test $(BINDIR)/$(CONFIG)/gpr_cancellable_test $(BINDIR)/$(CONFIG)/gpr_cmdline_test $(BINDIR)/$(CONFIG)/gpr_env_test $(BINDIR)/$(CONFIG)/gpr_file_test $(BINDIR)/$(CONFIG)/gpr_histogram_test $(BINDIR)/$(CONFIG)/gpr_host_port_test $(BINDIR)/$(CONFIG)/gpr_log_test $(BINDIR)/$(CONFIG)/gpr_slice_buffer_test $(BINDIR)/$(CONFIG)/gpr_slice_test $(BINDIR)/$(CONFIG)/gpr_string_test $(BINDIR)/$(CONFIG)/gpr_sync_test $(BINDIR)/$(CONFIG)/gpr_thd_test $(BINDIR)/$(CONFIG)/gpr_time_test $(BINDIR)/$(CONFIG)/gpr_tls_test $(BINDIR)/$(CONFIG)/gpr_useful_test $(BINDIR)/$(CONFIG)/grpc_auth_context_test $(BINDIR)/$(CONFIG)/grpc_base64_test $(BINDIR)/$(CONFIG)/grpc_byte_buffer_reader_test $(BINDIR)/$(CONFIG)/grpc_channel_stack_test $(BINDIR)/$(CONFIG)/grpc_completion_queue_test $(BINDIR)/$(CONFIG)/grpc_credentials_test $(BINDIR)/$(CONFIG)/grpc_json_token_test $(BINDIR)/$(CONFIG)/grpc_stream_op_test $(BINDIR)/$(CONFIG)/hpack_parser_test $(BINDIR)/$(CONFIG)/hpack_table_test $(BINDIR)/$(CONFIG)/httpcli_format_request_test $(BINDIR)/$(CONFIG)/httpcli_parser_test $(BINDIR)/$(CONFIG)/httpcli_test $(BINDIR)/$(CONFIG)/json_rewrite $(BINDIR)/$(CONFIG)/json_rewrite_test $(BINDIR)/$(CONFIG)/json_test $(BINDIR)/$(CONFIG)/lame_client_test $(BINDIR)/$(CONFIG)/message_compress_test $(BINDIR)/$(CONFIG)/multi_init_test $(BINDIR)/$(CONFIG)/murmur_hash_test $(BINDIR)/$(CONFIG)/no_server_test $(BINDIR)/$(CONFIG)/poll_kick_posix_test $(BINDIR)/$(CONFIG)/resolve_address_test $(BINDIR)/$(CONFIG)/secure_endpoint_test $(BINDIR)/$(CONFIG)/sockaddr_utils_test $(BINDIR)/$(CONFIG)/tcp_client_posix_test $(BINDIR)/$(CONFIG)/tcp_posix_test $(BINDIR)/$(CONFIG)/tcp_server_posix_test $(BINDIR)/$(CONFIG)/time_averaged_stats_test $(BINDIR)/$(CONFIG)/time_test $(BINDIR)/$(CONFIG)/timeout_encoding_test $(BINDIR)/$(CONFIG)/timers_test $(BINDIR)/$(CONFIG)/transport_metadata_test $(BINDIR)/$(CONFIG)/transport_security_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_bad_hostname_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_and_writes_closed_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_invoke_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_before_invoke_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_in_a_vacuum_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_census_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_disappearing_server_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_tags_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_empty_batch_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_graceful_server_shutdown_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_invoke_large_request_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_max_concurrent_streams_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_max_message_length_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_no_op_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_ping_pong_streaming_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_registered_call_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_binary_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_and_call_creds_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_large_metadata_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_server_finishes_request_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_delayed_request_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_with_high_initial_sequence_number_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_and_call_creds_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_and_call_creds_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_bad_hostname_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_invoke_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_before_invoke_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_census_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_disappearing_server_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_empty_batch_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_graceful_server_shutdown_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_invoke_large_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_concurrent_streams_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_message_length_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_no_op_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_ping_pong_streaming_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_registered_call_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_large_metadata_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_server_finishes_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_delayed_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_no_op_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_and_call_creds_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test

buildtests_cxx: privatelibs_cxx $(BINDIR)/$(CONFIG)/async_end2end_test $(BINDIR)/$(CONFIG)/async_streaming_ping_pong_test $(BINDIR)/$(CONFIG)/async_unary_ping_pong_test $(BINDIR)/$(CONFIG)/channel_arguments_test $(BINDIR)/$(CONFIG)/cli_call_test $(BINDIR)/$(CONFIG)/credentials_test $(BINDIR)/$(CONFIG)/cxx_time_test $(BINDIR)/$(CONFIG)/end2end_test $(BINDIR)/$(CONFIG)/generic_end2end_test $(BINDIR)/$(CONFIG)/grpc_cli $(BINDIR)/$(CONFIG)/interop_client $(BINDIR)/$(CONFIG)/interop_server $(BINDIR)/$(CONFIG)/interop_test $(BINDIR)/$(CONFIG)/mock_test $(BINDIR)/$(CONFIG)/status_test $(BINDIR)/$(CONFIG)/sync_streaming_ping_pong_test $(BINDIR)/$(CONFIG)/sync_unary_ping_pong_test $(BINDIR)/$(CONFIG)/thread_pool_test $(BINDIR)/$(CONFIG)/thread_stress_test

test: test_c test_cxx

test_c: buildtests_c
	$(E) "[RUN]     Testing alarm_heap_test"
	$(Q) $(BINDIR)/$(CONFIG)/alarm_heap_test || ( echo test alarm_heap_test failed ; exit 1 )
	$(E) "[RUN]     Testing alarm_list_test"
	$(Q) $(BINDIR)/$(CONFIG)/alarm_list_test || ( echo test alarm_list_test failed ; exit 1 )
	$(E) "[RUN]     Testing alarm_test"
	$(Q) $(BINDIR)/$(CONFIG)/alarm_test || ( echo test alarm_test failed ; exit 1 )
	$(E) "[RUN]     Testing alpn_test"
	$(Q) $(BINDIR)/$(CONFIG)/alpn_test || ( echo test alpn_test failed ; exit 1 )
	$(E) "[RUN]     Testing bin_encoder_test"
	$(Q) $(BINDIR)/$(CONFIG)/bin_encoder_test || ( echo test bin_encoder_test failed ; exit 1 )
	$(E) "[RUN]     Testing census_hash_table_test"
	$(Q) $(BINDIR)/$(CONFIG)/census_hash_table_test || ( echo test census_hash_table_test failed ; exit 1 )
	$(E) "[RUN]     Testing census_statistics_multiple_writers_circular_buffer_test"
	$(Q) $(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_circular_buffer_test || ( echo test census_statistics_multiple_writers_circular_buffer_test failed ; exit 1 )
	$(E) "[RUN]     Testing census_statistics_multiple_writers_test"
	$(Q) $(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_test || ( echo test census_statistics_multiple_writers_test failed ; exit 1 )
	$(E) "[RUN]     Testing census_statistics_performance_test"
	$(Q) $(BINDIR)/$(CONFIG)/census_statistics_performance_test || ( echo test census_statistics_performance_test failed ; exit 1 )
	$(E) "[RUN]     Testing census_statistics_quick_test"
	$(Q) $(BINDIR)/$(CONFIG)/census_statistics_quick_test || ( echo test census_statistics_quick_test failed ; exit 1 )
	$(E) "[RUN]     Testing census_statistics_small_log_test"
	$(Q) $(BINDIR)/$(CONFIG)/census_statistics_small_log_test || ( echo test census_statistics_small_log_test failed ; exit 1 )
	$(E) "[RUN]     Testing census_stub_test"
	$(Q) $(BINDIR)/$(CONFIG)/census_stub_test || ( echo test census_stub_test failed ; exit 1 )
	$(E) "[RUN]     Testing census_window_stats_test"
	$(Q) $(BINDIR)/$(CONFIG)/census_window_stats_test || ( echo test census_window_stats_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_status_conversion_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_status_conversion_test || ( echo test chttp2_status_conversion_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_stream_encoder_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_stream_encoder_test || ( echo test chttp2_stream_encoder_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_stream_map_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_stream_map_test || ( echo test chttp2_stream_map_test failed ; exit 1 )
	$(E) "[RUN]     Testing dualstack_socket_test"
	$(Q) $(BINDIR)/$(CONFIG)/dualstack_socket_test || ( echo test dualstack_socket_test failed ; exit 1 )
	$(E) "[RUN]     Testing fd_posix_test"
	$(Q) $(BINDIR)/$(CONFIG)/fd_posix_test || ( echo test fd_posix_test failed ; exit 1 )
	$(E) "[RUN]     Testing fling_stream_test"
	$(Q) $(BINDIR)/$(CONFIG)/fling_stream_test || ( echo test fling_stream_test failed ; exit 1 )
	$(E) "[RUN]     Testing fling_test"
	$(Q) $(BINDIR)/$(CONFIG)/fling_test || ( echo test fling_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_cancellable_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_cancellable_test || ( echo test gpr_cancellable_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_cmdline_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_cmdline_test || ( echo test gpr_cmdline_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_env_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_env_test || ( echo test gpr_env_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_file_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_file_test || ( echo test gpr_file_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_histogram_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_histogram_test || ( echo test gpr_histogram_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_host_port_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_host_port_test || ( echo test gpr_host_port_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_log_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_log_test || ( echo test gpr_log_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_slice_buffer_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_slice_buffer_test || ( echo test gpr_slice_buffer_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_slice_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_slice_test || ( echo test gpr_slice_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_string_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_string_test || ( echo test gpr_string_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_sync_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_sync_test || ( echo test gpr_sync_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_thd_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_thd_test || ( echo test gpr_thd_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_time_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_time_test || ( echo test gpr_time_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_tls_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_tls_test || ( echo test gpr_tls_test failed ; exit 1 )
	$(E) "[RUN]     Testing gpr_useful_test"
	$(Q) $(BINDIR)/$(CONFIG)/gpr_useful_test || ( echo test gpr_useful_test failed ; exit 1 )
	$(E) "[RUN]     Testing grpc_auth_context_test"
	$(Q) $(BINDIR)/$(CONFIG)/grpc_auth_context_test || ( echo test grpc_auth_context_test failed ; exit 1 )
	$(E) "[RUN]     Testing grpc_base64_test"
	$(Q) $(BINDIR)/$(CONFIG)/grpc_base64_test || ( echo test grpc_base64_test failed ; exit 1 )
	$(E) "[RUN]     Testing grpc_byte_buffer_reader_test"
	$(Q) $(BINDIR)/$(CONFIG)/grpc_byte_buffer_reader_test || ( echo test grpc_byte_buffer_reader_test failed ; exit 1 )
	$(E) "[RUN]     Testing grpc_channel_stack_test"
	$(Q) $(BINDIR)/$(CONFIG)/grpc_channel_stack_test || ( echo test grpc_channel_stack_test failed ; exit 1 )
	$(E) "[RUN]     Testing grpc_completion_queue_test"
	$(Q) $(BINDIR)/$(CONFIG)/grpc_completion_queue_test || ( echo test grpc_completion_queue_test failed ; exit 1 )
	$(E) "[RUN]     Testing grpc_credentials_test"
	$(Q) $(BINDIR)/$(CONFIG)/grpc_credentials_test || ( echo test grpc_credentials_test failed ; exit 1 )
	$(E) "[RUN]     Testing grpc_json_token_test"
	$(Q) $(BINDIR)/$(CONFIG)/grpc_json_token_test || ( echo test grpc_json_token_test failed ; exit 1 )
	$(E) "[RUN]     Testing grpc_stream_op_test"
	$(Q) $(BINDIR)/$(CONFIG)/grpc_stream_op_test || ( echo test grpc_stream_op_test failed ; exit 1 )
	$(E) "[RUN]     Testing hpack_parser_test"
	$(Q) $(BINDIR)/$(CONFIG)/hpack_parser_test || ( echo test hpack_parser_test failed ; exit 1 )
	$(E) "[RUN]     Testing hpack_table_test"
	$(Q) $(BINDIR)/$(CONFIG)/hpack_table_test || ( echo test hpack_table_test failed ; exit 1 )
	$(E) "[RUN]     Testing httpcli_format_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/httpcli_format_request_test || ( echo test httpcli_format_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing httpcli_parser_test"
	$(Q) $(BINDIR)/$(CONFIG)/httpcli_parser_test || ( echo test httpcli_parser_test failed ; exit 1 )
	$(E) "[RUN]     Testing json_rewrite_test"
	$(Q) $(BINDIR)/$(CONFIG)/json_rewrite_test || ( echo test json_rewrite_test failed ; exit 1 )
	$(E) "[RUN]     Testing json_test"
	$(Q) $(BINDIR)/$(CONFIG)/json_test || ( echo test json_test failed ; exit 1 )
	$(E) "[RUN]     Testing lame_client_test"
	$(Q) $(BINDIR)/$(CONFIG)/lame_client_test || ( echo test lame_client_test failed ; exit 1 )
	$(E) "[RUN]     Testing message_compress_test"
	$(Q) $(BINDIR)/$(CONFIG)/message_compress_test || ( echo test message_compress_test failed ; exit 1 )
	$(E) "[RUN]     Testing multi_init_test"
	$(Q) $(BINDIR)/$(CONFIG)/multi_init_test || ( echo test multi_init_test failed ; exit 1 )
	$(E) "[RUN]     Testing murmur_hash_test"
	$(Q) $(BINDIR)/$(CONFIG)/murmur_hash_test || ( echo test murmur_hash_test failed ; exit 1 )
	$(E) "[RUN]     Testing no_server_test"
	$(Q) $(BINDIR)/$(CONFIG)/no_server_test || ( echo test no_server_test failed ; exit 1 )
	$(E) "[RUN]     Testing poll_kick_posix_test"
	$(Q) $(BINDIR)/$(CONFIG)/poll_kick_posix_test || ( echo test poll_kick_posix_test failed ; exit 1 )
	$(E) "[RUN]     Testing resolve_address_test"
	$(Q) $(BINDIR)/$(CONFIG)/resolve_address_test || ( echo test resolve_address_test failed ; exit 1 )
	$(E) "[RUN]     Testing secure_endpoint_test"
	$(Q) $(BINDIR)/$(CONFIG)/secure_endpoint_test || ( echo test secure_endpoint_test failed ; exit 1 )
	$(E) "[RUN]     Testing sockaddr_utils_test"
	$(Q) $(BINDIR)/$(CONFIG)/sockaddr_utils_test || ( echo test sockaddr_utils_test failed ; exit 1 )
	$(E) "[RUN]     Testing tcp_client_posix_test"
	$(Q) $(BINDIR)/$(CONFIG)/tcp_client_posix_test || ( echo test tcp_client_posix_test failed ; exit 1 )
	$(E) "[RUN]     Testing tcp_posix_test"
	$(Q) $(BINDIR)/$(CONFIG)/tcp_posix_test || ( echo test tcp_posix_test failed ; exit 1 )
	$(E) "[RUN]     Testing tcp_server_posix_test"
	$(Q) $(BINDIR)/$(CONFIG)/tcp_server_posix_test || ( echo test tcp_server_posix_test failed ; exit 1 )
	$(E) "[RUN]     Testing time_averaged_stats_test"
	$(Q) $(BINDIR)/$(CONFIG)/time_averaged_stats_test || ( echo test time_averaged_stats_test failed ; exit 1 )
	$(E) "[RUN]     Testing time_test"
	$(Q) $(BINDIR)/$(CONFIG)/time_test || ( echo test time_test failed ; exit 1 )
	$(E) "[RUN]     Testing timeout_encoding_test"
	$(Q) $(BINDIR)/$(CONFIG)/timeout_encoding_test || ( echo test timeout_encoding_test failed ; exit 1 )
	$(E) "[RUN]     Testing timers_test"
	$(Q) $(BINDIR)/$(CONFIG)/timers_test || ( echo test timers_test failed ; exit 1 )
	$(E) "[RUN]     Testing transport_metadata_test"
	$(Q) $(BINDIR)/$(CONFIG)/transport_metadata_test || ( echo test transport_metadata_test failed ; exit 1 )
	$(E) "[RUN]     Testing transport_security_test"
	$(Q) $(BINDIR)/$(CONFIG)/transport_security_test || ( echo test transport_security_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_bad_hostname_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_bad_hostname_test || ( echo test chttp2_fake_security_bad_hostname_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_cancel_after_accept_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_test || ( echo test chttp2_fake_security_cancel_after_accept_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_cancel_after_accept_and_writes_closed_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_and_writes_closed_test || ( echo test chttp2_fake_security_cancel_after_accept_and_writes_closed_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_cancel_after_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_invoke_test || ( echo test chttp2_fake_security_cancel_after_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_cancel_before_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_before_invoke_test || ( echo test chttp2_fake_security_cancel_before_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_cancel_in_a_vacuum_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_in_a_vacuum_test || ( echo test chttp2_fake_security_cancel_in_a_vacuum_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_census_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_census_simple_request_test || ( echo test chttp2_fake_security_census_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_disappearing_server_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_disappearing_server_test || ( echo test chttp2_fake_security_disappearing_server_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test || ( echo test chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_early_server_shutdown_finishes_tags_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_tags_test || ( echo test chttp2_fake_security_early_server_shutdown_finishes_tags_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_empty_batch_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_empty_batch_test || ( echo test chttp2_fake_security_empty_batch_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_graceful_server_shutdown_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_graceful_server_shutdown_test || ( echo test chttp2_fake_security_graceful_server_shutdown_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_invoke_large_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_invoke_large_request_test || ( echo test chttp2_fake_security_invoke_large_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_max_concurrent_streams_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_max_concurrent_streams_test || ( echo test chttp2_fake_security_max_concurrent_streams_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_max_message_length_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_max_message_length_test || ( echo test chttp2_fake_security_max_message_length_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_no_op_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_no_op_test || ( echo test chttp2_fake_security_no_op_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_ping_pong_streaming_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_ping_pong_streaming_test || ( echo test chttp2_fake_security_ping_pong_streaming_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_registered_call_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_registered_call_test || ( echo test chttp2_fake_security_registered_call_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_request_response_with_binary_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_binary_metadata_and_payload_test || ( echo test chttp2_fake_security_request_response_with_binary_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_request_response_with_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_metadata_and_payload_test || ( echo test chttp2_fake_security_request_response_with_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_request_response_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_test || ( echo test chttp2_fake_security_request_response_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_request_response_with_payload_and_call_creds_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_and_call_creds_test || ( echo test chttp2_fake_security_request_response_with_payload_and_call_creds_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test || ( echo test chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_request_with_large_metadata_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_large_metadata_test || ( echo test chttp2_fake_security_request_with_large_metadata_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_request_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_payload_test || ( echo test chttp2_fake_security_request_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_server_finishes_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_server_finishes_request_test || ( echo test chttp2_fake_security_server_finishes_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_simple_delayed_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_delayed_request_test || ( echo test chttp2_fake_security_simple_delayed_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_test || ( echo test chttp2_fake_security_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fake_security_simple_request_with_high_initial_sequence_number_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_with_high_initial_sequence_number_test || ( echo test chttp2_fake_security_simple_request_with_high_initial_sequence_number_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_bad_hostname_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_test || ( echo test chttp2_fullstack_bad_hostname_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_after_accept_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_test || ( echo test chttp2_fullstack_cancel_after_accept_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_after_accept_and_writes_closed_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_test || ( echo test chttp2_fullstack_cancel_after_accept_and_writes_closed_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_after_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_test || ( echo test chttp2_fullstack_cancel_after_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_before_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_test || ( echo test chttp2_fullstack_cancel_before_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_in_a_vacuum_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_test || ( echo test chttp2_fullstack_cancel_in_a_vacuum_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_census_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_test || ( echo test chttp2_fullstack_census_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_disappearing_server_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_test || ( echo test chttp2_fullstack_disappearing_server_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test || ( echo test chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_early_server_shutdown_finishes_tags_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_test || ( echo test chttp2_fullstack_early_server_shutdown_finishes_tags_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_empty_batch_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_test || ( echo test chttp2_fullstack_empty_batch_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_graceful_server_shutdown_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_test || ( echo test chttp2_fullstack_graceful_server_shutdown_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_invoke_large_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_test || ( echo test chttp2_fullstack_invoke_large_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_max_concurrent_streams_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_test || ( echo test chttp2_fullstack_max_concurrent_streams_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_max_message_length_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_test || ( echo test chttp2_fullstack_max_message_length_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_no_op_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_test || ( echo test chttp2_fullstack_no_op_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_ping_pong_streaming_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_test || ( echo test chttp2_fullstack_ping_pong_streaming_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_registered_call_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_test || ( echo test chttp2_fullstack_registered_call_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_response_with_binary_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_test || ( echo test chttp2_fullstack_request_response_with_binary_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_response_with_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_test || ( echo test chttp2_fullstack_request_response_with_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_response_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_test || ( echo test chttp2_fullstack_request_response_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_response_with_payload_and_call_creds_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_and_call_creds_test || ( echo test chttp2_fullstack_request_response_with_payload_and_call_creds_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test || ( echo test chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_with_large_metadata_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_test || ( echo test chttp2_fullstack_request_with_large_metadata_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_test || ( echo test chttp2_fullstack_request_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_server_finishes_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_test || ( echo test chttp2_fullstack_server_finishes_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_simple_delayed_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_test || ( echo test chttp2_fullstack_simple_delayed_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_test || ( echo test chttp2_fullstack_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_simple_request_with_high_initial_sequence_number_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_test || ( echo test chttp2_fullstack_simple_request_with_high_initial_sequence_number_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_bad_hostname_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_test || ( echo test chttp2_fullstack_uds_posix_bad_hostname_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_after_accept_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_test || ( echo test chttp2_fullstack_uds_posix_cancel_after_accept_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_test || ( echo test chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_after_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_test || ( echo test chttp2_fullstack_uds_posix_cancel_after_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_before_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_test || ( echo test chttp2_fullstack_uds_posix_cancel_before_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_in_a_vacuum_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_test || ( echo test chttp2_fullstack_uds_posix_cancel_in_a_vacuum_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_census_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_test || ( echo test chttp2_fullstack_uds_posix_census_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_disappearing_server_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_test || ( echo test chttp2_fullstack_uds_posix_disappearing_server_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_test || ( echo test chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_test || ( echo test chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_empty_batch_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_test || ( echo test chttp2_fullstack_uds_posix_empty_batch_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_graceful_server_shutdown_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_test || ( echo test chttp2_fullstack_uds_posix_graceful_server_shutdown_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_invoke_large_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_test || ( echo test chttp2_fullstack_uds_posix_invoke_large_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_max_concurrent_streams_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_test || ( echo test chttp2_fullstack_uds_posix_max_concurrent_streams_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_max_message_length_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_test || ( echo test chttp2_fullstack_uds_posix_max_message_length_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_no_op_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_test || ( echo test chttp2_fullstack_uds_posix_no_op_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_ping_pong_streaming_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_test || ( echo test chttp2_fullstack_uds_posix_ping_pong_streaming_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_registered_call_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_test || ( echo test chttp2_fullstack_uds_posix_registered_call_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_test || ( echo test chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_test || ( echo test chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_response_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_test || ( echo test chttp2_fullstack_uds_posix_request_response_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_response_with_payload_and_call_creds_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_and_call_creds_test || ( echo test chttp2_fullstack_uds_posix_request_response_with_payload_and_call_creds_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_test || ( echo test chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_with_large_metadata_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_test || ( echo test chttp2_fullstack_uds_posix_request_with_large_metadata_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_test || ( echo test chttp2_fullstack_uds_posix_request_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_server_finishes_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_test || ( echo test chttp2_fullstack_uds_posix_server_finishes_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_simple_delayed_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_test || ( echo test chttp2_fullstack_uds_posix_simple_delayed_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_test || ( echo test chttp2_fullstack_uds_posix_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_test || ( echo test chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_bad_hostname_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_bad_hostname_test || ( echo test chttp2_simple_ssl_fullstack_bad_hostname_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_cancel_after_accept_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_test || ( echo test chttp2_simple_ssl_fullstack_cancel_after_accept_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test || ( echo test chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_cancel_after_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_invoke_test || ( echo test chttp2_simple_ssl_fullstack_cancel_after_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_cancel_before_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_before_invoke_test || ( echo test chttp2_simple_ssl_fullstack_cancel_before_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test || ( echo test chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_census_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_census_simple_request_test || ( echo test chttp2_simple_ssl_fullstack_census_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_disappearing_server_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_disappearing_server_test || ( echo test chttp2_simple_ssl_fullstack_disappearing_server_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test || ( echo test chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test || ( echo test chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_empty_batch_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_empty_batch_test || ( echo test chttp2_simple_ssl_fullstack_empty_batch_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_graceful_server_shutdown_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_graceful_server_shutdown_test || ( echo test chttp2_simple_ssl_fullstack_graceful_server_shutdown_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_invoke_large_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_invoke_large_request_test || ( echo test chttp2_simple_ssl_fullstack_invoke_large_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_max_concurrent_streams_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_concurrent_streams_test || ( echo test chttp2_simple_ssl_fullstack_max_concurrent_streams_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_max_message_length_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_message_length_test || ( echo test chttp2_simple_ssl_fullstack_max_message_length_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_no_op_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_no_op_test || ( echo test chttp2_simple_ssl_fullstack_no_op_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_ping_pong_streaming_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_ping_pong_streaming_test || ( echo test chttp2_simple_ssl_fullstack_ping_pong_streaming_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_registered_call_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_registered_call_test || ( echo test chttp2_simple_ssl_fullstack_registered_call_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test || ( echo test chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test || ( echo test chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_request_response_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_test || ( echo test chttp2_simple_ssl_fullstack_request_response_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test || ( echo test chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test || ( echo test chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_request_with_large_metadata_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_large_metadata_test || ( echo test chttp2_simple_ssl_fullstack_request_with_large_metadata_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_request_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_payload_test || ( echo test chttp2_simple_ssl_fullstack_request_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_server_finishes_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_server_finishes_request_test || ( echo test chttp2_simple_ssl_fullstack_server_finishes_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_simple_delayed_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_delayed_request_test || ( echo test chttp2_simple_ssl_fullstack_simple_delayed_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_test || ( echo test chttp2_simple_ssl_fullstack_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test || ( echo test chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_no_op_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_no_op_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_no_op_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test || ( echo test chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_bad_hostname_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_test || ( echo test chttp2_socket_pair_bad_hostname_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_after_accept_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_test || ( echo test chttp2_socket_pair_cancel_after_accept_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_after_accept_and_writes_closed_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_test || ( echo test chttp2_socket_pair_cancel_after_accept_and_writes_closed_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_after_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_test || ( echo test chttp2_socket_pair_cancel_after_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_before_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_test || ( echo test chttp2_socket_pair_cancel_before_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_in_a_vacuum_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_test || ( echo test chttp2_socket_pair_cancel_in_a_vacuum_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_census_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_test || ( echo test chttp2_socket_pair_census_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_disappearing_server_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_test || ( echo test chttp2_socket_pair_disappearing_server_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test || ( echo test chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_early_server_shutdown_finishes_tags_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_test || ( echo test chttp2_socket_pair_early_server_shutdown_finishes_tags_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_empty_batch_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_test || ( echo test chttp2_socket_pair_empty_batch_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_graceful_server_shutdown_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_test || ( echo test chttp2_socket_pair_graceful_server_shutdown_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_invoke_large_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_test || ( echo test chttp2_socket_pair_invoke_large_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_max_concurrent_streams_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_test || ( echo test chttp2_socket_pair_max_concurrent_streams_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_max_message_length_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_test || ( echo test chttp2_socket_pair_max_message_length_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_no_op_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_test || ( echo test chttp2_socket_pair_no_op_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_ping_pong_streaming_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_test || ( echo test chttp2_socket_pair_ping_pong_streaming_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_registered_call_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_test || ( echo test chttp2_socket_pair_registered_call_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test || ( echo test chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_response_with_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_test || ( echo test chttp2_socket_pair_request_response_with_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_response_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_test || ( echo test chttp2_socket_pair_request_response_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_response_with_payload_and_call_creds_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_and_call_creds_test || ( echo test chttp2_socket_pair_request_response_with_payload_and_call_creds_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test || ( echo test chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_with_large_metadata_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_test || ( echo test chttp2_socket_pair_request_with_large_metadata_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_test || ( echo test chttp2_socket_pair_request_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_server_finishes_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_test || ( echo test chttp2_socket_pair_server_finishes_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_simple_delayed_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_test || ( echo test chttp2_socket_pair_simple_delayed_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_test || ( echo test chttp2_socket_pair_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test || ( echo test chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_empty_batch_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_empty_batch_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_max_message_length_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_max_message_length_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_no_op_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_no_op_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_registered_call_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_registered_call_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_bad_hostname_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_test || ( echo test chttp2_socket_pair_with_grpc_trace_bad_hostname_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_census_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_test || ( echo test chttp2_socket_pair_with_grpc_trace_census_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_disappearing_server_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_test || ( echo test chttp2_socket_pair_with_grpc_trace_disappearing_server_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test || ( echo test chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test || ( echo test chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_empty_batch_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_test || ( echo test chttp2_socket_pair_with_grpc_trace_empty_batch_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test || ( echo test chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_invoke_large_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_test || ( echo test chttp2_socket_pair_with_grpc_trace_invoke_large_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test || ( echo test chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_max_message_length_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_test || ( echo test chttp2_socket_pair_with_grpc_trace_max_message_length_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_no_op_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_test || ( echo test chttp2_socket_pair_with_grpc_trace_no_op_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test || ( echo test chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_registered_call_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_test || ( echo test chttp2_socket_pair_with_grpc_trace_registered_call_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_with_payload_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_with_payload_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_server_finishes_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_test || ( echo test chttp2_socket_pair_with_grpc_trace_server_finishes_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test || ( echo test chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_simple_request_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_test || ( echo test chttp2_socket_pair_with_grpc_trace_simple_request_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test || ( echo test chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_bad_hostname_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_unsecure_test || ( echo test chttp2_fullstack_bad_hostname_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_after_accept_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_unsecure_test || ( echo test chttp2_fullstack_cancel_after_accept_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test || ( echo test chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_after_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_unsecure_test || ( echo test chttp2_fullstack_cancel_after_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_before_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_unsecure_test || ( echo test chttp2_fullstack_cancel_before_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_cancel_in_a_vacuum_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_unsecure_test || ( echo test chttp2_fullstack_cancel_in_a_vacuum_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_census_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_unsecure_test || ( echo test chttp2_fullstack_census_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_disappearing_server_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_unsecure_test || ( echo test chttp2_fullstack_disappearing_server_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test || ( echo test chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test || ( echo test chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_empty_batch_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_unsecure_test || ( echo test chttp2_fullstack_empty_batch_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_graceful_server_shutdown_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_unsecure_test || ( echo test chttp2_fullstack_graceful_server_shutdown_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_invoke_large_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_unsecure_test || ( echo test chttp2_fullstack_invoke_large_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_max_concurrent_streams_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_unsecure_test || ( echo test chttp2_fullstack_max_concurrent_streams_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_max_message_length_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_unsecure_test || ( echo test chttp2_fullstack_max_message_length_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_no_op_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_unsecure_test || ( echo test chttp2_fullstack_no_op_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_ping_pong_streaming_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_unsecure_test || ( echo test chttp2_fullstack_ping_pong_streaming_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_registered_call_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_unsecure_test || ( echo test chttp2_fullstack_registered_call_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test || ( echo test chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test || ( echo test chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_response_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_unsecure_test || ( echo test chttp2_fullstack_request_response_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test || ( echo test chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_with_large_metadata_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_unsecure_test || ( echo test chttp2_fullstack_request_with_large_metadata_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_request_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_unsecure_test || ( echo test chttp2_fullstack_request_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_server_finishes_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_unsecure_test || ( echo test chttp2_fullstack_server_finishes_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_simple_delayed_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_unsecure_test || ( echo test chttp2_fullstack_simple_delayed_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_unsecure_test || ( echo test chttp2_fullstack_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test || ( echo test chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_bad_hostname_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_unsecure_test || ( echo test chttp2_fullstack_uds_posix_bad_hostname_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_after_accept_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_unsecure_test || ( echo test chttp2_fullstack_uds_posix_cancel_after_accept_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_unsecure_test || ( echo test chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_after_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_unsecure_test || ( echo test chttp2_fullstack_uds_posix_cancel_after_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_before_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_unsecure_test || ( echo test chttp2_fullstack_uds_posix_cancel_before_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_cancel_in_a_vacuum_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_unsecure_test || ( echo test chttp2_fullstack_uds_posix_cancel_in_a_vacuum_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_census_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_unsecure_test || ( echo test chttp2_fullstack_uds_posix_census_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_disappearing_server_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_unsecure_test || ( echo test chttp2_fullstack_uds_posix_disappearing_server_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_unsecure_test || ( echo test chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_unsecure_test || ( echo test chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_empty_batch_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_unsecure_test || ( echo test chttp2_fullstack_uds_posix_empty_batch_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_graceful_server_shutdown_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_unsecure_test || ( echo test chttp2_fullstack_uds_posix_graceful_server_shutdown_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_invoke_large_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_unsecure_test || ( echo test chttp2_fullstack_uds_posix_invoke_large_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_max_concurrent_streams_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_unsecure_test || ( echo test chttp2_fullstack_uds_posix_max_concurrent_streams_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_max_message_length_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_unsecure_test || ( echo test chttp2_fullstack_uds_posix_max_message_length_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_no_op_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_unsecure_test || ( echo test chttp2_fullstack_uds_posix_no_op_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_ping_pong_streaming_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_unsecure_test || ( echo test chttp2_fullstack_uds_posix_ping_pong_streaming_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_registered_call_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_unsecure_test || ( echo test chttp2_fullstack_uds_posix_registered_call_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_unsecure_test || ( echo test chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_unsecure_test || ( echo test chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_response_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_unsecure_test || ( echo test chttp2_fullstack_uds_posix_request_response_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_unsecure_test || ( echo test chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_with_large_metadata_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_unsecure_test || ( echo test chttp2_fullstack_uds_posix_request_with_large_metadata_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_request_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_unsecure_test || ( echo test chttp2_fullstack_uds_posix_request_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_server_finishes_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_unsecure_test || ( echo test chttp2_fullstack_uds_posix_server_finishes_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_simple_delayed_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_unsecure_test || ( echo test chttp2_fullstack_uds_posix_simple_delayed_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_unsecure_test || ( echo test chttp2_fullstack_uds_posix_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_unsecure_test || ( echo test chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_bad_hostname_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_unsecure_test || ( echo test chttp2_socket_pair_bad_hostname_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_after_accept_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_unsecure_test || ( echo test chttp2_socket_pair_cancel_after_accept_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test || ( echo test chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_after_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_unsecure_test || ( echo test chttp2_socket_pair_cancel_after_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_before_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_unsecure_test || ( echo test chttp2_socket_pair_cancel_before_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test || ( echo test chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_census_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_unsecure_test || ( echo test chttp2_socket_pair_census_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_disappearing_server_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_unsecure_test || ( echo test chttp2_socket_pair_disappearing_server_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test || ( echo test chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test || ( echo test chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_empty_batch_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_unsecure_test || ( echo test chttp2_socket_pair_empty_batch_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_graceful_server_shutdown_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_unsecure_test || ( echo test chttp2_socket_pair_graceful_server_shutdown_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_invoke_large_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_unsecure_test || ( echo test chttp2_socket_pair_invoke_large_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_max_concurrent_streams_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_unsecure_test || ( echo test chttp2_socket_pair_max_concurrent_streams_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_max_message_length_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_unsecure_test || ( echo test chttp2_socket_pair_max_message_length_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_no_op_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_unsecure_test || ( echo test chttp2_socket_pair_no_op_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_ping_pong_streaming_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_unsecure_test || ( echo test chttp2_socket_pair_ping_pong_streaming_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_registered_call_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_unsecure_test || ( echo test chttp2_socket_pair_registered_call_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test || ( echo test chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test || ( echo test chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_response_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_unsecure_test || ( echo test chttp2_socket_pair_request_response_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test || ( echo test chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_with_large_metadata_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_unsecure_test || ( echo test chttp2_socket_pair_request_with_large_metadata_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_request_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_unsecure_test || ( echo test chttp2_socket_pair_request_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_server_finishes_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_unsecure_test || ( echo test chttp2_socket_pair_server_finishes_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_simple_delayed_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_unsecure_test || ( echo test chttp2_socket_pair_simple_delayed_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_unsecure_test || ( echo test chttp2_socket_pair_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test || ( echo test chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test || ( echo test chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test failed ; exit 1 )
	$(E) "[RUN]     Testing chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test"
	$(Q) $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test || ( echo test chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test failed ; exit 1 )


test_cxx: buildtests_cxx
	$(E) "[RUN]     Testing async_end2end_test"
	$(Q) $(BINDIR)/$(CONFIG)/async_end2end_test || ( echo test async_end2end_test failed ; exit 1 )
	$(E) "[RUN]     Testing async_streaming_ping_pong_test"
	$(Q) $(BINDIR)/$(CONFIG)/async_streaming_ping_pong_test || ( echo test async_streaming_ping_pong_test failed ; exit 1 )
	$(E) "[RUN]     Testing async_unary_ping_pong_test"
	$(Q) $(BINDIR)/$(CONFIG)/async_unary_ping_pong_test || ( echo test async_unary_ping_pong_test failed ; exit 1 )
	$(E) "[RUN]     Testing channel_arguments_test"
	$(Q) $(BINDIR)/$(CONFIG)/channel_arguments_test || ( echo test channel_arguments_test failed ; exit 1 )
	$(E) "[RUN]     Testing cli_call_test"
	$(Q) $(BINDIR)/$(CONFIG)/cli_call_test || ( echo test cli_call_test failed ; exit 1 )
	$(E) "[RUN]     Testing credentials_test"
	$(Q) $(BINDIR)/$(CONFIG)/credentials_test || ( echo test credentials_test failed ; exit 1 )
	$(E) "[RUN]     Testing cxx_time_test"
	$(Q) $(BINDIR)/$(CONFIG)/cxx_time_test || ( echo test cxx_time_test failed ; exit 1 )
	$(E) "[RUN]     Testing end2end_test"
	$(Q) $(BINDIR)/$(CONFIG)/end2end_test || ( echo test end2end_test failed ; exit 1 )
	$(E) "[RUN]     Testing generic_end2end_test"
	$(Q) $(BINDIR)/$(CONFIG)/generic_end2end_test || ( echo test generic_end2end_test failed ; exit 1 )
	$(E) "[RUN]     Testing interop_test"
	$(Q) $(BINDIR)/$(CONFIG)/interop_test || ( echo test interop_test failed ; exit 1 )
	$(E) "[RUN]     Testing mock_test"
	$(Q) $(BINDIR)/$(CONFIG)/mock_test || ( echo test mock_test failed ; exit 1 )
	$(E) "[RUN]     Testing status_test"
	$(Q) $(BINDIR)/$(CONFIG)/status_test || ( echo test status_test failed ; exit 1 )
	$(E) "[RUN]     Testing sync_streaming_ping_pong_test"
	$(Q) $(BINDIR)/$(CONFIG)/sync_streaming_ping_pong_test || ( echo test sync_streaming_ping_pong_test failed ; exit 1 )
	$(E) "[RUN]     Testing sync_unary_ping_pong_test"
	$(Q) $(BINDIR)/$(CONFIG)/sync_unary_ping_pong_test || ( echo test sync_unary_ping_pong_test failed ; exit 1 )
	$(E) "[RUN]     Testing thread_pool_test"
	$(Q) $(BINDIR)/$(CONFIG)/thread_pool_test || ( echo test thread_pool_test failed ; exit 1 )
	$(E) "[RUN]     Testing thread_stress_test"
	$(Q) $(BINDIR)/$(CONFIG)/thread_stress_test || ( echo test thread_stress_test failed ; exit 1 )


test_python: static_c
	$(E) "[RUN]     Testing python code"
	$(Q) tools/run_tests/run_tests.py -lpython -c$(CONFIG)


tools: privatelibs $(BINDIR)/$(CONFIG)/gen_hpack_tables $(BINDIR)/$(CONFIG)/grpc_create_jwt $(BINDIR)/$(CONFIG)/grpc_fetch_oauth2 $(BINDIR)/$(CONFIG)/grpc_print_google_default_creds_token

buildbenchmarks: privatelibs $(BINDIR)/$(CONFIG)/low_level_ping_pong_benchmark $(BINDIR)/$(CONFIG)/qps_driver $(BINDIR)/$(CONFIG)/qps_test $(BINDIR)/$(CONFIG)/qps_worker

benchmarks: buildbenchmarks

strip: strip-static strip-shared

strip-static: strip-static_c strip-static_cxx

strip-shared: strip-shared_c strip-shared_cxx


# TODO(nnoble): the strip target is stripping in-place, instead
# of copying files in a temporary folder.
# This prevents proper debugging after running make install.

strip-static_c: static_c
ifeq ($(CONFIG),opt)
	$(E) "[STRIP]   Stripping libgpr.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[STRIP]   Stripping libgrpc.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc.a
	$(E) "[STRIP]   Stripping libgrpc_unsecure.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a
endif

strip-static_cxx: static_cxx
ifeq ($(CONFIG),opt)
	$(E) "[STRIP]   Stripping libgrpc++.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc++.a
	$(E) "[STRIP]   Stripping libgrpc++_unsecure.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a
endif

strip-shared_c: shared_c
ifeq ($(CONFIG),opt)
	$(E) "[STRIP]   Stripping libgpr.so"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT)
	$(E) "[STRIP]   Stripping libgrpc.so"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT)
	$(E) "[STRIP]   Stripping libgrpc_unsecure.so"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.$(SHARED_EXT)
endif

strip-shared_cxx: shared_cxx
ifeq ($(CONFIG),opt)
	$(E) "[STRIP]   Stripping libgrpc++.so"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT)
	$(E) "[STRIP]   Stripping libgrpc++_unsecure.so"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.$(SHARED_EXT)
endif

strip-shared_csharp: shared_csharp
ifeq ($(CONFIG),opt)
	$(E) "[STRIP]   Stripping libgrpc_csharp_ext.so"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.$(SHARED_EXT)
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/examples/pubsub/empty.pb.cc: protoc_dep_error
$(GENDIR)/examples/pubsub/empty.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/examples/pubsub/empty.pb.cc: examples/pubsub/empty.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/examples/pubsub/empty.grpc.pb.cc: examples/pubsub/empty.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/examples/pubsub/label.pb.cc: protoc_dep_error
$(GENDIR)/examples/pubsub/label.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/examples/pubsub/label.pb.cc: examples/pubsub/label.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/examples/pubsub/label.grpc.pb.cc: examples/pubsub/label.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/examples/pubsub/pubsub.pb.cc: protoc_dep_error
$(GENDIR)/examples/pubsub/pubsub.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/examples/pubsub/pubsub.pb.cc: examples/pubsub/pubsub.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/examples/pubsub/pubsub.grpc.pb.cc: examples/pubsub/pubsub.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/test/cpp/qps/qpstest.pb.cc: protoc_dep_error
$(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/test/cpp/qps/qpstest.pb.cc: test/cpp/qps/qpstest.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc: test/cpp/qps/qpstest.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/test/cpp/util/echo.pb.cc: protoc_dep_error
$(GENDIR)/test/cpp/util/echo.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/test/cpp/util/echo.pb.cc: test/cpp/util/echo.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/test/cpp/util/echo.grpc.pb.cc: test/cpp/util/echo.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/test/cpp/util/echo_duplicate.pb.cc: protoc_dep_error
$(GENDIR)/test/cpp/util/echo_duplicate.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/test/cpp/util/echo_duplicate.pb.cc: test/cpp/util/echo_duplicate.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/test/cpp/util/echo_duplicate.grpc.pb.cc: test/cpp/util/echo_duplicate.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/test/cpp/util/messages.pb.cc: protoc_dep_error
$(GENDIR)/test/cpp/util/messages.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/test/cpp/util/messages.pb.cc: test/cpp/util/messages.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/test/cpp/util/messages.grpc.pb.cc: test/cpp/util/messages.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/test/proto/empty.pb.cc: protoc_dep_error
$(GENDIR)/test/proto/empty.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/test/proto/empty.pb.cc: test/proto/empty.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/test/proto/empty.grpc.pb.cc: test/proto/empty.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/test/proto/messages.pb.cc: protoc_dep_error
$(GENDIR)/test/proto/messages.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/test/proto/messages.pb.cc: test/proto/messages.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/test/proto/messages.grpc.pb.cc: test/proto/messages.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/test/proto/test.pb.cc: protoc_dep_error
$(GENDIR)/test/proto/test.grpc.pb.cc: protoc_dep_error
else
$(GENDIR)/test/proto/test.pb.cc: test/proto/test.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --cpp_out=$(GENDIR) $<

$(GENDIR)/test/proto/test.grpc.pb.cc: test/proto/test.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS)
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(BINDIR)/$(CONFIG)/grpc_cpp_plugin $<
endif


ifeq ($(CONFIG),stapprof)
src/core/profiling/stap_timers.c: $(GENDIR)/src/core/profiling/stap_probes.h
ifeq ($(HAS_SYSTEMTAP),true)
$(GENDIR)/src/core/profiling/stap_probes.h: src/core/profiling/stap_probes.d
	$(E) "[DTRACE]  Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(DTRACE) -C -h -s $< -o $@
else
$(GENDIR)/src/core/profiling/stap_probes.h: systemtap_dep_error stop
endif
endif

$(OBJDIR)/$(CONFIG)/%.o : %.c
	$(E) "[C]       Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(CC) $(CFLAGS) $(CPPFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

$(OBJDIR)/$(CONFIG)/%.o : $(GENDIR)/%.pb.cc
	$(E) "[CXX]     Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(CXX) $(CXXFLAGS) $(CPPFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

$(OBJDIR)/$(CONFIG)/src/compiler/%.o : src/compiler/%.cc
	$(E) "[HOSTCXX] Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_CXX) $(HOST_CXXFLAGS) $(HOST_CPPFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

$(OBJDIR)/$(CONFIG)/%.o : %.cc
	$(E) "[CXX]     Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(CXX) $(CXXFLAGS) $(CPPFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

install: install_c install_cxx install-plugins install-certs verify-install

install_c: install-headers_c install-static_c install-shared_c

install_cxx: install-headers_cxx install-static_cxx install-shared_cxx

install_csharp: install-shared_csharp install_c

install_grpc_csharp_ext: install_csharp

install-headers: install-headers_c install-headers_cxx

install-headers_c:
	$(E) "[INSTALL] Installing public C headers"
	$(Q) $(foreach h, $(PUBLIC_HEADERS_C), $(INSTALL) -d $(prefix)/$(dir $(h)) && ) exit 0 || exit 1
	$(Q) $(foreach h, $(PUBLIC_HEADERS_C), $(INSTALL) $(h) $(prefix)/$(h) && ) exit 0 || exit 1

install-headers_cxx:
	$(E) "[INSTALL] Installing public C++ headers"
	$(Q) $(foreach h, $(PUBLIC_HEADERS_CXX), $(INSTALL) -d $(prefix)/$(dir $(h)) && ) exit 0 || exit 1
	$(Q) $(foreach h, $(PUBLIC_HEADERS_CXX), $(INSTALL) $(h) $(prefix)/$(h) && ) exit 0 || exit 1

install-static: install-static_c install-static_cxx

install-static_c: static_c strip-static_c
	$(E) "[INSTALL] Installing libgpr.a"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgpr.a $(prefix)/lib/libgpr.a
	$(E) "[INSTALL] Installing libgrpc.a"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc.a $(prefix)/lib/libgrpc.a
	$(E) "[INSTALL] Installing libgrpc_unsecure.a"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(prefix)/lib/libgrpc_unsecure.a

install-static_cxx: static_cxx strip-static_cxx
	$(E) "[INSTALL] Installing libgrpc++.a"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc++.a $(prefix)/lib/libgrpc++.a
	$(E) "[INSTALL] Installing libgrpc++_unsecure.a"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a $(prefix)/lib/libgrpc++_unsecure.a



install-shared_c: shared_c strip-shared_c
ifeq ($(SYSTEM),MINGW32)
	$(E) "[INSTALL] Installing gpr.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/gpr.$(SHARED_EXT) $(prefix)/lib/gpr.$(SHARED_EXT)
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgpr-imp.a $(prefix)/lib/libgpr-imp.a
else
	$(E) "[INSTALL] Installing libgpr.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT) $(prefix)/lib/libgpr.$(SHARED_EXT)
ifneq ($(SYSTEM),Darwin)
	$(Q) ln -sf libgpr.$(SHARED_EXT) $(prefix)/lib/libgpr.so.0
	$(Q) ln -sf libgpr.$(SHARED_EXT) $(prefix)/lib/libgpr.so
endif
endif
ifeq ($(SYSTEM),MINGW32)
	$(E) "[INSTALL] Installing grpc.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/grpc.$(SHARED_EXT) $(prefix)/lib/grpc.$(SHARED_EXT)
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc-imp.a $(prefix)/lib/libgrpc-imp.a
else
	$(E) "[INSTALL] Installing libgrpc.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT) $(prefix)/lib/libgrpc.$(SHARED_EXT)
ifneq ($(SYSTEM),Darwin)
	$(Q) ln -sf libgrpc.$(SHARED_EXT) $(prefix)/lib/libgrpc.so.0
	$(Q) ln -sf libgrpc.$(SHARED_EXT) $(prefix)/lib/libgrpc.so
endif
endif
ifeq ($(SYSTEM),MINGW32)
	$(E) "[INSTALL] Installing grpc_unsecure.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/grpc_unsecure.$(SHARED_EXT) $(prefix)/lib/grpc_unsecure.$(SHARED_EXT)
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure-imp.a $(prefix)/lib/libgrpc_unsecure-imp.a
else
	$(E) "[INSTALL] Installing libgrpc_unsecure.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.$(SHARED_EXT) $(prefix)/lib/libgrpc_unsecure.$(SHARED_EXT)
ifneq ($(SYSTEM),Darwin)
	$(Q) ln -sf libgrpc_unsecure.$(SHARED_EXT) $(prefix)/lib/libgrpc_unsecure.so.0
	$(Q) ln -sf libgrpc_unsecure.$(SHARED_EXT) $(prefix)/lib/libgrpc_unsecure.so
endif
endif
ifneq ($(SYSTEM),MINGW32)
ifneq ($(SYSTEM),Darwin)
	$(Q) ldconfig || true
endif
endif


install-shared_cxx: shared_cxx strip-shared_cxx install-shared_c
ifeq ($(SYSTEM),MINGW32)
	$(E) "[INSTALL] Installing grpc++.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/grpc++.$(SHARED_EXT) $(prefix)/lib/grpc++.$(SHARED_EXT)
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc++-imp.a $(prefix)/lib/libgrpc++-imp.a
else
	$(E) "[INSTALL] Installing libgrpc++.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT) $(prefix)/lib/libgrpc++.$(SHARED_EXT)
ifneq ($(SYSTEM),Darwin)
	$(Q) ln -sf libgrpc++.$(SHARED_EXT) $(prefix)/lib/libgrpc++.so.0
	$(Q) ln -sf libgrpc++.$(SHARED_EXT) $(prefix)/lib/libgrpc++.so
endif
endif
ifeq ($(SYSTEM),MINGW32)
	$(E) "[INSTALL] Installing grpc++_unsecure.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/grpc++_unsecure.$(SHARED_EXT) $(prefix)/lib/grpc++_unsecure.$(SHARED_EXT)
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure-imp.a $(prefix)/lib/libgrpc++_unsecure-imp.a
else
	$(E) "[INSTALL] Installing libgrpc++_unsecure.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.$(SHARED_EXT) $(prefix)/lib/libgrpc++_unsecure.$(SHARED_EXT)
ifneq ($(SYSTEM),Darwin)
	$(Q) ln -sf libgrpc++_unsecure.$(SHARED_EXT) $(prefix)/lib/libgrpc++_unsecure.so.0
	$(Q) ln -sf libgrpc++_unsecure.$(SHARED_EXT) $(prefix)/lib/libgrpc++_unsecure.so
endif
endif
ifneq ($(SYSTEM),MINGW32)
ifneq ($(SYSTEM),Darwin)
	$(Q) ldconfig || true
endif
endif


install-shared_csharp: shared_csharp strip-shared_csharp
ifeq ($(SYSTEM),MINGW32)
	$(E) "[INSTALL] Installing grpc_csharp_ext.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/grpc_csharp_ext.$(SHARED_EXT) $(prefix)/lib/grpc_csharp_ext.$(SHARED_EXT)
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext-imp.a $(prefix)/lib/libgrpc_csharp_ext-imp.a
else
	$(E) "[INSTALL] Installing libgrpc_csharp_ext.$(SHARED_EXT)"
	$(Q) $(INSTALL) -d $(prefix)/lib
	$(Q) $(INSTALL) $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.$(SHARED_EXT) $(prefix)/lib/libgrpc_csharp_ext.$(SHARED_EXT)
ifneq ($(SYSTEM),Darwin)
	$(Q) ln -sf libgrpc_csharp_ext.$(SHARED_EXT) $(prefix)/lib/libgrpc_csharp_ext.so.0
	$(Q) ln -sf libgrpc_csharp_ext.$(SHARED_EXT) $(prefix)/lib/libgrpc_csharp_ext.so
endif
endif
ifneq ($(SYSTEM),MINGW32)
ifneq ($(SYSTEM),Darwin)
	$(Q) ldconfig || true
endif
endif


install-plugins: $(PROTOC_PLUGINS)
ifeq ($(SYSTEM),MINGW32)
	$(Q) false
else
	$(E) "[INSTALL] Installing grpc protoc plugins"
	$(Q) $(INSTALL) -d $(prefix)/bin
	$(Q) $(INSTALL) $(BINDIR)/$(CONFIG)/grpc_cpp_plugin $(prefix)/bin/grpc_cpp_plugin
	$(Q) $(INSTALL) -d $(prefix)/bin
	$(Q) $(INSTALL) $(BINDIR)/$(CONFIG)/grpc_csharp_plugin $(prefix)/bin/grpc_csharp_plugin
	$(Q) $(INSTALL) -d $(prefix)/bin
	$(Q) $(INSTALL) $(BINDIR)/$(CONFIG)/grpc_objective_c_plugin $(prefix)/bin/grpc_objective_c_plugin
	$(Q) $(INSTALL) -d $(prefix)/bin
	$(Q) $(INSTALL) $(BINDIR)/$(CONFIG)/grpc_python_plugin $(prefix)/bin/grpc_python_plugin
	$(Q) $(INSTALL) -d $(prefix)/bin
	$(Q) $(INSTALL) $(BINDIR)/$(CONFIG)/grpc_ruby_plugin $(prefix)/bin/grpc_ruby_plugin
endif

install-certs: etc/roots.pem
	$(E) "[INSTALL] Installing root certificates"
	$(Q) $(INSTALL) -d $(prefix)/share/grpc
	$(Q) $(INSTALL) etc/roots.pem $(prefix)/share/grpc/roots.pem

verify-install:
ifeq ($(INSTALL_OK),true)
	@echo "Your system looks ready to go."
	@echo
else
	@echo "We couldn't find protoc 3.0.0+ installed on your system. While this"
	@echo "won't prevent grpc from working, you won't be able to compile"
	@echo "and run any meaningful code with it."
	@echo
	@echo
	@echo "Please download and install protobuf 3.0.0+ from:"
	@echo
	@echo "   https://github.com/google/protobuf/releases"
	@echo
	@echo "Once you've done so, or if you think this message is in error,"
	@echo "you can re-run this check by doing:"
	@echo
	@echo "   make verify-install"
endif

clean:
	$(E) "[CLEAN]   Cleaning build directories."
	$(Q) $(RM) -rf $(OBJDIR) $(LIBDIR) $(BINDIR) $(GENDIR)


# The various libraries


LIBGPR_SRC = \
    src/core/support/alloc.c \
    src/core/support/cancellable.c \
    src/core/support/cmdline.c \
    src/core/support/cpu_iphone.c \
    src/core/support/cpu_linux.c \
    src/core/support/cpu_posix.c \
    src/core/support/cpu_windows.c \
    src/core/support/env_linux.c \
    src/core/support/env_posix.c \
    src/core/support/env_win32.c \
    src/core/support/file.c \
    src/core/support/file_posix.c \
    src/core/support/file_win32.c \
    src/core/support/histogram.c \
    src/core/support/host_port.c \
    src/core/support/log.c \
    src/core/support/log_android.c \
    src/core/support/log_linux.c \
    src/core/support/log_posix.c \
    src/core/support/log_win32.c \
    src/core/support/murmur_hash.c \
    src/core/support/slice.c \
    src/core/support/slice_buffer.c \
    src/core/support/string.c \
    src/core/support/string_posix.c \
    src/core/support/string_win32.c \
    src/core/support/subprocess_posix.c \
    src/core/support/sync.c \
    src/core/support/sync_posix.c \
    src/core/support/sync_win32.c \
    src/core/support/thd.c \
    src/core/support/thd_posix.c \
    src/core/support/thd_win32.c \
    src/core/support/time.c \
    src/core/support/time_posix.c \
    src/core/support/time_win32.c \
    src/core/support/tls_pthread.c \

PUBLIC_HEADERS_C += \
    include/grpc/support/alloc.h \
    include/grpc/support/atm.h \
    include/grpc/support/atm_gcc_atomic.h \
    include/grpc/support/atm_gcc_sync.h \
    include/grpc/support/atm_win32.h \
    include/grpc/support/cancellable_platform.h \
    include/grpc/support/cmdline.h \
    include/grpc/support/cpu.h \
    include/grpc/support/histogram.h \
    include/grpc/support/host_port.h \
    include/grpc/support/log.h \
    include/grpc/support/log_win32.h \
    include/grpc/support/port_platform.h \
    include/grpc/support/slice.h \
    include/grpc/support/slice_buffer.h \
    include/grpc/support/subprocess.h \
    include/grpc/support/sync.h \
    include/grpc/support/sync_generic.h \
    include/grpc/support/sync_posix.h \
    include/grpc/support/sync_win32.h \
    include/grpc/support/thd.h \
    include/grpc/support/time.h \
    include/grpc/support/tls.h \
    include/grpc/support/tls_gcc.h \
    include/grpc/support/tls_msvc.h \
    include/grpc/support/tls_pthread.h \
    include/grpc/support/useful.h \

LIBGPR_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGPR_SRC))))

$(LIBDIR)/$(CONFIG)/libgpr.a: $(ZLIB_DEP) $(LIBGPR_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgpr.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBGPR_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgpr.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/gpr.$(SHARED_EXT): $(LIBGPR_OBJS)  $(ZLIB_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/gpr.def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgpr-imp.a -o $(LIBDIR)/$(CONFIG)/gpr.$(SHARED_EXT) $(LIBGPR_OBJS) $(LDLIBS)
else
$(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT): $(LIBGPR_OBJS)  $(ZLIB_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name libgpr.$(SHARED_EXT) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT) $(LIBGPR_OBJS) $(LDLIBS)
else
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgpr.so.0 -o $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT) $(LIBGPR_OBJS) $(LDLIBS)
	$(Q) ln -sf libgpr.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgpr.so.0
	$(Q) ln -sf libgpr.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgpr.so
endif
endif

ifneq ($(NO_DEPS),true)
-include $(LIBGPR_OBJS:.o=.dep)
endif


LIBGPR_TEST_UTIL_SRC = \
    test/core/util/test_config.c \


LIBGPR_TEST_UTIL_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGPR_TEST_UTIL_SRC))))

$(LIBDIR)/$(CONFIG)/libgpr_test_util.a: $(ZLIB_DEP) $(LIBGPR_TEST_UTIL_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgpr_test_util.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBGPR_TEST_UTIL_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgpr_test_util.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBGPR_TEST_UTIL_OBJS:.o=.dep)
endif


LIBGRPC_SRC = \
    src/core/httpcli/format_request.c \
    src/core/httpcli/httpcli.c \
    src/core/httpcli/httpcli_security_connector.c \
    src/core/httpcli/parser.c \
    src/core/security/base64.c \
    src/core/security/client_auth_filter.c \
    src/core/security/credentials.c \
    src/core/security/credentials_posix.c \
    src/core/security/credentials_win32.c \
    src/core/security/google_default_credentials.c \
    src/core/security/json_token.c \
    src/core/security/secure_endpoint.c \
    src/core/security/secure_transport_setup.c \
    src/core/security/security_connector.c \
    src/core/security/security_context.c \
    src/core/security/server_auth_filter.c \
    src/core/security/server_secure_chttp2.c \
    src/core/surface/init_secure.c \
    src/core/surface/secure_channel_create.c \
    src/core/tsi/fake_transport_security.c \
    src/core/tsi/ssl_transport_security.c \
    src/core/tsi/transport_security.c \
    src/core/channel/census_filter.c \
    src/core/channel/channel_args.c \
    src/core/channel/channel_stack.c \
    src/core/channel/child_channel.c \
    src/core/channel/client_channel.c \
    src/core/channel/client_setup.c \
    src/core/channel/connected_channel.c \
    src/core/channel/http_client_filter.c \
    src/core/channel/http_server_filter.c \
    src/core/channel/noop_filter.c \
    src/core/compression/algorithm.c \
    src/core/compression/message_compress.c \
    src/core/debug/trace.c \
    src/core/iomgr/alarm.c \
    src/core/iomgr/alarm_heap.c \
    src/core/iomgr/endpoint.c \
    src/core/iomgr/endpoint_pair_posix.c \
    src/core/iomgr/endpoint_pair_windows.c \
    src/core/iomgr/fd_posix.c \
    src/core/iomgr/iocp_windows.c \
    src/core/iomgr/iomgr.c \
    src/core/iomgr/iomgr_posix.c \
    src/core/iomgr/iomgr_windows.c \
    src/core/iomgr/pollset_kick.c \
    src/core/iomgr/pollset_multipoller_with_epoll.c \
    src/core/iomgr/pollset_multipoller_with_poll_posix.c \
    src/core/iomgr/pollset_posix.c \
    src/core/iomgr/pollset_windows.c \
    src/core/iomgr/resolve_address_posix.c \
    src/core/iomgr/resolve_address_windows.c \
    src/core/iomgr/sockaddr_utils.c \
    src/core/iomgr/socket_utils_common_posix.c \
    src/core/iomgr/socket_utils_linux.c \
    src/core/iomgr/socket_utils_posix.c \
    src/core/iomgr/socket_windows.c \
    src/core/iomgr/tcp_client_posix.c \
    src/core/iomgr/tcp_client_windows.c \
    src/core/iomgr/tcp_posix.c \
    src/core/iomgr/tcp_server_posix.c \
    src/core/iomgr/tcp_server_windows.c \
    src/core/iomgr/tcp_windows.c \
    src/core/iomgr/time_averaged_stats.c \
    src/core/iomgr/wakeup_fd_eventfd.c \
    src/core/iomgr/wakeup_fd_nospecial.c \
    src/core/iomgr/wakeup_fd_pipe.c \
    src/core/iomgr/wakeup_fd_posix.c \
    src/core/json/json.c \
    src/core/json/json_reader.c \
    src/core/json/json_string.c \
    src/core/json/json_writer.c \
    src/core/profiling/basic_timers.c \
    src/core/profiling/stap_timers.c \
    src/core/statistics/census_init.c \
    src/core/statistics/census_log.c \
    src/core/statistics/census_rpc_stats.c \
    src/core/statistics/census_tracing.c \
    src/core/statistics/hash_table.c \
    src/core/statistics/window_stats.c \
    src/core/surface/byte_buffer.c \
    src/core/surface/byte_buffer_queue.c \
    src/core/surface/byte_buffer_reader.c \
    src/core/surface/call.c \
    src/core/surface/call_details.c \
    src/core/surface/call_log_batch.c \
    src/core/surface/channel.c \
    src/core/surface/channel_create.c \
    src/core/surface/client.c \
    src/core/surface/completion_queue.c \
    src/core/surface/event_string.c \
    src/core/surface/init.c \
    src/core/surface/lame_client.c \
    src/core/surface/metadata_array.c \
    src/core/surface/server.c \
    src/core/surface/server_chttp2.c \
    src/core/surface/server_create.c \
    src/core/surface/surface_trace.c \
    src/core/transport/chttp2/alpn.c \
    src/core/transport/chttp2/bin_encoder.c \
    src/core/transport/chttp2/frame_data.c \
    src/core/transport/chttp2/frame_goaway.c \
    src/core/transport/chttp2/frame_ping.c \
    src/core/transport/chttp2/frame_rst_stream.c \
    src/core/transport/chttp2/frame_settings.c \
    src/core/transport/chttp2/frame_window_update.c \
    src/core/transport/chttp2/hpack_parser.c \
    src/core/transport/chttp2/hpack_table.c \
    src/core/transport/chttp2/huffsyms.c \
    src/core/transport/chttp2/status_conversion.c \
    src/core/transport/chttp2/stream_encoder.c \
    src/core/transport/chttp2/stream_map.c \
    src/core/transport/chttp2/timeout_encoding.c \
    src/core/transport/chttp2/varint.c \
    src/core/transport/chttp2_transport.c \
    src/core/transport/metadata.c \
    src/core/transport/stream_op.c \
    src/core/transport/transport.c \
    src/core/transport/transport_op_string.c \

PUBLIC_HEADERS_C += \
    include/grpc/grpc_security.h \
    include/grpc/byte_buffer.h \
    include/grpc/byte_buffer_reader.h \
    include/grpc/grpc.h \
    include/grpc/status.h \

LIBGRPC_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libgrpc.a: openssl_dep_error

ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc.$(SHARED_EXT): openssl_dep_error
else
$(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT): openssl_dep_error
endif

else


$(LIBDIR)/$(CONFIG)/libgrpc.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(LIBGRPC_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBGRPC_OBJS)
	$(Q) rm -rf tmp-merge-grpc
	$(Q) mkdir tmp-merge-grpc
	$(Q) ( cd tmp-merge-grpc ; $(AR) x ../$(LIBDIR)/$(CONFIG)/libgrpc.a )
	$(Q) for l in $(OPENSSL_MERGE_LIBS) ; do ( cd tmp-merge-grpc ; ar x ../$${l} ) ; done
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc.a tmp-merge-grpc/__.SYMDEF*
	$(Q) ar rcs $(LIBDIR)/$(CONFIG)/libgrpc.a tmp-merge-grpc/*
	$(Q) rm -rf tmp-merge-grpc
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc.$(SHARED_EXT): $(LIBGRPC_OBJS)  $(ZLIB_DEP) $(LIBDIR)/$(CONFIG)/gpr.$(SHARED_EXT) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc.def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc-imp.a -o $(LIBDIR)/$(CONFIG)/grpc.$(SHARED_EXT) $(LIBGRPC_OBJS) $(LDLIBS) $(LDLIBS_SECURE) $(OPENSSL_MERGE_LIBS) -lgpr-imp
else
$(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT): $(LIBGRPC_OBJS)  $(ZLIB_DEP) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name libgrpc.$(SHARED_EXT) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT) $(LIBGRPC_OBJS) $(LDLIBS) $(LDLIBS_SECURE) $(OPENSSL_MERGE_LIBS) -lgpr
else
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc.so.0 -o $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT) $(LIBGRPC_OBJS) $(LDLIBS) $(LDLIBS_SECURE) $(OPENSSL_MERGE_LIBS) -lgpr
	$(Q) ln -sf libgrpc.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc.so.0
	$(Q) ln -sf libgrpc.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc.so
endif
endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_OBJS:.o=.dep)
endif
endif


LIBGRPC_TEST_UTIL_SRC = \
    test/core/end2end/data/server1_cert.c \
    test/core/end2end/data/server1_key.c \
    test/core/end2end/data/test_root_cert.c \
    test/core/end2end/cq_verifier.c \
    test/core/iomgr/endpoint_tests.c \
    test/core/statistics/census_log_tests.c \
    test/core/util/grpc_profiler.c \
    test/core/util/parse_hexstring.c \
    test/core/util/port_posix.c \
    test/core/util/port_windows.c \
    test/core/util/slice_splitter.c \

PUBLIC_HEADERS_C += \

LIBGRPC_TEST_UTIL_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_TEST_UTIL_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libgrpc_test_util.a: openssl_dep_error


else


$(LIBDIR)/$(CONFIG)/libgrpc_test_util.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(LIBGRPC_TEST_UTIL_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBGRPC_TEST_UTIL_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a
endif




endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_TEST_UTIL_OBJS:.o=.dep)
endif
endif


LIBGRPC_TEST_UTIL_UNSECURE_SRC = \
    test/core/end2end/cq_verifier.c \
    test/core/iomgr/endpoint_tests.c \
    test/core/statistics/census_log_tests.c \
    test/core/util/grpc_profiler.c \
    test/core/util/parse_hexstring.c \
    test/core/util/port_posix.c \
    test/core/util/port_windows.c \
    test/core/util/slice_splitter.c \

PUBLIC_HEADERS_C += \

LIBGRPC_TEST_UTIL_UNSECURE_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_TEST_UTIL_UNSECURE_SRC))))

$(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a: $(ZLIB_DEP) $(LIBGRPC_TEST_UTIL_UNSECURE_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBGRPC_TEST_UTIL_UNSECURE_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_TEST_UTIL_UNSECURE_OBJS:.o=.dep)
endif


LIBGRPC_UNSECURE_SRC = \
    src/core/surface/init_unsecure.c \
    src/core/channel/census_filter.c \
    src/core/channel/channel_args.c \
    src/core/channel/channel_stack.c \
    src/core/channel/child_channel.c \
    src/core/channel/client_channel.c \
    src/core/channel/client_setup.c \
    src/core/channel/connected_channel.c \
    src/core/channel/http_client_filter.c \
    src/core/channel/http_server_filter.c \
    src/core/channel/noop_filter.c \
    src/core/compression/algorithm.c \
    src/core/compression/message_compress.c \
    src/core/debug/trace.c \
    src/core/iomgr/alarm.c \
    src/core/iomgr/alarm_heap.c \
    src/core/iomgr/endpoint.c \
    src/core/iomgr/endpoint_pair_posix.c \
    src/core/iomgr/endpoint_pair_windows.c \
    src/core/iomgr/fd_posix.c \
    src/core/iomgr/iocp_windows.c \
    src/core/iomgr/iomgr.c \
    src/core/iomgr/iomgr_posix.c \
    src/core/iomgr/iomgr_windows.c \
    src/core/iomgr/pollset_kick.c \
    src/core/iomgr/pollset_multipoller_with_epoll.c \
    src/core/iomgr/pollset_multipoller_with_poll_posix.c \
    src/core/iomgr/pollset_posix.c \
    src/core/iomgr/pollset_windows.c \
    src/core/iomgr/resolve_address_posix.c \
    src/core/iomgr/resolve_address_windows.c \
    src/core/iomgr/sockaddr_utils.c \
    src/core/iomgr/socket_utils_common_posix.c \
    src/core/iomgr/socket_utils_linux.c \
    src/core/iomgr/socket_utils_posix.c \
    src/core/iomgr/socket_windows.c \
    src/core/iomgr/tcp_client_posix.c \
    src/core/iomgr/tcp_client_windows.c \
    src/core/iomgr/tcp_posix.c \
    src/core/iomgr/tcp_server_posix.c \
    src/core/iomgr/tcp_server_windows.c \
    src/core/iomgr/tcp_windows.c \
    src/core/iomgr/time_averaged_stats.c \
    src/core/iomgr/wakeup_fd_eventfd.c \
    src/core/iomgr/wakeup_fd_nospecial.c \
    src/core/iomgr/wakeup_fd_pipe.c \
    src/core/iomgr/wakeup_fd_posix.c \
    src/core/json/json.c \
    src/core/json/json_reader.c \
    src/core/json/json_string.c \
    src/core/json/json_writer.c \
    src/core/profiling/basic_timers.c \
    src/core/profiling/stap_timers.c \
    src/core/statistics/census_init.c \
    src/core/statistics/census_log.c \
    src/core/statistics/census_rpc_stats.c \
    src/core/statistics/census_tracing.c \
    src/core/statistics/hash_table.c \
    src/core/statistics/window_stats.c \
    src/core/surface/byte_buffer.c \
    src/core/surface/byte_buffer_queue.c \
    src/core/surface/byte_buffer_reader.c \
    src/core/surface/call.c \
    src/core/surface/call_details.c \
    src/core/surface/call_log_batch.c \
    src/core/surface/channel.c \
    src/core/surface/channel_create.c \
    src/core/surface/client.c \
    src/core/surface/completion_queue.c \
    src/core/surface/event_string.c \
    src/core/surface/init.c \
    src/core/surface/lame_client.c \
    src/core/surface/metadata_array.c \
    src/core/surface/server.c \
    src/core/surface/server_chttp2.c \
    src/core/surface/server_create.c \
    src/core/surface/surface_trace.c \
    src/core/transport/chttp2/alpn.c \
    src/core/transport/chttp2/bin_encoder.c \
    src/core/transport/chttp2/frame_data.c \
    src/core/transport/chttp2/frame_goaway.c \
    src/core/transport/chttp2/frame_ping.c \
    src/core/transport/chttp2/frame_rst_stream.c \
    src/core/transport/chttp2/frame_settings.c \
    src/core/transport/chttp2/frame_window_update.c \
    src/core/transport/chttp2/hpack_parser.c \
    src/core/transport/chttp2/hpack_table.c \
    src/core/transport/chttp2/huffsyms.c \
    src/core/transport/chttp2/status_conversion.c \
    src/core/transport/chttp2/stream_encoder.c \
    src/core/transport/chttp2/stream_map.c \
    src/core/transport/chttp2/timeout_encoding.c \
    src/core/transport/chttp2/varint.c \
    src/core/transport/chttp2_transport.c \
    src/core/transport/metadata.c \
    src/core/transport/stream_op.c \
    src/core/transport/transport.c \
    src/core/transport/transport_op_string.c \

PUBLIC_HEADERS_C += \
    include/grpc/byte_buffer.h \
    include/grpc/byte_buffer_reader.h \
    include/grpc/grpc.h \
    include/grpc/status.h \

LIBGRPC_UNSECURE_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_UNSECURE_SRC))))

$(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a: $(ZLIB_DEP) $(LIBGRPC_UNSECURE_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBGRPC_UNSECURE_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc_unsecure.$(SHARED_EXT): $(LIBGRPC_UNSECURE_OBJS)  $(ZLIB_DEP) $(LIBDIR)/$(CONFIG)/gpr.$(SHARED_EXT)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc_unsecure.def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc_unsecure-imp.a -o $(LIBDIR)/$(CONFIG)/grpc_unsecure.$(SHARED_EXT) $(LIBGRPC_UNSECURE_OBJS) $(LDLIBS) -lgpr-imp
else
$(LIBDIR)/$(CONFIG)/libgrpc_unsecure.$(SHARED_EXT): $(LIBGRPC_UNSECURE_OBJS)  $(ZLIB_DEP) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name libgrpc_unsecure.$(SHARED_EXT) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.$(SHARED_EXT) $(LIBGRPC_UNSECURE_OBJS) $(LDLIBS) -lgpr
else
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc_unsecure.so.0 -o $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.$(SHARED_EXT) $(LIBGRPC_UNSECURE_OBJS) $(LDLIBS) -lgpr
	$(Q) ln -sf libgrpc_unsecure.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.so.0
	$(Q) ln -sf libgrpc_unsecure.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.so
endif
endif

ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_UNSECURE_OBJS:.o=.dep)
endif


LIBGRPC++_SRC = \
    src/cpp/client/secure_credentials.cc \
    src/cpp/server/secure_server_credentials.cc \
    src/cpp/client/channel.cc \
    src/cpp/client/channel_arguments.cc \
    src/cpp/client/client_context.cc \
    src/cpp/client/client_unary_call.cc \
    src/cpp/client/create_channel.cc \
    src/cpp/client/credentials.cc \
    src/cpp/client/generic_stub.cc \
    src/cpp/client/insecure_credentials.cc \
    src/cpp/client/internal_stub.cc \
    src/cpp/common/call.cc \
    src/cpp/common/completion_queue.cc \
    src/cpp/common/rpc_method.cc \
    src/cpp/proto/proto_utils.cc \
    src/cpp/server/async_generic_service.cc \
    src/cpp/server/insecure_server_credentials.cc \
    src/cpp/server/server.cc \
    src/cpp/server/server_builder.cc \
    src/cpp/server/server_context.cc \
    src/cpp/server/server_credentials.cc \
    src/cpp/server/thread_pool.cc \
    src/cpp/util/byte_buffer.cc \
    src/cpp/util/slice.cc \
    src/cpp/util/status.cc \
    src/cpp/util/time.cc \

PUBLIC_HEADERS_CXX += \
    include/grpc++/async_generic_service.h \
    include/grpc++/async_unary_call.h \
    include/grpc++/byte_buffer.h \
    include/grpc++/channel_arguments.h \
    include/grpc++/channel_interface.h \
    include/grpc++/client_context.h \
    include/grpc++/completion_queue.h \
    include/grpc++/config.h \
    include/grpc++/create_channel.h \
    include/grpc++/credentials.h \
    include/grpc++/generic_stub.h \
    include/grpc++/impl/call.h \
    include/grpc++/impl/client_unary_call.h \
    include/grpc++/impl/grpc_library.h \
    include/grpc++/impl/internal_stub.h \
    include/grpc++/impl/rpc_method.h \
    include/grpc++/impl/rpc_service_method.h \
    include/grpc++/impl/service_type.h \
    include/grpc++/impl/sync.h \
    include/grpc++/impl/sync_cxx11.h \
    include/grpc++/impl/sync_no_cxx11.h \
    include/grpc++/impl/thd.h \
    include/grpc++/impl/thd_cxx11.h \
    include/grpc++/impl/thd_no_cxx11.h \
    include/grpc++/server.h \
    include/grpc++/server_builder.h \
    include/grpc++/server_context.h \
    include/grpc++/server_credentials.h \
    include/grpc++/slice.h \
    include/grpc++/status.h \
    include/grpc++/status_code_enum.h \
    include/grpc++/stream.h \
    include/grpc++/thread_pool_interface.h \
    include/grpc++/time.h \

LIBGRPC++_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC++_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libgrpc++.a: openssl_dep_error

ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++.$(SHARED_EXT): openssl_dep_error
else
$(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT): openssl_dep_error
endif

else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc++.a: protobuf_dep_error

ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++.$(SHARED_EXT): protobuf_dep_error
else
$(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT): protobuf_dep_error
endif

else

$(LIBDIR)/$(CONFIG)/libgrpc++.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(PROTOBUF_DEP) $(LIBGRPC++_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc++.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBGRPC++_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc++.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++.$(SHARED_EXT): $(LIBGRPC++_OBJS)  $(ZLIB_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/gpr.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/grpc.$(SHARED_EXT) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc++.def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc++-imp.a -o $(LIBDIR)/$(CONFIG)/grpc++.$(SHARED_EXT) $(LIBGRPC++_OBJS) $(LDLIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) -lgpr-imp -lgrpc-imp
else
$(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT): $(LIBGRPC++_OBJS)  $(ZLIB_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name libgrpc++.$(SHARED_EXT) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT) $(LIBGRPC++_OBJS) $(LDLIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) -lgpr -lgrpc
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc++.so.0 -o $(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT) $(LIBGRPC++_OBJS) $(LDLIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) -lgpr -lgrpc
	$(Q) ln -sf libgrpc++.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc++.so.0
	$(Q) ln -sf libgrpc++.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc++.so
endif
endif

endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC++_OBJS:.o=.dep)
endif
endif


LIBGRPC++_TEST_CONFIG_SRC = \
    test/cpp/util/test_config.cc \


LIBGRPC++_TEST_CONFIG_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC++_TEST_CONFIG_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a: openssl_dep_error


else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(PROTOBUF_DEP) $(LIBGRPC++_TEST_CONFIG_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a $(LIBGRPC++_TEST_CONFIG_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
endif




endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC++_TEST_CONFIG_OBJS:.o=.dep)
endif
endif


LIBGRPC++_TEST_UTIL_SRC = \
    $(GENDIR)/test/cpp/util/messages.pb.cc $(GENDIR)/test/cpp/util/messages.grpc.pb.cc \
    $(GENDIR)/test/cpp/util/echo.pb.cc $(GENDIR)/test/cpp/util/echo.grpc.pb.cc \
    $(GENDIR)/test/cpp/util/echo_duplicate.pb.cc $(GENDIR)/test/cpp/util/echo_duplicate.grpc.pb.cc \
    test/cpp/util/cli_call.cc \
    test/cpp/util/create_test_channel.cc \
    test/cpp/util/fake_credentials.cc \


LIBGRPC++_TEST_UTIL_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC++_TEST_UTIL_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a: openssl_dep_error


else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(PROTOBUF_DEP) $(LIBGRPC++_TEST_UTIL_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBGRPC++_TEST_UTIL_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a
endif




endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC++_TEST_UTIL_OBJS:.o=.dep)
endif
endif
$(OBJDIR)/$(CONFIG)/test/cpp/util/cli_call.o: $(GENDIR)/test/cpp/util/messages.pb.cc $(GENDIR)/test/cpp/util/messages.grpc.pb.cc $(GENDIR)/test/cpp/util/echo.pb.cc $(GENDIR)/test/cpp/util/echo.grpc.pb.cc $(GENDIR)/test/cpp/util/echo_duplicate.pb.cc $(GENDIR)/test/cpp/util/echo_duplicate.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/util/create_test_channel.o: $(GENDIR)/test/cpp/util/messages.pb.cc $(GENDIR)/test/cpp/util/messages.grpc.pb.cc $(GENDIR)/test/cpp/util/echo.pb.cc $(GENDIR)/test/cpp/util/echo.grpc.pb.cc $(GENDIR)/test/cpp/util/echo_duplicate.pb.cc $(GENDIR)/test/cpp/util/echo_duplicate.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/util/fake_credentials.o: $(GENDIR)/test/cpp/util/messages.pb.cc $(GENDIR)/test/cpp/util/messages.grpc.pb.cc $(GENDIR)/test/cpp/util/echo.pb.cc $(GENDIR)/test/cpp/util/echo.grpc.pb.cc $(GENDIR)/test/cpp/util/echo_duplicate.pb.cc $(GENDIR)/test/cpp/util/echo_duplicate.grpc.pb.cc


LIBGRPC++_UNSECURE_SRC = \
    src/cpp/client/channel.cc \
    src/cpp/client/channel_arguments.cc \
    src/cpp/client/client_context.cc \
    src/cpp/client/client_unary_call.cc \
    src/cpp/client/create_channel.cc \
    src/cpp/client/credentials.cc \
    src/cpp/client/generic_stub.cc \
    src/cpp/client/insecure_credentials.cc \
    src/cpp/client/internal_stub.cc \
    src/cpp/common/call.cc \
    src/cpp/common/completion_queue.cc \
    src/cpp/common/rpc_method.cc \
    src/cpp/proto/proto_utils.cc \
    src/cpp/server/async_generic_service.cc \
    src/cpp/server/insecure_server_credentials.cc \
    src/cpp/server/server.cc \
    src/cpp/server/server_builder.cc \
    src/cpp/server/server_context.cc \
    src/cpp/server/server_credentials.cc \
    src/cpp/server/thread_pool.cc \
    src/cpp/util/byte_buffer.cc \
    src/cpp/util/slice.cc \
    src/cpp/util/status.cc \
    src/cpp/util/time.cc \

PUBLIC_HEADERS_CXX += \
    include/grpc++/async_generic_service.h \
    include/grpc++/async_unary_call.h \
    include/grpc++/byte_buffer.h \
    include/grpc++/channel_arguments.h \
    include/grpc++/channel_interface.h \
    include/grpc++/client_context.h \
    include/grpc++/completion_queue.h \
    include/grpc++/config.h \
    include/grpc++/create_channel.h \
    include/grpc++/credentials.h \
    include/grpc++/generic_stub.h \
    include/grpc++/impl/call.h \
    include/grpc++/impl/client_unary_call.h \
    include/grpc++/impl/grpc_library.h \
    include/grpc++/impl/internal_stub.h \
    include/grpc++/impl/rpc_method.h \
    include/grpc++/impl/rpc_service_method.h \
    include/grpc++/impl/service_type.h \
    include/grpc++/impl/sync.h \
    include/grpc++/impl/sync_cxx11.h \
    include/grpc++/impl/sync_no_cxx11.h \
    include/grpc++/impl/thd.h \
    include/grpc++/impl/thd_cxx11.h \
    include/grpc++/impl/thd_no_cxx11.h \
    include/grpc++/server.h \
    include/grpc++/server_builder.h \
    include/grpc++/server_context.h \
    include/grpc++/server_credentials.h \
    include/grpc++/slice.h \
    include/grpc++/status.h \
    include/grpc++/status_code_enum.h \
    include/grpc++/stream.h \
    include/grpc++/thread_pool_interface.h \
    include/grpc++/time.h \

LIBGRPC++_UNSECURE_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC++_UNSECURE_SRC))))

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a: protobuf_dep_error

ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++_unsecure.$(SHARED_EXT): protobuf_dep_error
else
$(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.$(SHARED_EXT): protobuf_dep_error
endif

else

$(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a: $(ZLIB_DEP) $(PROTOBUF_DEP) $(LIBGRPC++_UNSECURE_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a $(LIBGRPC++_UNSECURE_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++_unsecure.$(SHARED_EXT): $(LIBGRPC++_UNSECURE_OBJS)  $(ZLIB_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/gpr.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/grpc_unsecure.$(SHARED_EXT)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc++_unsecure.def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc++_unsecure-imp.a -o $(LIBDIR)/$(CONFIG)/grpc++_unsecure.$(SHARED_EXT) $(LIBGRPC++_UNSECURE_OBJS) $(LDLIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) -lgpr-imp -lgrpc_unsecure-imp
else
$(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.$(SHARED_EXT): $(LIBGRPC++_UNSECURE_OBJS)  $(ZLIB_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.$(SHARED_EXT)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name libgrpc++_unsecure.$(SHARED_EXT) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.$(SHARED_EXT) $(LIBGRPC++_UNSECURE_OBJS) $(LDLIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) -lgpr -lgrpc_unsecure
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc++_unsecure.so.0 -o $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.$(SHARED_EXT) $(LIBGRPC++_UNSECURE_OBJS) $(LDLIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) -lgpr -lgrpc_unsecure
	$(Q) ln -sf libgrpc++_unsecure.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.so.0
	$(Q) ln -sf libgrpc++_unsecure.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.so
endif
endif

endif

ifneq ($(NO_DEPS),true)
-include $(LIBGRPC++_UNSECURE_OBJS:.o=.dep)
endif


LIBGRPC_PLUGIN_SUPPORT_SRC = \
    src/compiler/cpp_generator.cc \
    src/compiler/csharp_generator.cc \
    src/compiler/objective_c_generator.cc \
    src/compiler/python_generator.cc \
    src/compiler/ruby_generator.cc \


LIBGRPC_PLUGIN_SUPPORT_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_PLUGIN_SUPPORT_SRC))))

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a: $(ZLIB_DEP) $(PROTOBUF_DEP) $(LIBGRPC_PLUGIN_SUPPORT_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(LIBGRPC_PLUGIN_SUPPORT_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
endif




endif

ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_PLUGIN_SUPPORT_OBJS:.o=.dep)
endif


LIBINTEROP_CLIENT_HELPER_SRC = \
    test/cpp/interop/client_helper.cc \


LIBINTEROP_CLIENT_HELPER_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBINTEROP_CLIENT_HELPER_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libinterop_client_helper.a: openssl_dep_error


else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libinterop_client_helper.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libinterop_client_helper.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(PROTOBUF_DEP) $(LIBINTEROP_CLIENT_HELPER_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libinterop_client_helper.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libinterop_client_helper.a $(LIBINTEROP_CLIENT_HELPER_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libinterop_client_helper.a
endif




endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBINTEROP_CLIENT_HELPER_OBJS:.o=.dep)
endif
endif


LIBINTEROP_CLIENT_MAIN_SRC = \
    $(GENDIR)/test/proto/empty.pb.cc $(GENDIR)/test/proto/empty.grpc.pb.cc \
    $(GENDIR)/test/proto/messages.pb.cc $(GENDIR)/test/proto/messages.grpc.pb.cc \
    $(GENDIR)/test/proto/test.pb.cc $(GENDIR)/test/proto/test.grpc.pb.cc \
    test/cpp/interop/client.cc \
    test/cpp/interop/interop_client.cc \


LIBINTEROP_CLIENT_MAIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBINTEROP_CLIENT_MAIN_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libinterop_client_main.a: openssl_dep_error


else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libinterop_client_main.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libinterop_client_main.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(PROTOBUF_DEP) $(LIBINTEROP_CLIENT_MAIN_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libinterop_client_main.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libinterop_client_main.a $(LIBINTEROP_CLIENT_MAIN_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libinterop_client_main.a
endif




endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBINTEROP_CLIENT_MAIN_OBJS:.o=.dep)
endif
endif
$(OBJDIR)/$(CONFIG)/test/cpp/interop/client.o: $(GENDIR)/test/proto/empty.pb.cc $(GENDIR)/test/proto/empty.grpc.pb.cc $(GENDIR)/test/proto/messages.pb.cc $(GENDIR)/test/proto/messages.grpc.pb.cc $(GENDIR)/test/proto/test.pb.cc $(GENDIR)/test/proto/test.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/interop/interop_client.o: $(GENDIR)/test/proto/empty.pb.cc $(GENDIR)/test/proto/empty.grpc.pb.cc $(GENDIR)/test/proto/messages.pb.cc $(GENDIR)/test/proto/messages.grpc.pb.cc $(GENDIR)/test/proto/test.pb.cc $(GENDIR)/test/proto/test.grpc.pb.cc


LIBINTEROP_SERVER_HELPER_SRC = \
    test/cpp/interop/server_helper.cc \


LIBINTEROP_SERVER_HELPER_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBINTEROP_SERVER_HELPER_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libinterop_server_helper.a: openssl_dep_error


else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libinterop_server_helper.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libinterop_server_helper.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(PROTOBUF_DEP) $(LIBINTEROP_SERVER_HELPER_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libinterop_server_helper.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libinterop_server_helper.a $(LIBINTEROP_SERVER_HELPER_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libinterop_server_helper.a
endif




endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBINTEROP_SERVER_HELPER_OBJS:.o=.dep)
endif
endif


LIBINTEROP_SERVER_MAIN_SRC = \
    $(GENDIR)/test/proto/empty.pb.cc $(GENDIR)/test/proto/empty.grpc.pb.cc \
    $(GENDIR)/test/proto/messages.pb.cc $(GENDIR)/test/proto/messages.grpc.pb.cc \
    $(GENDIR)/test/proto/test.pb.cc $(GENDIR)/test/proto/test.grpc.pb.cc \
    test/cpp/interop/server.cc \


LIBINTEROP_SERVER_MAIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBINTEROP_SERVER_MAIN_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libinterop_server_main.a: openssl_dep_error


else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libinterop_server_main.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libinterop_server_main.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(PROTOBUF_DEP) $(LIBINTEROP_SERVER_MAIN_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libinterop_server_main.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libinterop_server_main.a $(LIBINTEROP_SERVER_MAIN_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libinterop_server_main.a
endif




endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBINTEROP_SERVER_MAIN_OBJS:.o=.dep)
endif
endif
$(OBJDIR)/$(CONFIG)/test/cpp/interop/server.o: $(GENDIR)/test/proto/empty.pb.cc $(GENDIR)/test/proto/empty.grpc.pb.cc $(GENDIR)/test/proto/messages.pb.cc $(GENDIR)/test/proto/messages.grpc.pb.cc $(GENDIR)/test/proto/test.pb.cc $(GENDIR)/test/proto/test.grpc.pb.cc


LIBPUBSUB_CLIENT_LIB_SRC = \
    $(GENDIR)/examples/pubsub/label.pb.cc $(GENDIR)/examples/pubsub/label.grpc.pb.cc \
    $(GENDIR)/examples/pubsub/empty.pb.cc $(GENDIR)/examples/pubsub/empty.grpc.pb.cc \
    $(GENDIR)/examples/pubsub/pubsub.pb.cc $(GENDIR)/examples/pubsub/pubsub.grpc.pb.cc \
    examples/pubsub/publisher.cc \
    examples/pubsub/subscriber.cc \


LIBPUBSUB_CLIENT_LIB_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBPUBSUB_CLIENT_LIB_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a: openssl_dep_error


else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(PROTOBUF_DEP) $(LIBPUBSUB_CLIENT_LIB_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBPUBSUB_CLIENT_LIB_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a
endif




endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBPUBSUB_CLIENT_LIB_OBJS:.o=.dep)
endif
endif
$(OBJDIR)/$(CONFIG)/examples/pubsub/publisher.o: $(GENDIR)/examples/pubsub/label.pb.cc $(GENDIR)/examples/pubsub/label.grpc.pb.cc $(GENDIR)/examples/pubsub/empty.pb.cc $(GENDIR)/examples/pubsub/empty.grpc.pb.cc $(GENDIR)/examples/pubsub/pubsub.pb.cc $(GENDIR)/examples/pubsub/pubsub.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/examples/pubsub/subscriber.o: $(GENDIR)/examples/pubsub/label.pb.cc $(GENDIR)/examples/pubsub/label.grpc.pb.cc $(GENDIR)/examples/pubsub/empty.pb.cc $(GENDIR)/examples/pubsub/empty.grpc.pb.cc $(GENDIR)/examples/pubsub/pubsub.pb.cc $(GENDIR)/examples/pubsub/pubsub.grpc.pb.cc


LIBQPS_SRC = \
    $(GENDIR)/test/cpp/qps/qpstest.pb.cc $(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc \
    test/cpp/qps/client_async.cc \
    test/cpp/qps/client_sync.cc \
    test/cpp/qps/driver.cc \
    test/cpp/qps/qps_worker.cc \
    test/cpp/qps/report.cc \
    test/cpp/qps/server_async.cc \
    test/cpp/qps/server_sync.cc \
    test/cpp/qps/timer.cc \


LIBQPS_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBQPS_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libqps.a: openssl_dep_error


else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libqps.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libqps.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(PROTOBUF_DEP) $(LIBQPS_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libqps.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libqps.a $(LIBQPS_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libqps.a
endif




endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBQPS_OBJS:.o=.dep)
endif
endif
$(OBJDIR)/$(CONFIG)/test/cpp/qps/client_async.o: $(GENDIR)/test/cpp/qps/qpstest.pb.cc $(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/qps/client_sync.o: $(GENDIR)/test/cpp/qps/qpstest.pb.cc $(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/qps/driver.o: $(GENDIR)/test/cpp/qps/qpstest.pb.cc $(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/qps/qps_worker.o: $(GENDIR)/test/cpp/qps/qpstest.pb.cc $(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/qps/report.o: $(GENDIR)/test/cpp/qps/qpstest.pb.cc $(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/qps/server_async.o: $(GENDIR)/test/cpp/qps/qpstest.pb.cc $(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/qps/server_sync.o: $(GENDIR)/test/cpp/qps/qpstest.pb.cc $(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/test/cpp/qps/timer.o: $(GENDIR)/test/cpp/qps/qpstest.pb.cc $(GENDIR)/test/cpp/qps/qpstest.grpc.pb.cc


LIBGRPC_CSHARP_EXT_SRC = \
    src/csharp/ext/grpc_csharp_ext.c \


LIBGRPC_CSHARP_EXT_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_CSHARP_EXT_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a: openssl_dep_error

ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc_csharp_ext.$(SHARED_EXT): openssl_dep_error
else
$(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.$(SHARED_EXT): openssl_dep_error
endif

else


$(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(LIBGRPC_CSHARP_EXT_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a $(LIBGRPC_CSHARP_EXT_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc_csharp_ext.$(SHARED_EXT): $(LIBGRPC_CSHARP_EXT_OBJS)  $(ZLIB_DEP) $(LIBDIR)/$(CONFIG)/gpr.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/grpc.$(SHARED_EXT) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc_csharp_ext.def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext-imp.a -o $(LIBDIR)/$(CONFIG)/grpc_csharp_ext.$(SHARED_EXT) $(LIBGRPC_CSHARP_EXT_OBJS) $(LDLIBS) -lgpr-imp -lgrpc-imp
else
$(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.$(SHARED_EXT): $(LIBGRPC_CSHARP_EXT_OBJS)  $(ZLIB_DEP) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name libgrpc_csharp_ext.$(SHARED_EXT) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.$(SHARED_EXT) $(LIBGRPC_CSHARP_EXT_OBJS) $(LDLIBS) -lgpr -lgrpc
else
	$(Q) $(LD) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc_csharp_ext.so.0 -o $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.$(SHARED_EXT) $(LIBGRPC_CSHARP_EXT_OBJS) $(LDLIBS) -lgpr -lgrpc
	$(Q) ln -sf libgrpc_csharp_ext.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.so.0
	$(Q) ln -sf libgrpc_csharp_ext.$(SHARED_EXT) $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.so
endif
endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_CSHARP_EXT_OBJS:.o=.dep)
endif
endif


LIBEND2END_FIXTURE_CHTTP2_FAKE_SECURITY_SRC = \
    test/core/end2end/fixtures/chttp2_fake_security.c \


LIBEND2END_FIXTURE_CHTTP2_FAKE_SECURITY_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_FIXTURE_CHTTP2_FAKE_SECURITY_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a: openssl_dep_error


else


$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(LIBEND2END_FIXTURE_CHTTP2_FAKE_SECURITY_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBEND2END_FIXTURE_CHTTP2_FAKE_SECURITY_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a
endif




endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_FIXTURE_CHTTP2_FAKE_SECURITY_OBJS:.o=.dep)
endif
endif


LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_SRC = \
    test/core/end2end/fixtures/chttp2_fullstack.c \


LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a: $(ZLIB_DEP) $(LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_OBJS:.o=.dep)
endif


LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_UDS_POSIX_SRC = \
    test/core/end2end/fixtures/chttp2_fullstack_uds_posix.c \


LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_UDS_POSIX_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_UDS_POSIX_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a: $(ZLIB_DEP) $(LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_UDS_POSIX_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_UDS_POSIX_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_FIXTURE_CHTTP2_FULLSTACK_UDS_POSIX_OBJS:.o=.dep)
endif


LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_FULLSTACK_SRC = \
    test/core/end2end/fixtures/chttp2_simple_ssl_fullstack.c \


LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_FULLSTACK_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_FULLSTACK_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a: openssl_dep_error


else


$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_FULLSTACK_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_FULLSTACK_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a
endif




endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_FULLSTACK_OBJS:.o=.dep)
endif
endif


LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_WITH_OAUTH2_FULLSTACK_SRC = \
    test/core/end2end/fixtures/chttp2_simple_ssl_with_oauth2_fullstack.c \


LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_WITH_OAUTH2_FULLSTACK_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_WITH_OAUTH2_FULLSTACK_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a: openssl_dep_error


else


$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_WITH_OAUTH2_FULLSTACK_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_WITH_OAUTH2_FULLSTACK_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a
endif




endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_FIXTURE_CHTTP2_SIMPLE_SSL_WITH_OAUTH2_FULLSTACK_OBJS:.o=.dep)
endif
endif


LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_SRC = \
    test/core/end2end/fixtures/chttp2_socket_pair.c \


LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a: $(ZLIB_DEP) $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_OBJS:.o=.dep)
endif


LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_ONE_BYTE_AT_A_TIME_SRC = \
    test/core/end2end/fixtures/chttp2_socket_pair_one_byte_at_a_time.c \


LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_ONE_BYTE_AT_A_TIME_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_ONE_BYTE_AT_A_TIME_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a: $(ZLIB_DEP) $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_ONE_BYTE_AT_A_TIME_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_ONE_BYTE_AT_A_TIME_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_ONE_BYTE_AT_A_TIME_OBJS:.o=.dep)
endif


LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_WITH_GRPC_TRACE_SRC = \
    test/core/end2end/fixtures/chttp2_socket_pair_with_grpc_trace.c \


LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_WITH_GRPC_TRACE_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_WITH_GRPC_TRACE_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a: $(ZLIB_DEP) $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_WITH_GRPC_TRACE_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_WITH_GRPC_TRACE_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_FIXTURE_CHTTP2_SOCKET_PAIR_WITH_GRPC_TRACE_OBJS:.o=.dep)
endif


LIBEND2END_TEST_BAD_HOSTNAME_SRC = \
    test/core/end2end/tests/bad_hostname.c \


LIBEND2END_TEST_BAD_HOSTNAME_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_BAD_HOSTNAME_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a: $(ZLIB_DEP) $(LIBEND2END_TEST_BAD_HOSTNAME_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBEND2END_TEST_BAD_HOSTNAME_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_BAD_HOSTNAME_OBJS:.o=.dep)
endif


LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_SRC = \
    test/core/end2end/tests/cancel_after_accept.c \


LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a: $(ZLIB_DEP) $(LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_OBJS:.o=.dep)
endif


LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_AND_WRITES_CLOSED_SRC = \
    test/core/end2end/tests/cancel_after_accept_and_writes_closed.c \


LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_AND_WRITES_CLOSED_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_AND_WRITES_CLOSED_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a: $(ZLIB_DEP) $(LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_AND_WRITES_CLOSED_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_AND_WRITES_CLOSED_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_CANCEL_AFTER_ACCEPT_AND_WRITES_CLOSED_OBJS:.o=.dep)
endif


LIBEND2END_TEST_CANCEL_AFTER_INVOKE_SRC = \
    test/core/end2end/tests/cancel_after_invoke.c \


LIBEND2END_TEST_CANCEL_AFTER_INVOKE_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_CANCEL_AFTER_INVOKE_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a: $(ZLIB_DEP) $(LIBEND2END_TEST_CANCEL_AFTER_INVOKE_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBEND2END_TEST_CANCEL_AFTER_INVOKE_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_CANCEL_AFTER_INVOKE_OBJS:.o=.dep)
endif


LIBEND2END_TEST_CANCEL_BEFORE_INVOKE_SRC = \
    test/core/end2end/tests/cancel_before_invoke.c \


LIBEND2END_TEST_CANCEL_BEFORE_INVOKE_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_CANCEL_BEFORE_INVOKE_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a: $(ZLIB_DEP) $(LIBEND2END_TEST_CANCEL_BEFORE_INVOKE_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBEND2END_TEST_CANCEL_BEFORE_INVOKE_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_CANCEL_BEFORE_INVOKE_OBJS:.o=.dep)
endif


LIBEND2END_TEST_CANCEL_IN_A_VACUUM_SRC = \
    test/core/end2end/tests/cancel_in_a_vacuum.c \


LIBEND2END_TEST_CANCEL_IN_A_VACUUM_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_CANCEL_IN_A_VACUUM_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a: $(ZLIB_DEP) $(LIBEND2END_TEST_CANCEL_IN_A_VACUUM_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBEND2END_TEST_CANCEL_IN_A_VACUUM_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_CANCEL_IN_A_VACUUM_OBJS:.o=.dep)
endif


LIBEND2END_TEST_CENSUS_SIMPLE_REQUEST_SRC = \
    test/core/end2end/tests/census_simple_request.c \


LIBEND2END_TEST_CENSUS_SIMPLE_REQUEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_CENSUS_SIMPLE_REQUEST_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a: $(ZLIB_DEP) $(LIBEND2END_TEST_CENSUS_SIMPLE_REQUEST_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBEND2END_TEST_CENSUS_SIMPLE_REQUEST_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_CENSUS_SIMPLE_REQUEST_OBJS:.o=.dep)
endif


LIBEND2END_TEST_DISAPPEARING_SERVER_SRC = \
    test/core/end2end/tests/disappearing_server.c \


LIBEND2END_TEST_DISAPPEARING_SERVER_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_DISAPPEARING_SERVER_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a: $(ZLIB_DEP) $(LIBEND2END_TEST_DISAPPEARING_SERVER_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBEND2END_TEST_DISAPPEARING_SERVER_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_DISAPPEARING_SERVER_OBJS:.o=.dep)
endif


LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_INFLIGHT_CALLS_SRC = \
    test/core/end2end/tests/early_server_shutdown_finishes_inflight_calls.c \


LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_INFLIGHT_CALLS_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_INFLIGHT_CALLS_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a: $(ZLIB_DEP) $(LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_INFLIGHT_CALLS_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_INFLIGHT_CALLS_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_INFLIGHT_CALLS_OBJS:.o=.dep)
endif


LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_TAGS_SRC = \
    test/core/end2end/tests/early_server_shutdown_finishes_tags.c \


LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_TAGS_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_TAGS_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a: $(ZLIB_DEP) $(LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_TAGS_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_TAGS_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_EARLY_SERVER_SHUTDOWN_FINISHES_TAGS_OBJS:.o=.dep)
endif


LIBEND2END_TEST_EMPTY_BATCH_SRC = \
    test/core/end2end/tests/empty_batch.c \


LIBEND2END_TEST_EMPTY_BATCH_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_EMPTY_BATCH_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a: $(ZLIB_DEP) $(LIBEND2END_TEST_EMPTY_BATCH_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBEND2END_TEST_EMPTY_BATCH_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_EMPTY_BATCH_OBJS:.o=.dep)
endif


LIBEND2END_TEST_GRACEFUL_SERVER_SHUTDOWN_SRC = \
    test/core/end2end/tests/graceful_server_shutdown.c \


LIBEND2END_TEST_GRACEFUL_SERVER_SHUTDOWN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_GRACEFUL_SERVER_SHUTDOWN_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a: $(ZLIB_DEP) $(LIBEND2END_TEST_GRACEFUL_SERVER_SHUTDOWN_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBEND2END_TEST_GRACEFUL_SERVER_SHUTDOWN_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_GRACEFUL_SERVER_SHUTDOWN_OBJS:.o=.dep)
endif


LIBEND2END_TEST_INVOKE_LARGE_REQUEST_SRC = \
    test/core/end2end/tests/invoke_large_request.c \


LIBEND2END_TEST_INVOKE_LARGE_REQUEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_INVOKE_LARGE_REQUEST_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a: $(ZLIB_DEP) $(LIBEND2END_TEST_INVOKE_LARGE_REQUEST_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBEND2END_TEST_INVOKE_LARGE_REQUEST_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_INVOKE_LARGE_REQUEST_OBJS:.o=.dep)
endif


LIBEND2END_TEST_MAX_CONCURRENT_STREAMS_SRC = \
    test/core/end2end/tests/max_concurrent_streams.c \


LIBEND2END_TEST_MAX_CONCURRENT_STREAMS_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_MAX_CONCURRENT_STREAMS_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a: $(ZLIB_DEP) $(LIBEND2END_TEST_MAX_CONCURRENT_STREAMS_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBEND2END_TEST_MAX_CONCURRENT_STREAMS_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_MAX_CONCURRENT_STREAMS_OBJS:.o=.dep)
endif


LIBEND2END_TEST_MAX_MESSAGE_LENGTH_SRC = \
    test/core/end2end/tests/max_message_length.c \


LIBEND2END_TEST_MAX_MESSAGE_LENGTH_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_MAX_MESSAGE_LENGTH_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a: $(ZLIB_DEP) $(LIBEND2END_TEST_MAX_MESSAGE_LENGTH_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBEND2END_TEST_MAX_MESSAGE_LENGTH_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_MAX_MESSAGE_LENGTH_OBJS:.o=.dep)
endif


LIBEND2END_TEST_NO_OP_SRC = \
    test/core/end2end/tests/no_op.c \


LIBEND2END_TEST_NO_OP_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_NO_OP_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a: $(ZLIB_DEP) $(LIBEND2END_TEST_NO_OP_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBEND2END_TEST_NO_OP_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_NO_OP_OBJS:.o=.dep)
endif


LIBEND2END_TEST_PING_PONG_STREAMING_SRC = \
    test/core/end2end/tests/ping_pong_streaming.c \


LIBEND2END_TEST_PING_PONG_STREAMING_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_PING_PONG_STREAMING_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a: $(ZLIB_DEP) $(LIBEND2END_TEST_PING_PONG_STREAMING_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBEND2END_TEST_PING_PONG_STREAMING_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_PING_PONG_STREAMING_OBJS:.o=.dep)
endif


LIBEND2END_TEST_REGISTERED_CALL_SRC = \
    test/core/end2end/tests/registered_call.c \


LIBEND2END_TEST_REGISTERED_CALL_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_REGISTERED_CALL_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a: $(ZLIB_DEP) $(LIBEND2END_TEST_REGISTERED_CALL_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBEND2END_TEST_REGISTERED_CALL_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_REGISTERED_CALL_OBJS:.o=.dep)
endif


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_BINARY_METADATA_AND_PAYLOAD_SRC = \
    test/core/end2end/tests/request_response_with_binary_metadata_and_payload.c \


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_BINARY_METADATA_AND_PAYLOAD_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_BINARY_METADATA_AND_PAYLOAD_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a: $(ZLIB_DEP) $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_BINARY_METADATA_AND_PAYLOAD_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_BINARY_METADATA_AND_PAYLOAD_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_BINARY_METADATA_AND_PAYLOAD_OBJS:.o=.dep)
endif


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_METADATA_AND_PAYLOAD_SRC = \
    test/core/end2end/tests/request_response_with_metadata_and_payload.c \


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_METADATA_AND_PAYLOAD_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_METADATA_AND_PAYLOAD_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a: $(ZLIB_DEP) $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_METADATA_AND_PAYLOAD_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_METADATA_AND_PAYLOAD_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_METADATA_AND_PAYLOAD_OBJS:.o=.dep)
endif


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_SRC = \
    test/core/end2end/tests/request_response_with_payload.c \


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a: $(ZLIB_DEP) $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_OBJS:.o=.dep)
endif


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_AND_CALL_CREDS_SRC = \
    test/core/end2end/tests/request_response_with_payload_and_call_creds.c \


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_AND_CALL_CREDS_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_AND_CALL_CREDS_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a: openssl_dep_error


else


$(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_AND_CALL_CREDS_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_AND_CALL_CREDS_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a
endif




endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_PAYLOAD_AND_CALL_CREDS_OBJS:.o=.dep)
endif
endif


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_TRAILING_METADATA_AND_PAYLOAD_SRC = \
    test/core/end2end/tests/request_response_with_trailing_metadata_and_payload.c \


LIBEND2END_TEST_REQUEST_RESPONSE_WITH_TRAILING_METADATA_AND_PAYLOAD_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_TRAILING_METADATA_AND_PAYLOAD_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a: $(ZLIB_DEP) $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_TRAILING_METADATA_AND_PAYLOAD_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_TRAILING_METADATA_AND_PAYLOAD_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_REQUEST_RESPONSE_WITH_TRAILING_METADATA_AND_PAYLOAD_OBJS:.o=.dep)
endif


LIBEND2END_TEST_REQUEST_WITH_LARGE_METADATA_SRC = \
    test/core/end2end/tests/request_with_large_metadata.c \


LIBEND2END_TEST_REQUEST_WITH_LARGE_METADATA_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_REQUEST_WITH_LARGE_METADATA_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a: $(ZLIB_DEP) $(LIBEND2END_TEST_REQUEST_WITH_LARGE_METADATA_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBEND2END_TEST_REQUEST_WITH_LARGE_METADATA_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_REQUEST_WITH_LARGE_METADATA_OBJS:.o=.dep)
endif


LIBEND2END_TEST_REQUEST_WITH_PAYLOAD_SRC = \
    test/core/end2end/tests/request_with_payload.c \


LIBEND2END_TEST_REQUEST_WITH_PAYLOAD_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_REQUEST_WITH_PAYLOAD_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a: $(ZLIB_DEP) $(LIBEND2END_TEST_REQUEST_WITH_PAYLOAD_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBEND2END_TEST_REQUEST_WITH_PAYLOAD_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_REQUEST_WITH_PAYLOAD_OBJS:.o=.dep)
endif


LIBEND2END_TEST_SERVER_FINISHES_REQUEST_SRC = \
    test/core/end2end/tests/server_finishes_request.c \


LIBEND2END_TEST_SERVER_FINISHES_REQUEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_SERVER_FINISHES_REQUEST_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a: $(ZLIB_DEP) $(LIBEND2END_TEST_SERVER_FINISHES_REQUEST_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBEND2END_TEST_SERVER_FINISHES_REQUEST_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_SERVER_FINISHES_REQUEST_OBJS:.o=.dep)
endif


LIBEND2END_TEST_SIMPLE_DELAYED_REQUEST_SRC = \
    test/core/end2end/tests/simple_delayed_request.c \


LIBEND2END_TEST_SIMPLE_DELAYED_REQUEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_SIMPLE_DELAYED_REQUEST_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a: $(ZLIB_DEP) $(LIBEND2END_TEST_SIMPLE_DELAYED_REQUEST_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBEND2END_TEST_SIMPLE_DELAYED_REQUEST_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_SIMPLE_DELAYED_REQUEST_OBJS:.o=.dep)
endif


LIBEND2END_TEST_SIMPLE_REQUEST_SRC = \
    test/core/end2end/tests/simple_request.c \


LIBEND2END_TEST_SIMPLE_REQUEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_SIMPLE_REQUEST_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a: $(ZLIB_DEP) $(LIBEND2END_TEST_SIMPLE_REQUEST_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBEND2END_TEST_SIMPLE_REQUEST_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_SIMPLE_REQUEST_OBJS:.o=.dep)
endif


LIBEND2END_TEST_SIMPLE_REQUEST_WITH_HIGH_INITIAL_SEQUENCE_NUMBER_SRC = \
    test/core/end2end/tests/simple_request_with_high_initial_sequence_number.c \


LIBEND2END_TEST_SIMPLE_REQUEST_WITH_HIGH_INITIAL_SEQUENCE_NUMBER_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_TEST_SIMPLE_REQUEST_WITH_HIGH_INITIAL_SEQUENCE_NUMBER_SRC))))

$(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a: $(ZLIB_DEP) $(LIBEND2END_TEST_SIMPLE_REQUEST_WITH_HIGH_INITIAL_SEQUENCE_NUMBER_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBEND2END_TEST_SIMPLE_REQUEST_WITH_HIGH_INITIAL_SEQUENCE_NUMBER_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_TEST_SIMPLE_REQUEST_WITH_HIGH_INITIAL_SEQUENCE_NUMBER_OBJS:.o=.dep)
endif


LIBEND2END_CERTS_SRC = \
    test/core/end2end/data/test_root_cert.c \
    test/core/end2end/data/server1_cert.c \
    test/core/end2end/data/server1_key.c \


LIBEND2END_CERTS_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBEND2END_CERTS_SRC))))

ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL with ALPN.

$(LIBDIR)/$(CONFIG)/libend2end_certs.a: openssl_dep_error


else


$(LIBDIR)/$(CONFIG)/libend2end_certs.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(LIBEND2END_CERTS_OBJS)
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libend2end_certs.a
	$(Q) $(AR) rcs $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBEND2END_CERTS_OBJS)
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib $(LIBDIR)/$(CONFIG)/libend2end_certs.a
endif




endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBEND2END_CERTS_OBJS:.o=.dep)
endif
endif



# All of the test targets, and protoc plugins


ALARM_HEAP_TEST_SRC = \
    test/core/iomgr/alarm_heap_test.c \

ALARM_HEAP_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(ALARM_HEAP_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/alarm_heap_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/alarm_heap_test: $(ALARM_HEAP_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(ALARM_HEAP_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/alarm_heap_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/alarm_heap_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_alarm_heap_test: $(ALARM_HEAP_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(ALARM_HEAP_TEST_OBJS:.o=.dep)
endif
endif


ALARM_LIST_TEST_SRC = \
    test/core/iomgr/alarm_list_test.c \

ALARM_LIST_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(ALARM_LIST_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/alarm_list_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/alarm_list_test: $(ALARM_LIST_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(ALARM_LIST_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/alarm_list_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/alarm_list_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_alarm_list_test: $(ALARM_LIST_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(ALARM_LIST_TEST_OBJS:.o=.dep)
endif
endif


ALARM_TEST_SRC = \
    test/core/iomgr/alarm_test.c \

ALARM_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(ALARM_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/alarm_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/alarm_test: $(ALARM_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(ALARM_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/alarm_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/alarm_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_alarm_test: $(ALARM_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(ALARM_TEST_OBJS:.o=.dep)
endif
endif


ALPN_TEST_SRC = \
    test/core/transport/chttp2/alpn_test.c \

ALPN_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(ALPN_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/alpn_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/alpn_test: $(ALPN_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(ALPN_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/alpn_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/chttp2/alpn_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_alpn_test: $(ALPN_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(ALPN_TEST_OBJS:.o=.dep)
endif
endif


BIN_ENCODER_TEST_SRC = \
    test/core/transport/chttp2/bin_encoder_test.c \

BIN_ENCODER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(BIN_ENCODER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/bin_encoder_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/bin_encoder_test: $(BIN_ENCODER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(BIN_ENCODER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/bin_encoder_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/chttp2/bin_encoder_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_bin_encoder_test: $(BIN_ENCODER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(BIN_ENCODER_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_HASH_TABLE_TEST_SRC = \
    test/core/statistics/hash_table_test.c \

CENSUS_HASH_TABLE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_HASH_TABLE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_hash_table_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_hash_table_test: $(CENSUS_HASH_TABLE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_HASH_TABLE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_hash_table_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/hash_table_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_hash_table_test: $(CENSUS_HASH_TABLE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_HASH_TABLE_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_STATISTICS_MULTIPLE_WRITERS_CIRCULAR_BUFFER_TEST_SRC = \
    test/core/statistics/multiple_writers_circular_buffer_test.c \

CENSUS_STATISTICS_MULTIPLE_WRITERS_CIRCULAR_BUFFER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_STATISTICS_MULTIPLE_WRITERS_CIRCULAR_BUFFER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_circular_buffer_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_circular_buffer_test: $(CENSUS_STATISTICS_MULTIPLE_WRITERS_CIRCULAR_BUFFER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_STATISTICS_MULTIPLE_WRITERS_CIRCULAR_BUFFER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_circular_buffer_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/multiple_writers_circular_buffer_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_statistics_multiple_writers_circular_buffer_test: $(CENSUS_STATISTICS_MULTIPLE_WRITERS_CIRCULAR_BUFFER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_STATISTICS_MULTIPLE_WRITERS_CIRCULAR_BUFFER_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_STATISTICS_MULTIPLE_WRITERS_TEST_SRC = \
    test/core/statistics/multiple_writers_test.c \

CENSUS_STATISTICS_MULTIPLE_WRITERS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_STATISTICS_MULTIPLE_WRITERS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_test: $(CENSUS_STATISTICS_MULTIPLE_WRITERS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_STATISTICS_MULTIPLE_WRITERS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_statistics_multiple_writers_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/multiple_writers_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_statistics_multiple_writers_test: $(CENSUS_STATISTICS_MULTIPLE_WRITERS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_STATISTICS_MULTIPLE_WRITERS_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_STATISTICS_PERFORMANCE_TEST_SRC = \
    test/core/statistics/performance_test.c \

CENSUS_STATISTICS_PERFORMANCE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_STATISTICS_PERFORMANCE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_statistics_performance_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_statistics_performance_test: $(CENSUS_STATISTICS_PERFORMANCE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_STATISTICS_PERFORMANCE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_statistics_performance_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/performance_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_statistics_performance_test: $(CENSUS_STATISTICS_PERFORMANCE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_STATISTICS_PERFORMANCE_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_STATISTICS_QUICK_TEST_SRC = \
    test/core/statistics/quick_test.c \

CENSUS_STATISTICS_QUICK_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_STATISTICS_QUICK_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_statistics_quick_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_statistics_quick_test: $(CENSUS_STATISTICS_QUICK_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_STATISTICS_QUICK_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_statistics_quick_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/quick_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_statistics_quick_test: $(CENSUS_STATISTICS_QUICK_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_STATISTICS_QUICK_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_STATISTICS_SMALL_LOG_TEST_SRC = \
    test/core/statistics/small_log_test.c \

CENSUS_STATISTICS_SMALL_LOG_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_STATISTICS_SMALL_LOG_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_statistics_small_log_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_statistics_small_log_test: $(CENSUS_STATISTICS_SMALL_LOG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_STATISTICS_SMALL_LOG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_statistics_small_log_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/small_log_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_statistics_small_log_test: $(CENSUS_STATISTICS_SMALL_LOG_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_STATISTICS_SMALL_LOG_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_STATS_STORE_TEST_SRC = \
    test/core/statistics/rpc_stats_test.c \

CENSUS_STATS_STORE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_STATS_STORE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_stats_store_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_stats_store_test: $(CENSUS_STATS_STORE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_STATS_STORE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_stats_store_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/rpc_stats_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_stats_store_test: $(CENSUS_STATS_STORE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_STATS_STORE_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_STUB_TEST_SRC = \
    test/core/statistics/census_stub_test.c \

CENSUS_STUB_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_STUB_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_stub_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_stub_test: $(CENSUS_STUB_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_STUB_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_stub_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/census_stub_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_stub_test: $(CENSUS_STUB_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_STUB_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_TRACE_STORE_TEST_SRC = \
    test/core/statistics/trace_test.c \

CENSUS_TRACE_STORE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_TRACE_STORE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_trace_store_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_trace_store_test: $(CENSUS_TRACE_STORE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_TRACE_STORE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_trace_store_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/trace_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_trace_store_test: $(CENSUS_TRACE_STORE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_TRACE_STORE_TEST_OBJS:.o=.dep)
endif
endif


CENSUS_WINDOW_STATS_TEST_SRC = \
    test/core/statistics/window_stats_test.c \

CENSUS_WINDOW_STATS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CENSUS_WINDOW_STATS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/census_window_stats_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/census_window_stats_test: $(CENSUS_WINDOW_STATS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CENSUS_WINDOW_STATS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/census_window_stats_test

endif

$(OBJDIR)/$(CONFIG)/test/core/statistics/window_stats_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_census_window_stats_test: $(CENSUS_WINDOW_STATS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CENSUS_WINDOW_STATS_TEST_OBJS:.o=.dep)
endif
endif


CHTTP2_STATUS_CONVERSION_TEST_SRC = \
    test/core/transport/chttp2/status_conversion_test.c \

CHTTP2_STATUS_CONVERSION_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CHTTP2_STATUS_CONVERSION_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_status_conversion_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_status_conversion_test: $(CHTTP2_STATUS_CONVERSION_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CHTTP2_STATUS_CONVERSION_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_status_conversion_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/chttp2/status_conversion_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_chttp2_status_conversion_test: $(CHTTP2_STATUS_CONVERSION_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CHTTP2_STATUS_CONVERSION_TEST_OBJS:.o=.dep)
endif
endif


CHTTP2_STREAM_ENCODER_TEST_SRC = \
    test/core/transport/chttp2/stream_encoder_test.c \

CHTTP2_STREAM_ENCODER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CHTTP2_STREAM_ENCODER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_stream_encoder_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_stream_encoder_test: $(CHTTP2_STREAM_ENCODER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CHTTP2_STREAM_ENCODER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_stream_encoder_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/chttp2/stream_encoder_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_chttp2_stream_encoder_test: $(CHTTP2_STREAM_ENCODER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CHTTP2_STREAM_ENCODER_TEST_OBJS:.o=.dep)
endif
endif


CHTTP2_STREAM_MAP_TEST_SRC = \
    test/core/transport/chttp2/stream_map_test.c \

CHTTP2_STREAM_MAP_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CHTTP2_STREAM_MAP_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_stream_map_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_stream_map_test: $(CHTTP2_STREAM_MAP_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(CHTTP2_STREAM_MAP_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_stream_map_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/chttp2/stream_map_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_chttp2_stream_map_test: $(CHTTP2_STREAM_MAP_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CHTTP2_STREAM_MAP_TEST_OBJS:.o=.dep)
endif
endif


DUALSTACK_SOCKET_TEST_SRC = \
    test/core/end2end/dualstack_socket_test.c \

DUALSTACK_SOCKET_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(DUALSTACK_SOCKET_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/dualstack_socket_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/dualstack_socket_test: $(DUALSTACK_SOCKET_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(DUALSTACK_SOCKET_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/dualstack_socket_test

endif

$(OBJDIR)/$(CONFIG)/test/core/end2end/dualstack_socket_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_dualstack_socket_test: $(DUALSTACK_SOCKET_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(DUALSTACK_SOCKET_TEST_OBJS:.o=.dep)
endif
endif


FD_POSIX_TEST_SRC = \
    test/core/iomgr/fd_posix_test.c \

FD_POSIX_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(FD_POSIX_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/fd_posix_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/fd_posix_test: $(FD_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(FD_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/fd_posix_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/fd_posix_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_fd_posix_test: $(FD_POSIX_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(FD_POSIX_TEST_OBJS:.o=.dep)
endif
endif


FLING_CLIENT_SRC = \
    test/core/fling/client.c \

FLING_CLIENT_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(FLING_CLIENT_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/fling_client: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/fling_client: $(FLING_CLIENT_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(FLING_CLIENT_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/fling_client

endif

$(OBJDIR)/$(CONFIG)/test/core/fling/client.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_fling_client: $(FLING_CLIENT_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(FLING_CLIENT_OBJS:.o=.dep)
endif
endif


FLING_SERVER_SRC = \
    test/core/fling/server.c \

FLING_SERVER_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(FLING_SERVER_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/fling_server: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/fling_server: $(FLING_SERVER_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(FLING_SERVER_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/fling_server

endif

$(OBJDIR)/$(CONFIG)/test/core/fling/server.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_fling_server: $(FLING_SERVER_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(FLING_SERVER_OBJS:.o=.dep)
endif
endif


FLING_STREAM_TEST_SRC = \
    test/core/fling/fling_stream_test.c \

FLING_STREAM_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(FLING_STREAM_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/fling_stream_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/fling_stream_test: $(FLING_STREAM_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(FLING_STREAM_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/fling_stream_test

endif

$(OBJDIR)/$(CONFIG)/test/core/fling/fling_stream_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_fling_stream_test: $(FLING_STREAM_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(FLING_STREAM_TEST_OBJS:.o=.dep)
endif
endif


FLING_TEST_SRC = \
    test/core/fling/fling_test.c \

FLING_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(FLING_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/fling_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/fling_test: $(FLING_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(FLING_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/fling_test

endif

$(OBJDIR)/$(CONFIG)/test/core/fling/fling_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_fling_test: $(FLING_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(FLING_TEST_OBJS:.o=.dep)
endif
endif


GEN_HPACK_TABLES_SRC = \
    src/core/transport/chttp2/gen_hpack_tables.c \

GEN_HPACK_TABLES_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GEN_HPACK_TABLES_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gen_hpack_tables: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gen_hpack_tables: $(GEN_HPACK_TABLES_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GEN_HPACK_TABLES_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gen_hpack_tables

endif

$(OBJDIR)/$(CONFIG)/src/core/transport/chttp2/gen_hpack_tables.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc.a
deps_gen_hpack_tables: $(GEN_HPACK_TABLES_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GEN_HPACK_TABLES_OBJS:.o=.dep)
endif
endif


GPR_CANCELLABLE_TEST_SRC = \
    test/core/support/cancellable_test.c \

GPR_CANCELLABLE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_CANCELLABLE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_cancellable_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_cancellable_test: $(GPR_CANCELLABLE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_CANCELLABLE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_cancellable_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/cancellable_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_cancellable_test: $(GPR_CANCELLABLE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_CANCELLABLE_TEST_OBJS:.o=.dep)
endif
endif


GPR_CMDLINE_TEST_SRC = \
    test/core/support/cmdline_test.c \

GPR_CMDLINE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_CMDLINE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_cmdline_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_cmdline_test: $(GPR_CMDLINE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_CMDLINE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_cmdline_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/cmdline_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_cmdline_test: $(GPR_CMDLINE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_CMDLINE_TEST_OBJS:.o=.dep)
endif
endif


GPR_ENV_TEST_SRC = \
    test/core/support/env_test.c \

GPR_ENV_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_ENV_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_env_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_env_test: $(GPR_ENV_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_ENV_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_env_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/env_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_env_test: $(GPR_ENV_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_ENV_TEST_OBJS:.o=.dep)
endif
endif


GPR_FILE_TEST_SRC = \
    test/core/support/file_test.c \

GPR_FILE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_FILE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_file_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_file_test: $(GPR_FILE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_FILE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_file_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/file_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_file_test: $(GPR_FILE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_FILE_TEST_OBJS:.o=.dep)
endif
endif


GPR_HISTOGRAM_TEST_SRC = \
    test/core/support/histogram_test.c \

GPR_HISTOGRAM_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_HISTOGRAM_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_histogram_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_histogram_test: $(GPR_HISTOGRAM_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_HISTOGRAM_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_histogram_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/histogram_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_histogram_test: $(GPR_HISTOGRAM_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_HISTOGRAM_TEST_OBJS:.o=.dep)
endif
endif


GPR_HOST_PORT_TEST_SRC = \
    test/core/support/host_port_test.c \

GPR_HOST_PORT_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_HOST_PORT_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_host_port_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_host_port_test: $(GPR_HOST_PORT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_HOST_PORT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_host_port_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/host_port_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_host_port_test: $(GPR_HOST_PORT_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_HOST_PORT_TEST_OBJS:.o=.dep)
endif
endif


GPR_LOG_TEST_SRC = \
    test/core/support/log_test.c \

GPR_LOG_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_LOG_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_log_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_log_test: $(GPR_LOG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_LOG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_log_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/log_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_log_test: $(GPR_LOG_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_LOG_TEST_OBJS:.o=.dep)
endif
endif


GPR_SLICE_BUFFER_TEST_SRC = \
    test/core/support/slice_buffer_test.c \

GPR_SLICE_BUFFER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_SLICE_BUFFER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_slice_buffer_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_slice_buffer_test: $(GPR_SLICE_BUFFER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_SLICE_BUFFER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_slice_buffer_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/slice_buffer_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_slice_buffer_test: $(GPR_SLICE_BUFFER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_SLICE_BUFFER_TEST_OBJS:.o=.dep)
endif
endif


GPR_SLICE_TEST_SRC = \
    test/core/support/slice_test.c \

GPR_SLICE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_SLICE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_slice_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_slice_test: $(GPR_SLICE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_SLICE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_slice_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/slice_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_slice_test: $(GPR_SLICE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_SLICE_TEST_OBJS:.o=.dep)
endif
endif


GPR_STRING_TEST_SRC = \
    test/core/support/string_test.c \

GPR_STRING_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_STRING_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_string_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_string_test: $(GPR_STRING_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_STRING_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_string_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/string_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_string_test: $(GPR_STRING_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_STRING_TEST_OBJS:.o=.dep)
endif
endif


GPR_SYNC_TEST_SRC = \
    test/core/support/sync_test.c \

GPR_SYNC_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_SYNC_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_sync_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_sync_test: $(GPR_SYNC_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_SYNC_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_sync_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/sync_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_sync_test: $(GPR_SYNC_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_SYNC_TEST_OBJS:.o=.dep)
endif
endif


GPR_THD_TEST_SRC = \
    test/core/support/thd_test.c \

GPR_THD_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_THD_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_thd_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_thd_test: $(GPR_THD_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_THD_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_thd_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/thd_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_thd_test: $(GPR_THD_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_THD_TEST_OBJS:.o=.dep)
endif
endif


GPR_TIME_TEST_SRC = \
    test/core/support/time_test.c \

GPR_TIME_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_TIME_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_time_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_time_test: $(GPR_TIME_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_TIME_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_time_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/time_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_time_test: $(GPR_TIME_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_TIME_TEST_OBJS:.o=.dep)
endif
endif


GPR_TLS_TEST_SRC = \
    test/core/support/tls_test.c \

GPR_TLS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_TLS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_tls_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_tls_test: $(GPR_TLS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_TLS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_tls_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/tls_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_tls_test: $(GPR_TLS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_TLS_TEST_OBJS:.o=.dep)
endif
endif


GPR_USEFUL_TEST_SRC = \
    test/core/support/useful_test.c \

GPR_USEFUL_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GPR_USEFUL_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/gpr_useful_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/gpr_useful_test: $(GPR_USEFUL_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GPR_USEFUL_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/gpr_useful_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/useful_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_gpr_useful_test: $(GPR_USEFUL_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GPR_USEFUL_TEST_OBJS:.o=.dep)
endif
endif


GRPC_AUTH_CONTEXT_TEST_SRC = \
    test/core/security/auth_context_test.c \

GRPC_AUTH_CONTEXT_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_AUTH_CONTEXT_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_auth_context_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_auth_context_test: $(GRPC_AUTH_CONTEXT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_AUTH_CONTEXT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_auth_context_test

endif

$(OBJDIR)/$(CONFIG)/test/core/security/auth_context_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_auth_context_test: $(GRPC_AUTH_CONTEXT_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_AUTH_CONTEXT_TEST_OBJS:.o=.dep)
endif
endif


GRPC_BASE64_TEST_SRC = \
    test/core/security/base64_test.c \

GRPC_BASE64_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_BASE64_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_base64_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_base64_test: $(GRPC_BASE64_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_BASE64_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_base64_test

endif

$(OBJDIR)/$(CONFIG)/test/core/security/base64_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_base64_test: $(GRPC_BASE64_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_BASE64_TEST_OBJS:.o=.dep)
endif
endif


GRPC_BYTE_BUFFER_READER_TEST_SRC = \
    test/core/surface/byte_buffer_reader_test.c \

GRPC_BYTE_BUFFER_READER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_BYTE_BUFFER_READER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_byte_buffer_reader_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_byte_buffer_reader_test: $(GRPC_BYTE_BUFFER_READER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_BYTE_BUFFER_READER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_byte_buffer_reader_test

endif

$(OBJDIR)/$(CONFIG)/test/core/surface/byte_buffer_reader_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_byte_buffer_reader_test: $(GRPC_BYTE_BUFFER_READER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_BYTE_BUFFER_READER_TEST_OBJS:.o=.dep)
endif
endif


GRPC_CHANNEL_STACK_TEST_SRC = \
    test/core/channel/channel_stack_test.c \

GRPC_CHANNEL_STACK_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_CHANNEL_STACK_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_channel_stack_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_channel_stack_test: $(GRPC_CHANNEL_STACK_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_CHANNEL_STACK_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_channel_stack_test

endif

$(OBJDIR)/$(CONFIG)/test/core/channel/channel_stack_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_channel_stack_test: $(GRPC_CHANNEL_STACK_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_CHANNEL_STACK_TEST_OBJS:.o=.dep)
endif
endif


GRPC_COMPLETION_QUEUE_TEST_SRC = \
    test/core/surface/completion_queue_test.c \

GRPC_COMPLETION_QUEUE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_COMPLETION_QUEUE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_completion_queue_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_completion_queue_test: $(GRPC_COMPLETION_QUEUE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_COMPLETION_QUEUE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_completion_queue_test

endif

$(OBJDIR)/$(CONFIG)/test/core/surface/completion_queue_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_completion_queue_test: $(GRPC_COMPLETION_QUEUE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_COMPLETION_QUEUE_TEST_OBJS:.o=.dep)
endif
endif


GRPC_CREATE_JWT_SRC = \
    test/core/security/create_jwt.c \

GRPC_CREATE_JWT_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_CREATE_JWT_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_create_jwt: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_create_jwt: $(GRPC_CREATE_JWT_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_CREATE_JWT_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_create_jwt

endif

$(OBJDIR)/$(CONFIG)/test/core/security/create_jwt.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_create_jwt: $(GRPC_CREATE_JWT_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_CREATE_JWT_OBJS:.o=.dep)
endif
endif


GRPC_CREDENTIALS_TEST_SRC = \
    test/core/security/credentials_test.c \

GRPC_CREDENTIALS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_CREDENTIALS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_credentials_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_credentials_test: $(GRPC_CREDENTIALS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_CREDENTIALS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_credentials_test

endif

$(OBJDIR)/$(CONFIG)/test/core/security/credentials_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_credentials_test: $(GRPC_CREDENTIALS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_CREDENTIALS_TEST_OBJS:.o=.dep)
endif
endif


GRPC_FETCH_OAUTH2_SRC = \
    test/core/security/fetch_oauth2.c \

GRPC_FETCH_OAUTH2_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_FETCH_OAUTH2_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_fetch_oauth2: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_fetch_oauth2: $(GRPC_FETCH_OAUTH2_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_FETCH_OAUTH2_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_fetch_oauth2

endif

$(OBJDIR)/$(CONFIG)/test/core/security/fetch_oauth2.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_fetch_oauth2: $(GRPC_FETCH_OAUTH2_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_FETCH_OAUTH2_OBJS:.o=.dep)
endif
endif


GRPC_JSON_TOKEN_TEST_SRC = \
    test/core/security/json_token_test.c \

GRPC_JSON_TOKEN_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_JSON_TOKEN_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_json_token_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_json_token_test: $(GRPC_JSON_TOKEN_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_JSON_TOKEN_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_json_token_test

endif

$(OBJDIR)/$(CONFIG)/test/core/security/json_token_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_json_token_test: $(GRPC_JSON_TOKEN_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_JSON_TOKEN_TEST_OBJS:.o=.dep)
endif
endif


GRPC_PRINT_GOOGLE_DEFAULT_CREDS_TOKEN_SRC = \
    test/core/security/print_google_default_creds_token.c \

GRPC_PRINT_GOOGLE_DEFAULT_CREDS_TOKEN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_PRINT_GOOGLE_DEFAULT_CREDS_TOKEN_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_print_google_default_creds_token: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_print_google_default_creds_token: $(GRPC_PRINT_GOOGLE_DEFAULT_CREDS_TOKEN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_PRINT_GOOGLE_DEFAULT_CREDS_TOKEN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_print_google_default_creds_token

endif

$(OBJDIR)/$(CONFIG)/test/core/security/print_google_default_creds_token.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_print_google_default_creds_token: $(GRPC_PRINT_GOOGLE_DEFAULT_CREDS_TOKEN_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_PRINT_GOOGLE_DEFAULT_CREDS_TOKEN_OBJS:.o=.dep)
endif
endif


GRPC_STREAM_OP_TEST_SRC = \
    test/core/transport/stream_op_test.c \

GRPC_STREAM_OP_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_STREAM_OP_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_stream_op_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_stream_op_test: $(GRPC_STREAM_OP_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(GRPC_STREAM_OP_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/grpc_stream_op_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/stream_op_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_grpc_stream_op_test: $(GRPC_STREAM_OP_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_STREAM_OP_TEST_OBJS:.o=.dep)
endif
endif


HPACK_PARSER_TEST_SRC = \
    test/core/transport/chttp2/hpack_parser_test.c \

HPACK_PARSER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(HPACK_PARSER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/hpack_parser_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/hpack_parser_test: $(HPACK_PARSER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(HPACK_PARSER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/hpack_parser_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/chttp2/hpack_parser_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_hpack_parser_test: $(HPACK_PARSER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(HPACK_PARSER_TEST_OBJS:.o=.dep)
endif
endif


HPACK_TABLE_TEST_SRC = \
    test/core/transport/chttp2/hpack_table_test.c \

HPACK_TABLE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(HPACK_TABLE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/hpack_table_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/hpack_table_test: $(HPACK_TABLE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(HPACK_TABLE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/hpack_table_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/chttp2/hpack_table_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_hpack_table_test: $(HPACK_TABLE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(HPACK_TABLE_TEST_OBJS:.o=.dep)
endif
endif


HTTPCLI_FORMAT_REQUEST_TEST_SRC = \
    test/core/httpcli/format_request_test.c \

HTTPCLI_FORMAT_REQUEST_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(HTTPCLI_FORMAT_REQUEST_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/httpcli_format_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/httpcli_format_request_test: $(HTTPCLI_FORMAT_REQUEST_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(HTTPCLI_FORMAT_REQUEST_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/httpcli_format_request_test

endif

$(OBJDIR)/$(CONFIG)/test/core/httpcli/format_request_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_httpcli_format_request_test: $(HTTPCLI_FORMAT_REQUEST_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(HTTPCLI_FORMAT_REQUEST_TEST_OBJS:.o=.dep)
endif
endif


HTTPCLI_PARSER_TEST_SRC = \
    test/core/httpcli/parser_test.c \

HTTPCLI_PARSER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(HTTPCLI_PARSER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/httpcli_parser_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/httpcli_parser_test: $(HTTPCLI_PARSER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(HTTPCLI_PARSER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/httpcli_parser_test

endif

$(OBJDIR)/$(CONFIG)/test/core/httpcli/parser_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_httpcli_parser_test: $(HTTPCLI_PARSER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(HTTPCLI_PARSER_TEST_OBJS:.o=.dep)
endif
endif


HTTPCLI_TEST_SRC = \
    test/core/httpcli/httpcli_test.c \

HTTPCLI_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(HTTPCLI_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/httpcli_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/httpcli_test: $(HTTPCLI_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(HTTPCLI_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/httpcli_test

endif

$(OBJDIR)/$(CONFIG)/test/core/httpcli/httpcli_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_httpcli_test: $(HTTPCLI_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(HTTPCLI_TEST_OBJS:.o=.dep)
endif
endif


JSON_REWRITE_SRC = \
    test/core/json/json_rewrite.c \

JSON_REWRITE_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(JSON_REWRITE_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/json_rewrite: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/json_rewrite: $(JSON_REWRITE_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(JSON_REWRITE_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/json_rewrite

endif

$(OBJDIR)/$(CONFIG)/test/core/json/json_rewrite.o:  $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_json_rewrite: $(JSON_REWRITE_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(JSON_REWRITE_OBJS:.o=.dep)
endif
endif


JSON_REWRITE_TEST_SRC = \
    test/core/json/json_rewrite_test.c \

JSON_REWRITE_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(JSON_REWRITE_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/json_rewrite_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/json_rewrite_test: $(JSON_REWRITE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(JSON_REWRITE_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/json_rewrite_test

endif

$(OBJDIR)/$(CONFIG)/test/core/json/json_rewrite_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_json_rewrite_test: $(JSON_REWRITE_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(JSON_REWRITE_TEST_OBJS:.o=.dep)
endif
endif


JSON_TEST_SRC = \
    test/core/json/json_test.c \

JSON_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(JSON_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/json_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/json_test: $(JSON_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(JSON_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/json_test

endif

$(OBJDIR)/$(CONFIG)/test/core/json/json_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_json_test: $(JSON_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(JSON_TEST_OBJS:.o=.dep)
endif
endif


LAME_CLIENT_TEST_SRC = \
    test/core/surface/lame_client_test.c \

LAME_CLIENT_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LAME_CLIENT_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/lame_client_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/lame_client_test: $(LAME_CLIENT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(LAME_CLIENT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/lame_client_test

endif

$(OBJDIR)/$(CONFIG)/test/core/surface/lame_client_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_lame_client_test: $(LAME_CLIENT_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LAME_CLIENT_TEST_OBJS:.o=.dep)
endif
endif


LOW_LEVEL_PING_PONG_BENCHMARK_SRC = \
    test/core/network_benchmarks/low_level_ping_pong.c \

LOW_LEVEL_PING_PONG_BENCHMARK_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LOW_LEVEL_PING_PONG_BENCHMARK_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/low_level_ping_pong_benchmark: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/low_level_ping_pong_benchmark: $(LOW_LEVEL_PING_PONG_BENCHMARK_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(LOW_LEVEL_PING_PONG_BENCHMARK_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/low_level_ping_pong_benchmark

endif

$(OBJDIR)/$(CONFIG)/test/core/network_benchmarks/low_level_ping_pong.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_low_level_ping_pong_benchmark: $(LOW_LEVEL_PING_PONG_BENCHMARK_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LOW_LEVEL_PING_PONG_BENCHMARK_OBJS:.o=.dep)
endif
endif


MESSAGE_COMPRESS_TEST_SRC = \
    test/core/compression/message_compress_test.c \

MESSAGE_COMPRESS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(MESSAGE_COMPRESS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/message_compress_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/message_compress_test: $(MESSAGE_COMPRESS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(MESSAGE_COMPRESS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/message_compress_test

endif

$(OBJDIR)/$(CONFIG)/test/core/compression/message_compress_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_message_compress_test: $(MESSAGE_COMPRESS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(MESSAGE_COMPRESS_TEST_OBJS:.o=.dep)
endif
endif


MULTI_INIT_TEST_SRC = \
    test/core/surface/multi_init_test.c \

MULTI_INIT_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(MULTI_INIT_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/multi_init_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/multi_init_test: $(MULTI_INIT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(MULTI_INIT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/multi_init_test

endif

$(OBJDIR)/$(CONFIG)/test/core/surface/multi_init_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_multi_init_test: $(MULTI_INIT_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(MULTI_INIT_TEST_OBJS:.o=.dep)
endif
endif


MURMUR_HASH_TEST_SRC = \
    test/core/support/murmur_hash_test.c \

MURMUR_HASH_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(MURMUR_HASH_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/murmur_hash_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/murmur_hash_test: $(MURMUR_HASH_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(MURMUR_HASH_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/murmur_hash_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/murmur_hash_test.o:  $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_murmur_hash_test: $(MURMUR_HASH_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(MURMUR_HASH_TEST_OBJS:.o=.dep)
endif
endif


NO_SERVER_TEST_SRC = \
    test/core/end2end/no_server_test.c \

NO_SERVER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(NO_SERVER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/no_server_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/no_server_test: $(NO_SERVER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(NO_SERVER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/no_server_test

endif

$(OBJDIR)/$(CONFIG)/test/core/end2end/no_server_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_no_server_test: $(NO_SERVER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(NO_SERVER_TEST_OBJS:.o=.dep)
endif
endif


POLL_KICK_POSIX_TEST_SRC = \
    test/core/iomgr/poll_kick_posix_test.c \

POLL_KICK_POSIX_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(POLL_KICK_POSIX_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/poll_kick_posix_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/poll_kick_posix_test: $(POLL_KICK_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(POLL_KICK_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/poll_kick_posix_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/poll_kick_posix_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_poll_kick_posix_test: $(POLL_KICK_POSIX_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(POLL_KICK_POSIX_TEST_OBJS:.o=.dep)
endif
endif


RESOLVE_ADDRESS_TEST_SRC = \
    test/core/iomgr/resolve_address_test.c \

RESOLVE_ADDRESS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(RESOLVE_ADDRESS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/resolve_address_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/resolve_address_test: $(RESOLVE_ADDRESS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(RESOLVE_ADDRESS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/resolve_address_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/resolve_address_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_resolve_address_test: $(RESOLVE_ADDRESS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(RESOLVE_ADDRESS_TEST_OBJS:.o=.dep)
endif
endif


SECURE_ENDPOINT_TEST_SRC = \
    test/core/security/secure_endpoint_test.c \

SECURE_ENDPOINT_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(SECURE_ENDPOINT_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/secure_endpoint_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/secure_endpoint_test: $(SECURE_ENDPOINT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(SECURE_ENDPOINT_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/secure_endpoint_test

endif

$(OBJDIR)/$(CONFIG)/test/core/security/secure_endpoint_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_secure_endpoint_test: $(SECURE_ENDPOINT_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(SECURE_ENDPOINT_TEST_OBJS:.o=.dep)
endif
endif


SOCKADDR_UTILS_TEST_SRC = \
    test/core/iomgr/sockaddr_utils_test.c \

SOCKADDR_UTILS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(SOCKADDR_UTILS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/sockaddr_utils_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/sockaddr_utils_test: $(SOCKADDR_UTILS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(SOCKADDR_UTILS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/sockaddr_utils_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/sockaddr_utils_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_sockaddr_utils_test: $(SOCKADDR_UTILS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(SOCKADDR_UTILS_TEST_OBJS:.o=.dep)
endif
endif


TCP_CLIENT_POSIX_TEST_SRC = \
    test/core/iomgr/tcp_client_posix_test.c \

TCP_CLIENT_POSIX_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(TCP_CLIENT_POSIX_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/tcp_client_posix_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/tcp_client_posix_test: $(TCP_CLIENT_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(TCP_CLIENT_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/tcp_client_posix_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/tcp_client_posix_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_tcp_client_posix_test: $(TCP_CLIENT_POSIX_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(TCP_CLIENT_POSIX_TEST_OBJS:.o=.dep)
endif
endif


TCP_POSIX_TEST_SRC = \
    test/core/iomgr/tcp_posix_test.c \

TCP_POSIX_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(TCP_POSIX_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/tcp_posix_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/tcp_posix_test: $(TCP_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(TCP_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/tcp_posix_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/tcp_posix_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_tcp_posix_test: $(TCP_POSIX_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(TCP_POSIX_TEST_OBJS:.o=.dep)
endif
endif


TCP_SERVER_POSIX_TEST_SRC = \
    test/core/iomgr/tcp_server_posix_test.c \

TCP_SERVER_POSIX_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(TCP_SERVER_POSIX_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/tcp_server_posix_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/tcp_server_posix_test: $(TCP_SERVER_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(TCP_SERVER_POSIX_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/tcp_server_posix_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/tcp_server_posix_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_tcp_server_posix_test: $(TCP_SERVER_POSIX_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(TCP_SERVER_POSIX_TEST_OBJS:.o=.dep)
endif
endif


TIME_AVERAGED_STATS_TEST_SRC = \
    test/core/iomgr/time_averaged_stats_test.c \

TIME_AVERAGED_STATS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(TIME_AVERAGED_STATS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/time_averaged_stats_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/time_averaged_stats_test: $(TIME_AVERAGED_STATS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(TIME_AVERAGED_STATS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/time_averaged_stats_test

endif

$(OBJDIR)/$(CONFIG)/test/core/iomgr/time_averaged_stats_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_time_averaged_stats_test: $(TIME_AVERAGED_STATS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(TIME_AVERAGED_STATS_TEST_OBJS:.o=.dep)
endif
endif


TIME_TEST_SRC = \
    test/core/support/time_test.c \

TIME_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(TIME_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/time_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/time_test: $(TIME_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(TIME_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/time_test

endif

$(OBJDIR)/$(CONFIG)/test/core/support/time_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_time_test: $(TIME_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(TIME_TEST_OBJS:.o=.dep)
endif
endif


TIMEOUT_ENCODING_TEST_SRC = \
    test/core/transport/chttp2/timeout_encoding_test.c \

TIMEOUT_ENCODING_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(TIMEOUT_ENCODING_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/timeout_encoding_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/timeout_encoding_test: $(TIMEOUT_ENCODING_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(TIMEOUT_ENCODING_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/timeout_encoding_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/chttp2/timeout_encoding_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_timeout_encoding_test: $(TIMEOUT_ENCODING_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(TIMEOUT_ENCODING_TEST_OBJS:.o=.dep)
endif
endif


TIMERS_TEST_SRC = \
    test/core/profiling/timers_test.c \

TIMERS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(TIMERS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/timers_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/timers_test: $(TIMERS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(TIMERS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/timers_test

endif

$(OBJDIR)/$(CONFIG)/test/core/profiling/timers_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_timers_test: $(TIMERS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(TIMERS_TEST_OBJS:.o=.dep)
endif
endif


TRANSPORT_METADATA_TEST_SRC = \
    test/core/transport/metadata_test.c \

TRANSPORT_METADATA_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(TRANSPORT_METADATA_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/transport_metadata_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/transport_metadata_test: $(TRANSPORT_METADATA_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(TRANSPORT_METADATA_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/transport_metadata_test

endif

$(OBJDIR)/$(CONFIG)/test/core/transport/metadata_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_transport_metadata_test: $(TRANSPORT_METADATA_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(TRANSPORT_METADATA_TEST_OBJS:.o=.dep)
endif
endif


TRANSPORT_SECURITY_TEST_SRC = \
    test/core/tsi/transport_security_test.c \

TRANSPORT_SECURITY_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(TRANSPORT_SECURITY_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/transport_security_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/transport_security_test: $(TRANSPORT_SECURITY_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS) $(TRANSPORT_SECURITY_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/transport_security_test

endif

$(OBJDIR)/$(CONFIG)/test/core/tsi/transport_security_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_transport_security_test: $(TRANSPORT_SECURITY_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(TRANSPORT_SECURITY_TEST_OBJS:.o=.dep)
endif
endif


ASYNC_END2END_TEST_SRC = \
    test/cpp/end2end/async_end2end_test.cc \

ASYNC_END2END_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(ASYNC_END2END_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/async_end2end_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/async_end2end_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/async_end2end_test: $(PROTOBUF_DEP) $(ASYNC_END2END_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(ASYNC_END2END_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/async_end2end_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/end2end/async_end2end_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_async_end2end_test: $(ASYNC_END2END_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(ASYNC_END2END_TEST_OBJS:.o=.dep)
endif
endif


ASYNC_STREAMING_PING_PONG_TEST_SRC = \
    test/cpp/qps/async_streaming_ping_pong_test.cc \

ASYNC_STREAMING_PING_PONG_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(ASYNC_STREAMING_PING_PONG_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/async_streaming_ping_pong_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/async_streaming_ping_pong_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/async_streaming_ping_pong_test: $(PROTOBUF_DEP) $(ASYNC_STREAMING_PING_PONG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(ASYNC_STREAMING_PING_PONG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/async_streaming_ping_pong_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/qps/async_streaming_ping_pong_test.o:  $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_async_streaming_ping_pong_test: $(ASYNC_STREAMING_PING_PONG_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(ASYNC_STREAMING_PING_PONG_TEST_OBJS:.o=.dep)
endif
endif


ASYNC_UNARY_PING_PONG_TEST_SRC = \
    test/cpp/qps/async_unary_ping_pong_test.cc \

ASYNC_UNARY_PING_PONG_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(ASYNC_UNARY_PING_PONG_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/async_unary_ping_pong_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/async_unary_ping_pong_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/async_unary_ping_pong_test: $(PROTOBUF_DEP) $(ASYNC_UNARY_PING_PONG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(ASYNC_UNARY_PING_PONG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/async_unary_ping_pong_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/qps/async_unary_ping_pong_test.o:  $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_async_unary_ping_pong_test: $(ASYNC_UNARY_PING_PONG_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(ASYNC_UNARY_PING_PONG_TEST_OBJS:.o=.dep)
endif
endif


CHANNEL_ARGUMENTS_TEST_SRC = \
    test/cpp/client/channel_arguments_test.cc \

CHANNEL_ARGUMENTS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CHANNEL_ARGUMENTS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/channel_arguments_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/channel_arguments_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/channel_arguments_test: $(PROTOBUF_DEP) $(CHANNEL_ARGUMENTS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(CHANNEL_ARGUMENTS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/channel_arguments_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/client/channel_arguments_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_channel_arguments_test: $(CHANNEL_ARGUMENTS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CHANNEL_ARGUMENTS_TEST_OBJS:.o=.dep)
endif
endif


CLI_CALL_TEST_SRC = \
    test/cpp/util/cli_call_test.cc \

CLI_CALL_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CLI_CALL_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/cli_call_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/cli_call_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/cli_call_test: $(PROTOBUF_DEP) $(CLI_CALL_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(CLI_CALL_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/cli_call_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/util/cli_call_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_cli_call_test: $(CLI_CALL_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CLI_CALL_TEST_OBJS:.o=.dep)
endif
endif


CREDENTIALS_TEST_SRC = \
    test/cpp/client/credentials_test.cc \

CREDENTIALS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CREDENTIALS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/credentials_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/credentials_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/credentials_test: $(PROTOBUF_DEP) $(CREDENTIALS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(CREDENTIALS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/credentials_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/client/credentials_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_credentials_test: $(CREDENTIALS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CREDENTIALS_TEST_OBJS:.o=.dep)
endif
endif


CXX_TIME_TEST_SRC = \
    test/cpp/util/time_test.cc \

CXX_TIME_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(CXX_TIME_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/cxx_time_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/cxx_time_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/cxx_time_test: $(PROTOBUF_DEP) $(CXX_TIME_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(CXX_TIME_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/cxx_time_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/util/time_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_cxx_time_test: $(CXX_TIME_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(CXX_TIME_TEST_OBJS:.o=.dep)
endif
endif


END2END_TEST_SRC = \
    test/cpp/end2end/end2end_test.cc \

END2END_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(END2END_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/end2end_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/end2end_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/end2end_test: $(PROTOBUF_DEP) $(END2END_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(END2END_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/end2end_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/end2end/end2end_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_end2end_test: $(END2END_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(END2END_TEST_OBJS:.o=.dep)
endif
endif


GENERIC_END2END_TEST_SRC = \
    test/cpp/end2end/generic_end2end_test.cc \

GENERIC_END2END_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GENERIC_END2END_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/generic_end2end_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/generic_end2end_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/generic_end2end_test: $(PROTOBUF_DEP) $(GENERIC_END2END_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(GENERIC_END2END_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/generic_end2end_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/end2end/generic_end2end_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_generic_end2end_test: $(GENERIC_END2END_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GENERIC_END2END_TEST_OBJS:.o=.dep)
endif
endif


GRPC_CLI_SRC = \
    test/cpp/util/grpc_cli.cc \

GRPC_CLI_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_CLI_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/grpc_cli: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/grpc_cli: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_cli: $(PROTOBUF_DEP) $(GRPC_CLI_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(GRPC_CLI_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/grpc_cli

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/util/grpc_cli.o:  $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
deps_grpc_cli: $(GRPC_CLI_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(GRPC_CLI_OBJS:.o=.dep)
endif
endif


GRPC_CPP_PLUGIN_SRC = \
    src/compiler/cpp_plugin.cc \

GRPC_CPP_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_CPP_PLUGIN_SRC))))

ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/grpc_cpp_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_cpp_plugin: $(PROTOBUF_DEP) $(GRPC_CPP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_CPP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_cpp_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/cpp_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
deps_grpc_cpp_plugin: $(GRPC_CPP_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_CPP_PLUGIN_OBJS:.o=.dep)
endif


GRPC_CSHARP_PLUGIN_SRC = \
    src/compiler/csharp_plugin.cc \

GRPC_CSHARP_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_CSHARP_PLUGIN_SRC))))

ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/grpc_csharp_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_csharp_plugin: $(PROTOBUF_DEP) $(GRPC_CSHARP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_CSHARP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_csharp_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/csharp_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
deps_grpc_csharp_plugin: $(GRPC_CSHARP_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_CSHARP_PLUGIN_OBJS:.o=.dep)
endif


GRPC_OBJECTIVE_C_PLUGIN_SRC = \
    src/compiler/objective_c_plugin.cc \

GRPC_OBJECTIVE_C_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_OBJECTIVE_C_PLUGIN_SRC))))

ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/grpc_objective_c_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_objective_c_plugin: $(PROTOBUF_DEP) $(GRPC_OBJECTIVE_C_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_OBJECTIVE_C_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_objective_c_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/objective_c_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
deps_grpc_objective_c_plugin: $(GRPC_OBJECTIVE_C_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_OBJECTIVE_C_PLUGIN_OBJS:.o=.dep)
endif


GRPC_PYTHON_PLUGIN_SRC = \
    src/compiler/python_plugin.cc \

GRPC_PYTHON_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_PYTHON_PLUGIN_SRC))))

ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/grpc_python_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_python_plugin: $(PROTOBUF_DEP) $(GRPC_PYTHON_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_PYTHON_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_python_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/python_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
deps_grpc_python_plugin: $(GRPC_PYTHON_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_PYTHON_PLUGIN_OBJS:.o=.dep)
endif


GRPC_RUBY_PLUGIN_SRC = \
    src/compiler/ruby_plugin.cc \

GRPC_RUBY_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_RUBY_PLUGIN_SRC))))

ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/grpc_ruby_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_ruby_plugin: $(PROTOBUF_DEP) $(GRPC_RUBY_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_RUBY_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_ruby_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/ruby_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
deps_grpc_ruby_plugin: $(GRPC_RUBY_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_RUBY_PLUGIN_OBJS:.o=.dep)
endif


ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/interop_client: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/interop_client: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/interop_client:  $(LIBDIR)/$(CONFIG)/libinterop_client_main.a $(LIBDIR)/$(CONFIG)/libinterop_client_helper.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libinterop_client_main.a $(LIBDIR)/$(CONFIG)/libinterop_client_helper.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/interop_client

endif

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/interop_server: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/interop_server: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/interop_server:  $(LIBDIR)/$(CONFIG)/libinterop_server_main.a $(LIBDIR)/$(CONFIG)/libinterop_server_helper.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libinterop_server_main.a $(LIBDIR)/$(CONFIG)/libinterop_server_helper.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/interop_server

endif

endif




INTEROP_TEST_SRC = \
    test/cpp/interop/interop_test.cc \

INTEROP_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(INTEROP_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/interop_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/interop_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/interop_test: $(PROTOBUF_DEP) $(INTEROP_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(INTEROP_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/interop_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/interop/interop_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_interop_test: $(INTEROP_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(INTEROP_TEST_OBJS:.o=.dep)
endif
endif


MOCK_TEST_SRC = \
    test/cpp/end2end/mock_test.cc \

MOCK_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(MOCK_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/mock_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/mock_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/mock_test: $(PROTOBUF_DEP) $(MOCK_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(MOCK_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/mock_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/end2end/mock_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_mock_test: $(MOCK_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(MOCK_TEST_OBJS:.o=.dep)
endif
endif


PUBSUB_CLIENT_SRC = \
    examples/pubsub/main.cc \

PUBSUB_CLIENT_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(PUBSUB_CLIENT_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/pubsub_client: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/pubsub_client: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/pubsub_client: $(PROTOBUF_DEP) $(PUBSUB_CLIENT_OBJS) $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(PUBSUB_CLIENT_OBJS) $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/pubsub_client

endif

endif

$(OBJDIR)/$(CONFIG)/examples/pubsub/main.o:  $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
deps_pubsub_client: $(PUBSUB_CLIENT_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(PUBSUB_CLIENT_OBJS:.o=.dep)
endif
endif


PUBSUB_PUBLISHER_TEST_SRC = \
    examples/pubsub/publisher_test.cc \

PUBSUB_PUBLISHER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(PUBSUB_PUBLISHER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/pubsub_publisher_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/pubsub_publisher_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/pubsub_publisher_test: $(PROTOBUF_DEP) $(PUBSUB_PUBLISHER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(PUBSUB_PUBLISHER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/pubsub_publisher_test

endif

endif

$(OBJDIR)/$(CONFIG)/examples/pubsub/publisher_test.o:  $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_pubsub_publisher_test: $(PUBSUB_PUBLISHER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(PUBSUB_PUBLISHER_TEST_OBJS:.o=.dep)
endif
endif


PUBSUB_SUBSCRIBER_TEST_SRC = \
    examples/pubsub/subscriber_test.cc \

PUBSUB_SUBSCRIBER_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(PUBSUB_SUBSCRIBER_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/pubsub_subscriber_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/pubsub_subscriber_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/pubsub_subscriber_test: $(PROTOBUF_DEP) $(PUBSUB_SUBSCRIBER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(PUBSUB_SUBSCRIBER_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/pubsub_subscriber_test

endif

endif

$(OBJDIR)/$(CONFIG)/examples/pubsub/subscriber_test.o:  $(LIBDIR)/$(CONFIG)/libpubsub_client_lib.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_pubsub_subscriber_test: $(PUBSUB_SUBSCRIBER_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(PUBSUB_SUBSCRIBER_TEST_OBJS:.o=.dep)
endif
endif


QPS_DRIVER_SRC = \
    test/cpp/qps/qps_driver.cc \

QPS_DRIVER_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(QPS_DRIVER_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/qps_driver: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/qps_driver: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/qps_driver: $(PROTOBUF_DEP) $(QPS_DRIVER_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(QPS_DRIVER_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/qps_driver

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/qps/qps_driver.o:  $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
deps_qps_driver: $(QPS_DRIVER_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(QPS_DRIVER_OBJS:.o=.dep)
endif
endif


QPS_TEST_SRC = \
    test/cpp/qps/qps_test.cc \

QPS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(QPS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/qps_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/qps_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/qps_test: $(PROTOBUF_DEP) $(QPS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(QPS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/qps_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/qps/qps_test.o:  $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
deps_qps_test: $(QPS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(QPS_TEST_OBJS:.o=.dep)
endif
endif


QPS_WORKER_SRC = \
    test/cpp/qps/worker.cc \

QPS_WORKER_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(QPS_WORKER_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/qps_worker: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/qps_worker: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/qps_worker: $(PROTOBUF_DEP) $(QPS_WORKER_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(QPS_WORKER_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/qps_worker

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/qps/worker.o:  $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_config.a
deps_qps_worker: $(QPS_WORKER_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(QPS_WORKER_OBJS:.o=.dep)
endif
endif


STATUS_TEST_SRC = \
    test/cpp/util/status_test.cc \

STATUS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(STATUS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/status_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/status_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/status_test: $(PROTOBUF_DEP) $(STATUS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(STATUS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/status_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/util/status_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_status_test: $(STATUS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(STATUS_TEST_OBJS:.o=.dep)
endif
endif


SYNC_STREAMING_PING_PONG_TEST_SRC = \
    test/cpp/qps/sync_streaming_ping_pong_test.cc \

SYNC_STREAMING_PING_PONG_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(SYNC_STREAMING_PING_PONG_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/sync_streaming_ping_pong_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/sync_streaming_ping_pong_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/sync_streaming_ping_pong_test: $(PROTOBUF_DEP) $(SYNC_STREAMING_PING_PONG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(SYNC_STREAMING_PING_PONG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/sync_streaming_ping_pong_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/qps/sync_streaming_ping_pong_test.o:  $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_sync_streaming_ping_pong_test: $(SYNC_STREAMING_PING_PONG_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(SYNC_STREAMING_PING_PONG_TEST_OBJS:.o=.dep)
endif
endif


SYNC_UNARY_PING_PONG_TEST_SRC = \
    test/cpp/qps/sync_unary_ping_pong_test.cc \

SYNC_UNARY_PING_PONG_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(SYNC_UNARY_PING_PONG_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/sync_unary_ping_pong_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/sync_unary_ping_pong_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/sync_unary_ping_pong_test: $(PROTOBUF_DEP) $(SYNC_UNARY_PING_PONG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(SYNC_UNARY_PING_PONG_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/sync_unary_ping_pong_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/qps/sync_unary_ping_pong_test.o:  $(LIBDIR)/$(CONFIG)/libqps.a $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_sync_unary_ping_pong_test: $(SYNC_UNARY_PING_PONG_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(SYNC_UNARY_PING_PONG_TEST_OBJS:.o=.dep)
endif
endif


THREAD_POOL_TEST_SRC = \
    test/cpp/server/thread_pool_test.cc \

THREAD_POOL_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(THREAD_POOL_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/thread_pool_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/thread_pool_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/thread_pool_test: $(PROTOBUF_DEP) $(THREAD_POOL_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(THREAD_POOL_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/thread_pool_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/server/thread_pool_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_thread_pool_test: $(THREAD_POOL_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(THREAD_POOL_TEST_OBJS:.o=.dep)
endif
endif


THREAD_STRESS_TEST_SRC = \
    test/cpp/end2end/thread_stress_test.cc \

THREAD_STRESS_TEST_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(THREAD_STRESS_TEST_SRC))))
ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/thread_stress_test: openssl_dep_error

else


ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.0.0+.

$(BINDIR)/$(CONFIG)/thread_stress_test: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/thread_stress_test: $(PROTOBUF_DEP) $(THREAD_STRESS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) $(THREAD_STRESS_TEST_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) $(LDLIBS_SECURE) $(GTEST_LIB) -o $(BINDIR)/$(CONFIG)/thread_stress_test

endif

endif

$(OBJDIR)/$(CONFIG)/test/cpp/end2end/thread_stress_test.o:  $(LIBDIR)/$(CONFIG)/libgrpc++_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
deps_thread_stress_test: $(THREAD_STRESS_TEST_OBJS:.o=.dep)

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(THREAD_STRESS_TEST_OBJS:.o=.dep)
endif
endif


ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_bad_hostname_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_bad_hostname_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_bad_hostname_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_and_writes_closed_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_and_writes_closed_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_accept_and_writes_closed_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_after_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_before_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_before_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_before_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_in_a_vacuum_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_in_a_vacuum_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_cancel_in_a_vacuum_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_census_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_census_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_census_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_disappearing_server_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_disappearing_server_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_disappearing_server_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_tags_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_tags_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_early_server_shutdown_finishes_tags_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_empty_batch_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_empty_batch_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_empty_batch_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_graceful_server_shutdown_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_graceful_server_shutdown_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_graceful_server_shutdown_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_invoke_large_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_invoke_large_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_invoke_large_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_max_concurrent_streams_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_max_concurrent_streams_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_max_concurrent_streams_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_max_message_length_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_max_message_length_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_max_message_length_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_no_op_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_no_op_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_no_op_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_ping_pong_streaming_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_ping_pong_streaming_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_ping_pong_streaming_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_registered_call_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_registered_call_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_registered_call_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_binary_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_binary_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_binary_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_and_call_creds_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_and_call_creds_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_payload_and_call_creds_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_large_metadata_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_large_metadata_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_large_metadata_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_request_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_server_finishes_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_server_finishes_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_server_finishes_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_delayed_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_delayed_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_delayed_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_with_high_initial_sequence_number_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_with_high_initial_sequence_number_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fake_security.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fake_security_simple_request_with_high_initial_sequence_number_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_and_call_creds_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_and_call_creds_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_and_call_creds_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_and_call_creds_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_and_call_creds_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_and_call_creds_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_bad_hostname_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_bad_hostname_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_bad_hostname_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_after_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_before_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_before_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_before_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_census_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_census_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_census_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_disappearing_server_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_disappearing_server_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_disappearing_server_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_empty_batch_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_empty_batch_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_empty_batch_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_graceful_server_shutdown_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_graceful_server_shutdown_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_graceful_server_shutdown_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_invoke_large_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_invoke_large_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_invoke_large_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_concurrent_streams_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_concurrent_streams_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_concurrent_streams_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_message_length_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_message_length_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_max_message_length_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_no_op_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_no_op_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_no_op_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_ping_pong_streaming_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_ping_pong_streaming_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_ping_pong_streaming_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_registered_call_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_registered_call_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_registered_call_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_large_metadata_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_large_metadata_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_large_metadata_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_request_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_server_finishes_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_server_finishes_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_server_finishes_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_delayed_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_delayed_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_delayed_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_no_op_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_no_op_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_no_op_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_and_call_creds_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_and_call_creds_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_and_call_creds_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload_and_call_creds.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_test

endif




ifeq ($(NO_SECURE),true)

# You can't build secure targets if you don't have OpenSSL with ALPN.

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test: openssl_dep_error

else

$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libend2end_certs.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) $(LDLIBS_SECURE) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test

endif




$(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_bad_hostname_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_after_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_before_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_cancel_in_a_vacuum_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_census_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_disappearing_server_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_empty_batch_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_graceful_server_shutdown_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_invoke_large_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_concurrent_streams_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_max_message_length_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_no_op_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_ping_pong_streaming_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_registered_call_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_large_metadata_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_request_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_server_finishes_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_delayed_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_bad_hostname_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_accept_and_writes_closed_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_after_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_before_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_cancel_in_a_vacuum_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_census_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_disappearing_server_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_inflight_calls_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_early_server_shutdown_finishes_tags_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_empty_batch_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_graceful_server_shutdown_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_invoke_large_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_concurrent_streams_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_max_message_length_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_no_op_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_ping_pong_streaming_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_registered_call_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_binary_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_response_with_trailing_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_large_metadata_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_request_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_server_finishes_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_delayed_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_fullstack_uds_posix.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_fullstack_uds_posix_simple_request_with_high_initial_sequence_number_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_bad_hostname_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_after_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_before_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_census_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_disappearing_server_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_empty_batch_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_graceful_server_shutdown_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_invoke_large_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_concurrent_streams_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_max_message_length_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_no_op_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_ping_pong_streaming_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_registered_call_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_large_metadata_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_request_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_server_finishes_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_delayed_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_one_byte_at_a_time.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_bad_hostname.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_accept_and_writes_closed.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_after_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_before_invoke.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_cancel_in_a_vacuum.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_census_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_disappearing_server.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_inflight_calls.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_early_server_shutdown_finishes_tags.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_empty_batch.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_graceful_server_shutdown.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_invoke_large_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_concurrent_streams.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_max_message_length.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_no_op.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_ping_pong_streaming.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_registered_call.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_binary_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_response_with_trailing_metadata_and_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_large_metadata.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_request_with_payload.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_server_finishes_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_delayed_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test




$(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test:  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LD) $(LDFLAGS)  $(LIBDIR)/$(CONFIG)/libend2end_fixture_chttp2_socket_pair_with_grpc_trace.a $(LIBDIR)/$(CONFIG)/libend2end_test_simple_request_with_high_initial_sequence_number.a $(LIBDIR)/$(CONFIG)/libgrpc_test_util_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libgpr_test_util.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LDLIBS) -o $(BINDIR)/$(CONFIG)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test








ifneq ($(OPENSSL_DEP),)
# This is to ensure the embedded OpenSSL is built beforehand, properly
# installing headers to their final destination on the drive. We need this
# otherwise parallel compilation will fail if a source is compiled first.
src/core/httpcli/format_request.c: $(OPENSSL_DEP)
src/core/httpcli/httpcli.c: $(OPENSSL_DEP)
src/core/httpcli/httpcli_security_connector.c: $(OPENSSL_DEP)
src/core/httpcli/parser.c: $(OPENSSL_DEP)
src/core/security/base64.c: $(OPENSSL_DEP)
src/core/security/client_auth_filter.c: $(OPENSSL_DEP)
src/core/security/credentials.c: $(OPENSSL_DEP)
src/core/security/credentials_posix.c: $(OPENSSL_DEP)
src/core/security/credentials_win32.c: $(OPENSSL_DEP)
src/core/security/google_default_credentials.c: $(OPENSSL_DEP)
src/core/security/json_token.c: $(OPENSSL_DEP)
src/core/security/secure_endpoint.c: $(OPENSSL_DEP)
src/core/security/secure_transport_setup.c: $(OPENSSL_DEP)
src/core/security/security_connector.c: $(OPENSSL_DEP)
src/core/security/security_context.c: $(OPENSSL_DEP)
src/core/security/server_auth_filter.c: $(OPENSSL_DEP)
src/core/security/server_secure_chttp2.c: $(OPENSSL_DEP)
src/core/surface/init_secure.c: $(OPENSSL_DEP)
src/core/surface/secure_channel_create.c: $(OPENSSL_DEP)
src/core/tsi/fake_transport_security.c: $(OPENSSL_DEP)
src/core/tsi/ssl_transport_security.c: $(OPENSSL_DEP)
src/core/tsi/transport_security.c: $(OPENSSL_DEP)
endif

.PHONY: all strip tools dep_error openssl_dep_error openssl_dep_message git_update stop buildtests buildtests_c buildtests_cxx test test_c test_cxx install install_c install_cxx install-headers install-headers_c install-headers_cxx install-shared install-shared_c install-shared_cxx install-static install-static_c install-static_cxx strip strip-shared strip-static strip_c strip-shared_c strip-static_c strip_cxx strip-shared_cxx strip-static_cxx dep_c dep_cxx bins_dep_c bins_dep_cxx clean
