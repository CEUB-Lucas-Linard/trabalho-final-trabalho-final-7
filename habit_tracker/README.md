# 📘 Documentação do Aplicativo Habit Tracker

## 🧾 Sumário

1. [Descrição do Projeto](#descrição-do-projeto)
2. [Funcionalidades Principais](#funcionalidades-principais)
3. [Histórias de Usuário](#histórias-de-usuário)
4. [Arquitetura e Estrutura de Pastas](#arquitetura-e-estrutura-de-pastas)
5. [Instalação e Execução Local](#instalação-e-execução-local)
6. [Dependências](#dependências)
7. [Guia de Uso do Aplicativo](#guia-de-uso-do-aplicativo)

## 📌 Descrição do Projeto

Desenvolvido como trabalho final da disciplina de Programação para Dispositivos Móveis, **Habit Tracker** é um aplicativo Flutter voltado para **desenvolvimento pessoal**, com foco na criação e manutenção de **hábitos diários**. Ele permite que o usuário registre atividades, marque sua realização ao longo dos dias e acompanhe seu progresso com gráficos e estatísticas detalhadas.

## ✅ Funcionalidades Principais

- Crud de hábitos
- Página individual de cada hábito
- Marcação diária da realização do hábito (via calendário interativo)
- Navegação por dias anteriores
- Estatísticas de realização (última semana, mês, ano e total)
- Gráfico mensal de realização --- Em desenvolvimento
- Gameficação com streak de dias --- Em desenvolvimento
- Notificações para o usuário --- Em desenvolvimento
- Salvamento local persistente dos dados
- Interface simples, clara e responsiva

## 👥 Histórias de Usuário

### Gerenciamento de Hábitos

- 01: Como usuário, quero criar um hábito, para que eu possa acompanhar minha prática.
- 02: Como usuário, quero editar um hábito, para corrigir ou ajustar seu nome.
- 03: Como usuário, quero excluir um hábito, para remover hábitos que não acompanho mais.

### Registro Diário

- 04: Como usuário, quero marcar que realizei um hábito num determinado dia.
- 05: Como usuário, quero poder marcar hábitos em dias anteriores.

### Página do Hábito

- 06: Como usuário, quero ver uma página dedicada a cada hábito.
- 07: Como usuário, quero ver um calendário com os dias marcados e um gráfico mensal.
- 08: Como usuário, quero visualizar estatísticas da minha frequência.

### Persistência

- 09: Como usuário, quero que os dados sejam salvos localmente mesmo ao fechar o app.

### Notificações

- 10: Como usuário, quero receber lembretes sore meus hábitos para não perder minha streak.

## 🏗️ Arquitetura e Estrutura de Pastas

O projeto segue uma estrutura modular e utiliza o **Provider** para gerenciamento de estado.

```plaintext
lib/
├── main.dart                           # Ponto de entrada
├── src/
│   ├── app.dart                        # MaterialApp e rotas
│   ├── models/
│   │   └── habit.dart                  # Modelo do hábito
│   ├── providers/
│   │   └── habit_provider.dart         # Lógica e estado dos hábitos
│   ├── screens/
│   │   ├── home_screen.dart            # Tela principal com lista de hábitos
│   │   ├── new_habit_screen.dart       # Tela de criação de hábito
│   │   └── habit_detail_screen.dart    # Tela individual de cada hábito
│   └── utils/
│       └── storage_util.dart           # Persistência com SharedPreferences
```

## 💻 Instalação e Execução Local

### Pré-requisitos:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Visual Studio Code com extensão Flutter ou Android Studio
- Git (opcional, para versionamento)

### Passos:

1. Clone ou baixe este repositório.
2. Navegue até a pasta do projeto:
   ```bash
   cd habit_tracker
   ```
3. Instale as dependências:
   ```bash
   flutter pub get
   ```
4. Execute em modo debug:
   ```bash
   flutter run
   ```

> ⚠️ Se você estiver usando Windows, certifique-se de que o **Developer Mode** está ativado (`start ms-settings:developers`).

## 📦 Dependências

O `pubspec.yaml` inclui:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.5
  shared_preferences: ^2.5.3
  table_calendar: ^3.0.9
```

## 🧑 Guia de Uso do Aplicativo

Este guia apresenta, de forma clara e objetiva, como utilizar cada funcionalidade do aplicativo **Habit Tracker**, desde o cadastro de hábitos até a análise estatística de desempenho.

### Tela Inicial – Lista de Hábitos

Ao abrir o aplicativo, você verá a **lista de hábitos cadastrados**. Cada hábito é exibido com seu nome e um botão de acesso à sua **página detalhada**.

**O que você pode fazer?**

- Ver todos os seus hábitos
- Clicar sobre um hábito para abrir sua página detalhada
- Adicionar um novo hábito tocando no botão de "+"
- Editar o nome de um hábito tocando no ícone de lápis ao lado de seu nome
- Excluir um hábito tocando no ícone de lixeira ao lado de seu nome

### Criar Novo Hábito

Ao tocar no botão de **"+"**, você será direcionado à tela de **criação de um novo hábito**.

**Como usar:**

1. Digite o nome do novo hábito (ex: "Ler", "Fazer exercícios").
2. Confirme a criação pressionando o botão de "Adicionar".

> O hábito será adicionado automaticamente à lista principal.

### Página do Hábito

Ao tocar em qualquer hábito da lista, você acessa sua **página individual**. Nela você poderá **registrar** a realização diária e visualizar um **resumo estatístico**.

Aqui você pode:

**Marcar dias realizados**

- Use o **calendário interativo** para marcar ou desmarcar um dia específico como **realizado**.
- Basta **tocar na data** desejada para alternar o status.

**Navegação por dias**

- Use as **setas do calendário** para navegar entre os meses e visualizar o histórico.

### Estatísticas do Hábito

Abaixo do calendário, a página do hábito mostra um resumo da sua frequência de realização:

- **Última semana**: Total de dias marcados nos últimos 7 dias.
- **Último mês**: Total de dias marcados nos últimos 30 dias.
- **Último ano**: Total de dias marcados nos últimos 365 dias.
- **Desde sempre**: Total absoluto de dias registrados.

### Salvamento Automático

Todas as suas interações (criar hábito, marcar dias, etc.) são **salvas automaticamente** no dispositivo. Você não precisa se preocupar com salvar manualmente.
