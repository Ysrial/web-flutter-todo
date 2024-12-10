# Web Flutter Todo

## Descrição do Projeto

Um aplicativo de gerenciamento de tarefas desenvolvido em Flutter para a Web e mobile, com persistência local de dados usando `SharedPreferences`. O projeto demonstra funcionalidades essenciais como adicionar, excluir e marcar tarefas como concluídas.

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
- Tarefas concluídas têm seu estilo alterado (ex.: texto riscado ou cinza).

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

   - Permitir que o usuário marque ou desmarque uma tarefa como concluída usando um botão ou checkbox.
   - Alterar o estilo da tarefa concluída, como adicionar um texto riscado ou mudar a cor do texto.

5. **Persistência de Dados**

   - Usar `SharedPreferences` para salvar a lista de tarefas localmente no dispositivo.
   - Garantir que as tarefas persistam após o fechamento e reabertura do aplicativo.

6. **Validação**
   - Impedir que o usuário adicione tarefas vazias, exibindo uma mensagem ou desabilitando o botão de adicionar caso o campo esteja vazio.

### Requisitos Não Funcionais

1. **Desempenho**

   - O sistema deve carregar a lista de tarefas rapidamente, mesmo quando o número de tarefas crescer.

2. **Usabilidade**

   - A interface deve ser simples e fácil de usar, com uma navegação intuitiva.
   - O design da aplicação deve ser responsivo, ajustando-se a diferentes tamanhos de tela (ex.: dispositivos móveis e tablets).

3. **Escalabilidade**

   - O sistema deve ser capaz de lidar com um número crescente de tarefas sem comprometer a performance (embora o foco inicial seja um número limitado de tarefas).

4. **Manutenibilidade**

   - O código deve ser modular e organizado, facilitando a manutenção e a expansão do sistema.

5. **Compatibilidade**

   - O sistema deve ser compatível com os navegadores modernos mais utilizados (ex.: Google Chrome, Firefox, Safari, Microsoft Edge).

6. **Segurança**
   - Os dados (tarefas) devem ser armazenados localmente usando `SharedPreferences`. Embora o `SharedPreferences` não seja o meio mais seguro para armazenamento de dados, ele foi escolhido devido a problemas de compatibilidade com a SDK do Java, garantindo o funcionamento da aplicação no navegador. Para ambientes de produção, deve-se considerar alternativas mais seguras, como armazenamento criptografado ou integração com APIs seguras de backend.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento multiplataforma.
- **Dart**: Linguagem de programação utilizada no desenvolvimento.
- **SharedPreferences**: Biblioteca para persistência de dados localmente.

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

5. Execute o aplicativo:
   ```bash
   flutter run -d chrome
   ```
