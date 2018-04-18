# JM_TV

[![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg?style=for-the-badge)](https://www.apple.com/br/ios/ios-11/)
[![Compatibility](https://img.shields.io/badge/Compatibility-iPhone-lightgrey.svg?style=for-the-badge)](https://www.apple.com/br/iphone/)

[![Platform](https://img.shields.io/badge/iOS_Version-11.0+-green.svg?style=for-the-badge)](https://www.apple.com/br/ios/ios-11/)
[![Swift Version](https://img.shields.io/badge/swift-4.1-orange.svg?style=for-the-badge)](https://swift.org/)
[![XCode Version](https://img.shields.io/badge/Xcode_Version-9.3+-blue.svg?style=for-the-badge)](https://developer.apple.com/xcode/)

![JoaoMarcos](https://i0.wp.com/fllwtv.files.wordpress.com/2018/04/j-logo.png?ssl=1&w=450)

## Bem vindo

## Principais Funcionalidades
- Listar filmes com base na segmentação (Popular, em breve, dentre outras)
- Exibir maiores detalhes do filme escolhido
- Linguagem baseada na linguagem nativa do device

## O que falta ser desenvolvido
- Na tela de detalhes, realizar chamada para pegar maiores detalhes e exibi-los na tela
- Testes de Interface
- Testes unitários

## Bibliotecas Utilizadas 
- `Alamofire` (gerenciar requisições de todo o app)
- `AlamofireImage` (baixar imagens e cachear)
- `AlamofireNetworkActivityIndicator` (indicar o uso de rede através do activity de rede)
- `AlamofireNetworkActivityLogger` (printar todas as requisições, para facilitar o debug)
- `R.swift` (organizar de forma uniforme uso de segues, identifiers, xibs, strings)
- `SwiftLint` (aprimorar o padrão de código)

** Todas bibliotecas utilizadas com o `CocoaPods`

## Como executar o projeto
O projeto utiliza o Cocoapods, então basta instalar o `CocoaPods` na sua máquina:
```shell
sudo gem install cocoapods
```
Depois basta instalar os `Pods`:
```shell
pod install
```


