# Web Flutter Todo

## Descrição do Projeto

Um aplicativo de gerenciamento de tarefas desenvolvido em Flutter para a Web e Mobile, com persistência local de dados usando `SharedPreferences`. O projeto demonstra funcionalidades essenciais como adicionar, excluir e marcar tarefas como concluídas.

## Funcionalidades

### Tela Inicial

- Exibe uma lista com todas as tarefas cadastradas.
- Caso não haja tarefas cadastradas, exibe uma mensagem indicando a ausência de tarefas.
- Disponibiliza um botão que leva o usuário para a tela de adição de tarefas.

### Adicionar Tarefa

- Permite ao usuário inserir um título para a tarefa e adicioná-la à lista.

### Excluir Tarefa

- Botão ao lado de cada item da lista para excluir a tarefa correspondente.

### Marcar como Concluída

- Checkbox interativo que permite marcar ou desmarcar uma tarefa como concluída.
- Tarefas concluídas têm seu estilo alterado.

### Persistência de Dados

- Salva a lista de tarefas localmente usando `SharedPreferences`.
- As tarefas persistem mesmo após o fechamento e reabertura do aplicativo.

### Validação

- Impede que o usuário adicione tarefas vazias.
- Exibe uma mensagem de erro ou desabilita o botão de adicionar caso o campo esteja vazio.

## Requisitos do Projeto

### Requisitos Funcionais

1. **Tela Inicial**

   - Exibir uma lista de tarefas cadastradas.
   - Se não houver tarefas cadastradas, exibir uma mensagem indicando que não há tarefas.
   - Disponibilizar um botão que leva o usuário para a tela de adição de tarefas.

2. **Adicionar Tarefa**

   - Permitir que o usuário insira um título para a tarefa em uma tela separada.
   - Incluir um botão para salvar a tarefa e adicioná-la à lista.

3. **Excluir Tarefa**

   - Adicionar um botão ao lado de cada item da lista para permitir a exclusão de tarefas.

4. **Marcar como Concluída**

   - Permitir que o usuário marque ou desmarque uma tarefa como concluída usando um checkbox.
   - Alterar o estilo da tarefa concluída, como adicionar um texto riscado.

5. **Persistência de Dados**

   - Garantir que as tarefas persistam após o fechamento e reabertura do aplicativo.

6. **Validação**
   - Impedir que o usuário adicione tarefas vazias.

### Requisitos Não Funcionais

1. **Desempenho**

   - O sistema deve carregar a lista de tarefas rapidamente, mesmo quando o número de tarefas crescer.

2. **Usabilidade**

   - A interface deve ser simples e fácil de usar, com uma navegação intuitiva.
   - O design da aplicação deve ser responsivo, ajustando-se a diferentes tamanhos de tela.

3. **Escalabilidade**

   - O sistema deve ser capaz de lidar com um número crescente de tarefas sem comprometer a performance.

4. **Manutenibilidade**

   - O código deve ser modular e organizado, facilitando a manutenção e a expansão do sistema.

5. **Compatibilidade**

   - O sistema deve ser compatível com navegadores modernos mais utilizados (ex.: Google Chrome, Firefox, Safari, Microsoft Edge).
   - O aplicativo deve funcionar em dispositivos móveis e tablets com sistemas operacionais Android.

6. **Segurança**
   - Os dados (tarefas) devem ser armazenados localmente usando `SharedPreferences`.

## Tecnologias Utilizadas

### Frameworks e Linguagens

- **Flutter**: Framework para desenvolvimento multiplataforma.
- **Dart**: Linguagem de programação utilizada no desenvolvimento.

### Bibliotecas Utilizadas

- **shared_preferences** (v^2.0.15): Biblioteca para persistência de dados localmente.
- **uuid** (v^3.0.6): Geração de identificadores únicos universais.
- **provider** (v^6.0.5): Gerenciador de estado.

## Possíveis Melhorias e Implementações

1. **Modo Claro e Noturno**

   - Implementar a funcionalidade para alternar entre os modos claro e noturno, permitindo que o usuário escolha a interface que melhor se adapta ao seu ambiente de visualização.

2. **Funcionalidade de Lixeira**

   - Adicionar um sistema de "lixeira" para tarefas excluídas, permitindo que o usuário recupere tarefas deletadas acidentalmente antes de serem removidas permanentemente.

3. **Atualizar Tarefa**

   - Permitir a funcionalidade de editar ou atualizar as tarefas já criadas, proporcionando a opção de modificar o título ou outros atributos das tarefas.

4. **Pesquisar Tarefa**

   - Implementar uma funcionalidade de busca, permitindo que o usuário pesquise tarefas por título ou por palavras-chave específicas.

5. **Filtrar Tarefas**

   - Adicionar filtros para tarefas, permitindo que o usuário as organize por categorias, prioridades ou datas de vencimento.

6. **Adicionar Categoria à Tarefa**

   - Ao criar uma tarefa, permitir que o usuário adicione uma categoria, facilitando a organização e classificação das tarefas.

7. **Adicionar Prioridade à Tarefa**

   - Ao criar uma tarefa, permitir que o usuário defina uma prioridade (baixa, média, alta), ajudando a priorizar as tarefas mais urgentes.

8. **Notificação com Data e Hora Específica**
   - Permitir que o usuário defina uma data e uma hora específica para uma tarefa e, a partir disso, enviar uma notificação para lembrá-lo da tarefa na data e hora estabelecidas.

## Como Executar o Projeto

1. Certifique-se de que o Flutter está instalado em sua máquina.
2. Clone este repositório:

   ```bash
   git clone https://github.com/Ysrial/web_flutter_todo.git
   ```

3. Navegue até o diretório do projeto:

   ```bash
   cd web_flutter_todo
   ```

4. Instale as dependências do projeto:

   ```bash
   flutter pub get
   ```

5. Execute o aplicativo na Web:
   ```bash
   flutter run -d chrome
   ```
   
5. Execute o aplicativo no Android:
   ```bash
   flutter run
   ```
