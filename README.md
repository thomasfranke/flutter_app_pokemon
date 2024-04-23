# PokeGuide

## /Constants
Constantes que afetam todo o aplicativo, como cores, tamanhos de fonte, estilos de texto e outras configurações globais. Manter essas variáveis centralizadas facilita a manutenção e a consistência visual do aplicativo.

# /Cubits
Cubits do Flutter Bloc. Os Cubits são classes que gerenciam o estado da aplicação de acordo com a arquitetura BLoC (Business Logic Component). Cada Cubit pode ser responsável por uma parte específica do estado do aplicativo.

# /Localization
Strings que podem ser traduzidas para outros idiomas.

# /Models
Classes de modelo que representam os dados do seu aplicativo.

# /Services
Classes responsáveis por interagir com serviços externos, como APIs REST. Manter a lógica de integração separada dos Cubits e ViewModels ajuda a manter uma arquitetura limpa e organizada.

# /Views
Telas (ou páginas) do seu aplicativo. Cada tela do seu aplicativo terá sua própria pasta ou arquivo nesta seção. As telas possuemuma lógica mínima e geralmente se concentram na exibição dos dados fornecidos pelos ViewModels.

# /Widgets
Widgets reutilizáveis que podem ser usados em várias telas do seu aplicativo. Esses widgets podem incluir botões personalizados, caixas de diálogo, barras de navegação personalizadas e outros componentes de interface do usuário que são usados em todo o aplicativo.

