message("Starting etcd-cpp-apiv3 find process")

# Try to locate the library and include directories
find_path(ETCD_CPP_API_INCLUDE_DIR
  NAMES etcd/Client.hpp
  HINTS ${CMAKE_PREFIX_PATH}
)

find_library(ETCD_CPP_API_LIBRARY
  NAMES etcd-cpp-api
  HINTS ${CMAKE_PREFIX_PATH}
)

# Print the paths that were found
message("ETCD_CPP_API_INCLUDE_DIR fuck: ${ETCD_CPP_API_INCLUDE_DIR}")
message("ETCD_CPP_API_LIBRARY fuck: ${ETCD_CPP_API_LIBRARY}")

# Handle the case where the library is not found
if(NOT ETCD_CPP_API_INCLUDE_DIR OR NOT ETCD_CPP_API_LIBRARY)
  message(FATAL_ERROR "Could not find etcd-cpp-apiv3")
endif()

# Export the results to the parent scope
set(ETCD_CPP_API_INCLUDE_DIRS ${ETCD_CPP_API_INCLUDE_DIR} PARENT_SCOPE)
set(ETCD_CPP_API_LIBRARIES ${ETCD_CPP_API_LIBRARY} PARENT_SCOPE)

message("Successfully found etcd-cpp-apiv3")
