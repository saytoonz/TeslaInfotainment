cmake_minimum_required(VERSION 3.16)

project(TeslaInfotainment VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTeslaInfotainment
    main.cpp
)

qt_add_qml_module(appTeslaInfotainment
    URI TeslaInfotainment
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES ui/BottomBar/BottomBar.qml
        QML_FILES ui/RightScreen/RightScreen.qml
        QML_FILES ui/LeftScreen/LeftScreen.qml
        RESOURCES ui/assets/carRender.png
        RESOURCES ui/assets/carRender.png
        RESOURCES
        RESOURCES
        RESOURCES
        SOURCES controllers/system.h controllers/system.cpp
        RESOURCES ui/assets/car.png ui/assets/lock.png ui/assets/unlock.png
        QML_FILES ui/RightScreen/NavigationSearchBar.qml
        RESOURCES ui/assets/search.png ui/assets/user.png
        SOURCES controllers/hvachandler.h controllers/hvachandler.cpp
        QML_FILES ui/BottomBar/HVACComponent.qml
        RESOURCES
        RESOURCES
        SOURCES controllers/audiocontroller.h controllers/audiocontroller.cpp
        QML_FILES ui/BottomBar/VolumeControlComponent.qml
        RESOURCES  ui/assets/medium-volume.png ui/assets/volume-mute.png
        RESOURCES ui/assets/high-volume.png ui/assets/low-volume.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTeslaInfotainment PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTeslaInfotainment
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTeslaInfotainment
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTeslaInfotainment
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
