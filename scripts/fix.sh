build_appbundle(){
    read -p "Build Name[1.3.1]: " buildname
    read -p "Build Number[8]: " buildnumber
    buildname=${buildname:-1.3.1}
    buildnumber=${buildnumber:-8}
    flutter clean
    echo "$buildname versiyon kodu ve $buildnumber versiyon numarasına göre build işlemi başlatılıyor...."
    flutter build appbundle --build-name=$buildname --build-number=$buildnumber --obfuscate --split-debug-info=/Users/mus/obfuscates/iwallet/android --no-shrink
    exit 1
}

build_ipaiOS() {
    flutter clean
    rm -rf pubspec.lock
    echo "Paketler yeniden indiriliyor..."
    flutter pub get
    echo "IOS dosyasına geçiş yapıldı."
    cd ios
    rm -rf Podfile.lock
    rm -rf Pods/
    rm -rf .symlinks/
    echo "Pod dosyaları güncelleme izni alınıyor....."
    sudo arch -x86_64 gem install ffi
    echo "Pod dosyaları yükleniyor ve güncelleniyor...."
    arch -x86_64 pod install --repo-update
    echo "Ana dizine geri geldi.."
    cd ..
    echo "IOS build alınıyor......... Başlatıldı....."
    flutter build ipa --obfuscate --split-debug-info=/Users/mus/obfuscates/iwalletv3
    exit 1
}

build_releaseAPK(){
    flutter clean
    flutter build apk --release --obfuscate --split-debug-info=/Users/mus/obfuscates/v3/android --split-per-abi --no-shrink
    exit 1
}

build_testApk(){
    echo 'android/app/build.gradle dosyası içerisinde ayarları yapmayı unutmayın..'
    flutter build apk --split-per-abi --no-shrink 
    exit 1
}

exception_fix(){
    echo "Temizlik başlıyor...."
    rm -rf ios/Pods  
    rm -rf ios/Podfile.lock
    flutter clean
    flutter pub get
    echo "ios dosyasına geçiş yapılıyor..."
    cd ios 
    echo "Pod dosyaları yükleniyor.."
    sudo arch -x86_64 gem install ffi
    echo "Pod dosyaları güncelleniyor.."
    arch -x86_64 pod install --repo-update
    cd ..
    exit 1
}


PS3="Lütfen bir işlem seçin:"

select lng in Appbundle_Release Export_IPA Release_APK Test_APK Fix_iOS_Exception
do
    case $lng in
        "Appbundle_Release")
            build_appbundle;;
         "Release_APK")
            build_releaseAPK;;
        "Export_IPA")
           build_ipaiOS;;
        "Test_APK")
           build_testApk;;
        "Fix_iOS_Exception")
          exception_fix;;
        *)
          echo "İşlem başarız çıkış yapılıyor.Seçiminiz:$choice"
          exit 1
    esac
done


read -r -p 'Pubspec.yaml dosyasınızda versiyon kodlarını kontrol ettiğinizden emin olun!!(e/h):' choice

if [ "$choice" = 'e' ] || [ "$choice" = 'E' ]; then
    build_funciton
    
fi

