cmake_minimum_required(VERSION 3.21)
project(HelloWorld VERSION 1.0.0)

if (NOT DEFINED ENV{GEODE_SDK})
    message(FATAL_ERROR "Не знайдено Geode SDK! Визнач змінну середовища GEODE_SDK.")
else()
    message(STATUS "Знайдено Geode: $ENV{GEODE_SDK}")
endif()

add_subdirectory($ENV{GEODE_SDK} ${CMAKE_CURRENT_BINARY_DIR}/geode)

file(GLOB SOURCES
    src/*.cpp
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

setup_geode_mod(${PROJECT_NAME})
