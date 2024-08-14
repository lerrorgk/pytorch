cmake_minimum_required(VERSION 3.1)

set(TORCH_ROOT ${CMAKE_CURRENT_LIST_DIR}/../../..)
set(TEST_ROOT ${TORCH_ROOT}/test/mobile/lightweight_dispatch)

add_executable(test_codegen_unboxing
  ${TEST_ROOT}/test_lightweight_dispatch.cpp
  ${TEST_ROOT}/test_codegen_unboxing.cpp
)

target_include_directories(test_codegen_unboxing PRIVATE ${ATen_CPU_INCLUDE} ${ETCD_CPP_API_INCLUDE_DIR})

target_compile_definitions(test_codegen_unboxing PRIVATE USE_GTEST)

set(TEST_UNBOXING_DEPENDENCIES torch gtest)

find_package(etcd-cpp-apiv3 REQUIRED)
target_link_libraries(test_codegen_unboxing PRIVATE
  ${TEST_UNBOXING_DEPENDENCIES}
  etcd-cpp-api
)

if(INSTALL_TEST)
  install(TARGETS test_codegen_unboxing DESTINATION bin)
endif()
