# PokeGuide

2024/04/26 - v1.0.01: Adifionado FToast

## Status do Desenvolvimento

O MVVM e o gerenciamento de estado implementados com sucesso. A tela inicial possui rolagem infinita e a página do Pokémon está recebendo dados da API com êxito utilizando a arquitetura MVVM.

Tentei ser o mais minimalista possível para deixar o app o mais claro possível. Ele está basicamente dividido em três partes (MVVM):

- Models: responsável pelo gerenciamento dos dados.
- Views: responsável pelo gerenciamento das telas.
- ViewModel: contém a lógica do sistema, fornecendo dados prontos para as views.

A **interface gráfica e testes unitários ainda não foram desenvolvidos** devido à falta de tempo. Transformar uma arte pronta, pixel por pixel, em uma tela Flutter não é das tarefas mais difíceis, então no momento o app está utilizando uma interface extremamente básica, pois foquei na lógica de programação e na arquitetura MVVM.

Graficamente, adicionei apenas algumas pequenas features que demonstram meu conhecimento:
- O ícone do Pokémon no Listview Builder, enquanto carrega, mostra um activity indicator e uma Pokébola. É rápido, mas está presente.
- NavigationBar: uma simples implementação de uma barra de navegação customizada.
- Toasts, mesmo que desnecessário neste aplicativo, foi adicionado pois o package foi customizado por mim. Baseado no FToast, customizei as animações, estilo e aprimorei a fila. Muito interessante é que ele permanece na tela mesmo se ocorrer transição de telas, o que é importante caso haja fila de toasts. Package: https://github.com/thomasfranke/flutter_package_toast

Algumas Widgets/Features customizadas para padronizar o sistema:

- API
- FutureBuilder
- Scaffold

Em breve:
- Dark Mode / Themes
- Multi Idioma
- Interface Gráfica
- Splash Screen

## BLoC vs MobX

Estou ciente de que foi pedido MobX para este projeto, no entanto, devido à falta de tempo e ao fato de o Bloc ser um gerenciamento de estado extremamente eficaz e talvez o mais popular de todos, além de ser um tanto similar ao MobX, acabei optando por ele.

Caso desejem, posso fazer a conversão para MobX. Pelo que li na documentação, ele é um tanto parecido com o Bloc, no fim a lógica é muito similar entre os gerenciadores de estado.

## Estrutura MVVM

### /Constants
Constantes que afetam todo o aplicativo, como cores, tamanhos de fonte, estilos de texto e outras configurações globais. Manter essas variáveis centralizadas facilita a manutenção e a consistência visual do aplicativo.

### /Cubits
Cubits do Flutter Bloc. Os Cubits são classes que gerenciam o estado da aplicação de acordo com a arquitetura BLoC (Business Logic Component). Cada Cubit é responsável por um model.

### /Localization
Strings que podem ser traduzidas para outros idiomas.

### /Models
Classes de modelo que representam os dados do seu aplicativo.

### /Services - API e VIEWMODELS
Classes responsáveis por interagir com serviços externos, como APIs REST. Manter a lógica de integração separada dos Cubits e ViewModels ajuda a manter uma arquitetura limpa e organizada.

### /Views
Telas (ou páginas) do seu aplicativo. Cada tela aplicativo possui sua própria pasta ou arquivo nesta seção. As telas possuem uma lógica mínima e geralmente se concentram na exibição dos dados fornecidos pelos ViewModels através dos Cubits.

### /Widgets
Widgets reutilizáveis.

# Wakatime:
https://wakatime.com/@81ee337c-1e3d-460c-9004-b1ee1d921524/projects/qlhhsekbac?start=2024-04-23&end=2024-04-23