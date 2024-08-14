if(USE_DISTRIBUTED AND NOT WIN32)
  set(DIST_AUTOGRAD_TEST_DIR "${TORCH_ROOT}/test/cpp/dist_autograd")
  set(DIST_AUTOGRAD_TEST_SOURCES
    ${TORCH_ROOT}/test/cpp/common/main.cpp
    ${DIST_AUTOGRAD_TEST_DIR}/test_dist_autograd.cpp
  )

  add_executable(test_dist_autograd ${DIST_AUTOGRAD_TEST_SOURCES})
  target_include_directories(test_dist_autograd PRIVATE ${ATen_CPU_INCLUDE} ${ETCD_CPP_API_INCLUDE_DIR})
  find_package(etcd-cpp-apiv3 REQUIRED)
  target_link_libraries(test_dist_autograd PRIVATE torch gtest etcd-cpp-api)

  if(USE_CUDA)
    target_compile_definitions(test_dist_autograd PRIVATE "USE_CUDA")
  endif()

  if(INSTALL_TEST)
    install(TARGETS test_dist_autograd DESTINATION bin)
    # Install PDB files for MSVC builds
    if(MSVC AND BUILD_SHARED_LIBS)
      install(FILES $<TARGET_PDB_FILE:test_dist_autograd> DESTINATION bin OPTIONAL)
    endif()
  endif()
endif()
