Remove-Item -Recurse dist/*

Write-Output "Compiling using Google Closure Compiler..."

npx google-closure-compiler `
    --compilation_level=SIMPLE `
    --js=node_modules/google-closure-library/closure/goog/array/array.js `
    --js=node_modules/google-closure-library/closure/goog/asserts/asserts.js `
    --js=node_modules/google-closure-library/closure/goog/base.js `
    --js=node_modules/google-closure-library/closure/goog/debug/error.js `
    --js=node_modules/google-closure-library/closure/goog/dom/asserts.js `
    --js=node_modules/google-closure-library/closure/goog/dom/htmlelement.js `
    --js=node_modules/google-closure-library/closure/goog/dom/nodetype.js `
    --js=node_modules/google-closure-library/closure/goog/dom/safe.js `
    --js=node_modules/google-closure-library/closure/goog/dom/tagname.js `
    --js=node_modules/google-closure-library/closure/goog/dom/tags.js `
    --js=node_modules/google-closure-library/closure/goog/fs/blob.js `
    --js=node_modules/google-closure-library/closure/goog/fs/url.js `
    --js=node_modules/google-closure-library/closure/goog/functions/functions.js `
    --js=node_modules/google-closure-library/closure/goog/html/safehtml.js `
    --js=node_modules/google-closure-library/closure/goog/html/safescript.js `
    --js=node_modules/google-closure-library/closure/goog/html/safestyle.js `
    --js=node_modules/google-closure-library/closure/goog/html/safestylesheet.js `
    --js=node_modules/google-closure-library/closure/goog/html/safeurl.js `
    --js=node_modules/google-closure-library/closure/goog/html/trustedresourceurl.js `
    --js=node_modules/google-closure-library/closure/goog/html/trustedtypes.js `
    --js=node_modules/google-closure-library/closure/goog/html/uncheckedconversions.js `
    --js=node_modules/google-closure-library/closure/goog/i18n/bidi.js `
    --js=node_modules/google-closure-library/closure/goog/labs/useragent/browser.js `
    --js=node_modules/google-closure-library/closure/goog/labs/useragent/util.js `
    --js=node_modules/google-closure-library/closure/goog/object/object.js `
    --js=node_modules/google-closure-library/closure/goog/proto2/descriptor.js `
    --js=node_modules/google-closure-library/closure/goog/proto2/fielddescriptor.js `
    --js=node_modules/google-closure-library/closure/goog/proto2/lazydeserializer.js `
    --js=node_modules/google-closure-library/closure/goog/proto2/message.js `
    --js=node_modules/google-closure-library/closure/goog/proto2/pbliteserializer.js `
    --js=node_modules/google-closure-library/closure/goog/proto2/serializer.js `
    --js=node_modules/google-closure-library/closure/goog/string/const.js `
    --js=node_modules/google-closure-library/closure/goog/string/internal.js `
    --js=node_modules/google-closure-library/closure/goog/string/string.js `
    --js=node_modules/google-closure-library/closure/goog/string/stringbuffer.js `
    --js=node_modules/google-closure-library/closure/goog/string/typedstring.js `
    --js=libphonenumber/metadata.js `
    --js=libphonenumber/phonemetadata.pb.js `
    --js=libphonenumber/phonenumber.pb.js `
    --js=libphonenumber/phonenumberutil.js `
    --js=libphonenumber/shortnumberinfo.js `
    --js=libphonenumber/shortnumbermetadata.js `
    --js=libphonenumber/asyoutypeformatter.js `
    --js=src/index.js `
    --js_output_file=dist/libphonenumber.original.js

npx browserify dist/libphonenumber.original.js --standalone libphonenumber --no-browser-field --outfile dist/libphonenumber.js

Remove-Item dist/libphonenumber.original.js

Write-Output "Build completed!"
