$1 = $args[0]

# Remove previous libphonenumber
Remove-Item -Recurse libphonenumber/*

# Download the requested tagged release.
Write-Output "Downloading release $1..."

Invoke-WebRequest -Uri "https://github.com/googlei18n/libphonenumber/archive/v$1.tar.gz" -OutFile "v$1.tar.gz"

tar -xf "v$1.tar.gz"

Copy-Item "libphonenumber-$1/javascript/i18n/phonenumbers/*" "libphonenumber/"

Remove-Item "v$1.tar.gz"

Remove-Item -Recurse "libphonenumber-$1"

Write-Output "Done!"

