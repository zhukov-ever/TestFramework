rm -rf ./bin/tmp/*
rm -rf ./bin/build/*
rm -rf ./bin/release/*

mkdir ./bin/tmp
mkdir ./bin/build
mkdir ./bin/release
mkdir ./Framework

WORKSPACE_NAME="TestFramework"
SCHEME_NAME="TestFramework"

xcodebuild -workspace ${WORKSPACE_NAME}.xcworkspace \
    -scheme ${SCHEME_NAME} \
    -derivedDataPath ./bin/dd \
    -archivePath ./bin/archive/ios.xcarchive \
    SKIP_INSTALL=NO \
    ENABLE_BITCODE=YES OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode \
    clean build \
    -sdk iphoneos

cp -R ./bin/dd/Build/Products/Debug-iphoneos/${WORKSPACE_NAME}.framework ./bin/tmp/${WORKSPACE_NAME}.framework
cp -R ./bin/dd/Build/Products/Debug-iphoneos/${WORKSPACE_NAME}.framework ./bin/release/${WORKSPACE_NAME}.framework

xcodebuild -workspace ${WORKSPACE_NAME}.xcworkspace \
    -scheme ${SCHEME_NAME} \
    -derivedDataPath ./bin/dd \
    -archivePath ./bin/archive/iossim.xcarchive \
    -destination 'platform=iOS Simulator,name=iPhone 11' \
    SKIP_INSTALL=NO \
    ENABLE_BITCODE=YES OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode \
    clean build \
    -sdk iphonesimulator

cp -R ./bin/dd/Build/Products/Debug-iphonesimulator/${SCHEME_NAME}.framework/Modules/${SCHEME_NAME}.swiftmodule/ \
    ./bin/release/${SCHEME_NAME}.framework/Modules/${SCHEME_NAME}.swiftmodule/

lipo -create -output ./bin/release/${SCHEME_NAME}.framework/${SCHEME_NAME} \
    ./bin/tmp/${SCHEME_NAME}.framework/${SCHEME_NAME} \
    ./bin/dd/Build/Products/Debug-iphonesimulator/${SCHEME_NAME}.framework/${SCHEME_NAME}

lipo -info ./bin/release/${SCHEME_NAME}.framework/${SCHEME_NAME}

cp -R ./bin/release/${SCHEME_NAME}.framework ./Framework/
