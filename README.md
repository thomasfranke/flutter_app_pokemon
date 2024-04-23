# PokeGuide

## Status do Desenvolvimento

O MVVM e o gerenciamento de estado foram implementados com sucesso. A tela inicial possui rolagem infinita e a página do Pokémon está recebendo dados da API com êxito utilizando a arquitetura MVVM.

O aplicativo está basicamente dividido em três partes (MVVM):

- Models: responsável pelo gerenciamento dos dados.
- Views: responsável pelo gerenciamento das telas.
- ViewModel: contém a lógica do sistema, fornecendo dados prontos para as views.


A interface gráfica **ainda não foi desenvolvida** devido à falta de tempo. Transformar uma arte pronta, pixel por pixel, em uma tela Flutter não é das tarefas mais difíceis. Portanto, foquei na lógica de programação e na arquitetura MVVM.

Graficamente, adicionei apenas algumas pequenas features que demonstram meu conhecimento:
- O ícone do Pokémon no Listview Builder, enquanto carrega, mostra um activity indicator e uma Pokébola. É rápido, mas está presente.
- Utilizei Hero, que proporciona uma transição suave ao abrir a tela do Pokémon.
- Implementei Toasts, mesmo que desnecessário neste aplicativo, pois é um fork do FToast, onde customizei as animações, estilo e aprimorei a fila.
- Criei uma NavigationBar: uma simples implementação de uma barra de navegação customizada.

Algumas Widgets/Features customizadas para padronizar o sistema:

- FutureBuilder e requisições à API: utilizam classes customizadas que criei para padronizar as requisições e seus erros.
- Scaffold

## BLoC vs MobX

Estou ciente de que foi pedido MobX para este projeto, no entanto, devido à falta de tempo e ao fato de o Bloc ser um gerenciamento de estado extremamente eficaz e talvez o mais popular de todos, além de ser um tanto similar ao MobX, acabei optando por ele. É possível que eu já tenha alguma experiência com Cubits e suas peculiaridades.

Caso desejem, posso fazer a conversão para MobX. Pelo que li na documentação, ele é um tanto parecido com o Bloc.

## Estrutura MVVM

### /Constants
Constantes que afetam todo o aplicativo, como cores, tamanhos de fonte, estilos de texto e outras configurações globais. Manter essas variáveis centralizadas facilita a manutenção e a consistência visual do aplicativo.

### /Cubits
Cubits do Flutter Bloc. Os Cubits são classes que gerenciam o estado da aplicação de acordo com a arquitetura BLoC (Business Logic Component). Cada Cubit pode ser responsável por uma parte específica do estado do aplicativo.

### /Localization
Strings que podem ser traduzidas para outros idiomas.

### /Models
Classes de modelo que representam os dados do seu aplicativo.

### /Services
Classes responsáveis por interagir com serviços externos, como APIs REST. Manter a lógica de integração separada dos Cubits e ViewModels ajuda a manter uma arquitetura limpa e organizada.

### /Views
Telas (ou páginas) do seu aplicativo. Cada tela do seu aplicativo terá sua própria pasta ou arquivo nesta seção. As telas possuemuma lógica mínima e geralmente se concentram na exibição dos dados fornecidos pelos ViewModels.

### /Widgets
Widgets reutilizáveis que podem ser usados em várias telas do seu aplicativo. Esses widgets podem incluir botões personalizados, caixas de diálogo, barras de navegação personalizadas e outros componentes de interface do usuário que são usados em todo o aplicativo.

