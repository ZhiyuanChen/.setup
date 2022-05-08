mkdir tmp

curl -Ls https://api.github.com/repos/microsoft/cascadia-code/releases/latest | grep -wo "https.*CascadiaCode-.*.zip" | xargs curl -L -o tmp/CascadiaCode.zip
unzip -q tmp/CascadiaCode.zip -d tmp/CascadiaCode
rm -rf tmp/CascadiaCode/ttf/static
sudo mv tmp/CascadiaCode/ttf /usr/share/fonts/CascadiaCode

curl -Ls https://api.github.com/repos/imaandrew/caskaydia-cove/releases/latest | grep -wo "https.*caskaydia.zip" | xargs curl -L -o tmp/CaskaydiaCove.zip
unzip -q tmp/CaskaydiaCove.zip -d tmp/CaskaydiaCove
sudo mv tmp/CaskaydiaCove/caskaydia /usr/share/fonts/CaskaydiaCove

rm -rf tmp
